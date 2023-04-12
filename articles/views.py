import random

from django.shortcuts import render, redirect

from django.urls import reverse
from django.views import generic
from comments.views import CommentForm
from comments.models import Author, FavouriteArticles
from django.http import Http404
from . import models


def article(request, search:str):
    '''
        Search an article and display it, in case of a multiple coincidence, displays a list of the results and related articles of these results
    '''

    if search.isnumeric():  # Search by id
        article = models.Article.objects.filter(id=int(search))
        exists = True if len(article) > 0 else False
        return show_article(request, article.first(), exists)
    else:  # Search by title and other names
        articles = getArticlesbySearch(search)

        if articles is not None:
            if len(articles) > 1:  # More than 1 coincidence
                ctx = {
                    'title': search + ' (disambiguation)',
                    'articles': articles.values('id', 'title'),
                    'found': True
                    }
                return loadArticleList(request,ctx)
            elif len(articles) == 1:  # Exactly 1 coincidence
                return show_article(request, articles.first(), True)
        else:  # No coincidences
            return show_article(request, None, False)


def random_article(request):
    '''
        Display a random article
    '''
    article = getRandomArticle()
    return show_article(request, article, found=True if article is not None else False)



class CategoriesView(generic.ListView):
    ''' Display a list of all categories in the categories table '''
    template_name = 'articles/categories.html'
    context_object_name = 'categories'

    def get_queryset(self):
        return models.Category.objects.all()


def category(request, search:str):
    '''
        Display all articles of the selected category
    '''

    found = False
    articles = None
    if search.isnumeric():  # Search by id
        category = models.Category.objects.filter(id=search)            
    else:  # Search by name
        category = models.Category.objects.filter(name=search)

    if len(category) == 1:
        category = models.Category.objects.get(name=category[0].name)
        articles = category.article_set.all().order_by('title').values('id', 'title')
        search = category.name
        found = True

    ctx = {
        'title': search + ' Category',
        'articles': articles,
        'found': found,
    }

    return loadArticleList(request, ctx)


def favouriteArticles(request):
    '''
        Display a list of the favourite articles of the user and related articles of them
    '''

    if request.user.is_authenticated:
        author = Author.objects.get(user=request.user)
        favourites = FavouriteArticles.objects.filter(user=author)
        if len(favourites) == 0:
            my_favourite = FavouriteArticles.objects.create(user=author)
        else:
            my_favourite = favourites.first()

        articles = my_favourite.articles.all().order_by('title')

        related_total = getRelatedArticles(articles)

        ctx = {
            'title': 'Your favourite articles',
            'articles': articles.values('id', 'title'),
            'related': related_total,
            'found': True
        }
        return loadArticleList(request, ctx)
    else:
        raise Http404
    
def search(request):
    '''
        Search and displays a list of articles according to the search
    '''

    if request.method == 'POST':
        if request.POST['search']:
            found = False
            search = request.POST['search']
            
            articles = getArticlesbySearch(search)

            if articles is not None:
                found = True

            related = getRelatedArticles(articles)

            ctx = {
                'title': f'Results for "{search}"',
                'articles': articles.values('id', 'title') if found else None,
                'related': related,
                'found': found
            }

            return loadArticleList(request, ctx)
            
    else:
        return redirect('Home')


def loadArticleList(request, ctx):
    '''
        Recieve the a ready ctx and display a lsit of articles and related articles
    '''

    return render(request, 'articles/list.html', ctx)


class GalleryView(generic.ListView):
    '''
        Load the view of the gallery, showing al images registered in the Images table
    '''
    template_name = 'articles/gallery.html'
    context_object_name = 'images'

    def get_queryset(self):
        return models.Image.objects.order_by('title')


def getRandomArticle():
    '''
        Return a random article
    '''

    articles = models.Article.objects.all()

    if len(articles) == 0:
        return None

    count = len(articles) - 1
    return articles[random.randint(0, count)]


def show_article(request, article, found = True):
    '''
        Displays the full article view
    '''

    ctx = { 'found': found}

    if found:
        articles_names = getAllArticleNames(article.title)
        disambiguation = getDisambiguation(article.other_names, articles_names)
        summary = getSummaryWithLinks(article.summary, articles_names)
        related = getRelatedArticles(article.title)

        # Getting the visible sections ordered by order
        sections = article.section_set.filter(visible=True).order_by('order')  
        sections = getArticleSectionsWithLinks(sections, articles_names)

        favourite = checkFavourite(article.id, request.user)
        
        article.views += 1
        article.save()

        article.main = getContentWithLinks(article.main, articles_names)

        ctx = {
            'article': article,
            'summary': summary,
            'relatedArtices': related,
            'disambiguation': disambiguation,
            'sections': sections,
            'comment_form': CommentForm(),
            'is_favourite': favourite,
            'found': found
            }
    
    return render(request, 'articles/article.html', ctx)


def getSummaryWithLinks(summary, ordened_names):
    '''
        Recieve an article and a list of ordered name (obtained by the getAllArticleNames function )
        Return the summary of the article with the hyperlinks added to them content
        Example: 
            If que race of a character is Dark Elf, the "Dark Elf" word will be a <a href="Dark Elf article">
            This too happens with the content of each section an main content or each article
    '''

    if summary.content:
        summary.content = getContentWithLinks(summary.content, ordened_names)
        fields = summary.content.split(';')
        result = []
        for field in fields:
            if field:
                key, value = field.split(':')[0], field.split(':')[1]
                censored = False
                if '#C' in key.upper():
                    key = key.split('#C')[1]
                    censored = True

                result.append({
                    'field': key, 
                    'value': value,
                    'censored': censored
                    })
        return result
    else:
        return None


def getRelatedArticles(item):
    '''
        Recieve an string or a list:
        Recieving a string, search for a article with exactly the same tite an return the related articles of them
        Recieving a list of articles, returns the related articles of each article in the list (no repeating)
    '''

    result = []
    if type(item) == str:
        # Recieving an article title
        related = models.RelatedArticles.objects.filter(article_title=item)
        if len(related) > 0:
            related = related.first()
            for article in related.related.all():
                result.append({'id':article.id, 'title': article.title})

    else:
        # Recieving a list of articles
        ids = [ ar.id for ar in item]

        for article in item:
            related_articles = getRelatedArticles(article.title)
            to_add = []
            for related in related_articles:
                if related['id'] in ids:
                    continue

                ids.append(related['id'])
                to_add.append(related)

            result += to_add
    
    return result    


def getArticlesbySearch(search):
    '''
        Return all articles whose name or other names match with the search
    '''

    names = getAllArticleNames()
    coincidences = []

    for name in names:
        coincidance = [ n for n in name['names'] if search.lower() in n ]
        if coincidance:
            coincidences.append(name['id'])

    if len(coincidences) > 0:
        return models.Article.objects.filter(pk__in=coincidences)
    else:
        return None


def getDisambiguation(other_names, articles):
    '''
        Recieve other_names of getAllArticleNames function and a list of articles
        Return the common name of the articles in the list
    '''

    article_names = [ar.lower().strip() for ar in other_names.split(',')]

    for article in articles:
        for name in article['names']:
            if name in article_names:
                return name.capitalize()

    return None


def getArticleSectionsWithLinks(sections, ordened_names):
    '''
        Recieve an article and the ordered_names of getAllArticleNames function
        Return all section of the article with hyperlinks added
        Example: 
            If in section's content exists "Dark elf" then it's replaced by <a href="Dark Elf article">
            This too happens with summary of each article
    '''

    result = []

    if len(sections) > 0:
        for section in sections:
            if(section.content):
                section.content = getContentWithLinks(section.content, ordened_names)

            if section.sectionType.name in ['Ordened list', 'Unordened list']:

                elements = [s for s in section.content.split('#;') if s ]
                section.content = elements
                
            result.append(section)
    
    return result


def getAllArticleNames(excluded_title = False):
    '''
        Return all names of all articles (title and other names)
        If you set excluded_title, then return all names of all articles excluding that title
        Return a list of dicts with 'id' and 'names'
    '''

    articles = models.Article.objects.all().values('id', 'title', 'other_names')
    ordened_names = []
    for article in articles:
        if(article['title'] != excluded_title):
            names = [n.strip().lower() for n in article['other_names'].split(',') if n != '']   
            names.append(article['title'].lower())
            to_add = {
                'id': article['id'],
                'names': names
            }
            ordened_names.append(to_add)
    return ordened_names
    

def getContentWithLinks(content, ordened_names):
    '''
        Recieves the article's content and a oredered_names of getAllArticleNames function
        Return the same content but replacing the names on it by hyperlinks
        Example:
            If in content exists "Dark elf" then it's replaced by <a href="Dark Elf article">
            This too happens with summary of each article
    '''

    written = []
    for names in ordened_names:
        title = names['names'][-1]
        for name in names['names']:
            if name in written: continue

            content, replaced = getReplacedContent(content, name, title)

            if replaced:
                written.append(name)
                break

    return content


def getReplacedContent(content:str, word:str, article_title:str):
    '''
        Recieves a string and a word
        Replace all the word's appear by a <a></a> HTML hyperlink 
        Return the content with the hyperlinks
    '''

    variants = [word.capitalize(), word.title(), word.lower()]
    link = '<a class="text-capitalize fw-bold text-white" href="{0}">{1}</a>'

    old = content
    for variant in variants:
        url = reverse('article', args=(article_title,))
        content = content.replace(
            variant,
            link.format(url, variant.title())
        )

        if content != old:
            return content, True
        
    return content, False


def checkFavourite(article_id, user):
    '''
        Check if user has the article as favourite, return true or false, too can return None if the user is not logged in
    '''

    if user.is_authenticated:
        author = Author.objects.get(user=user)
        favourites = FavouriteArticles.objects.filter(
            user=author,
            articles__id=article_id)
        
        return True if favourites else False
    else:
        return None
