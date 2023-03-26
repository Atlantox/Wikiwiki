from django.shortcuts import render, redirect
from django.forms.models import model_to_dict
from comments.views import CommentForm
from comments.models import Author, FavouriteArticles
from . import models
import random

def article(request, search:str):
    '''
        Search an article and display it, in case of a multiple coincidence, displays a list of the results and related articles of these results
    '''

    if search.isnumeric():  # Search by id
        article = models.Article.objects.filter(id=int(search))
        exists = True if len(article) > 0 else False
        return show_article(request, article.first(), exists)
    else:  # Search by name and other names
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

    return show_article(request, getRandomArticle())


def categories(request):
    '''
        Display a list of all categories in the categories table
    '''

    categories = models.Category.objects.all()
    ctx = {
        'categories': categories
    }
    return render(request, 'articles/categories.html', ctx)


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
        articles = models.Article.objects.filter(category=category).order_by('title')
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
        Display a list of the varoutire articles of the user and related articles of them
    '''

    if request.user.is_authenticated:
        author = Author.objects.get(user=request.user)
        favourites = FavouriteArticles.objects.get(user=author)
        articles = [ a for a in favourites.articles.all() ]

        related_total = getRelatedArticles(articles)

        ctx = {
            'title': 'Your favourite articles',
            'articles': articles,
            'related': related_total,
            'found': True
        }
        return loadArticleList(request, ctx)
    else:
        return redirect('Home')
    
def search(request):
    '''
        Search and displays a list of articles according to the search
    '''

    if request.method == 'POST':
        if request.POST['search']:
            search = request.POST['search']
            
            articles = getArticlesbySearch(search)

            related = getRelatedArticles(articles)

            ctx = {
                'title': f'Results for "{search}"',
                'articles': articles.values('id', 'title'),
                'related': related,
                'found': True
            }

            return loadArticleList(request, ctx)
            
    else:
        return redirect('Home')


def loadArticleList(request, ctx):
    '''
        Recieve the a ready ctx and display a lsit of articles and related articles
    '''

    return render(request, 'articles/list.html', ctx)


def gallery(request):
    '''
        Load the view of the gallery, showing al images registered in the Images table
    '''

    images = models.Image.objects.all().order_by('title')
    ctx = {
        'images': images,
    }
    return render(request, 'articles/gallery.html', ctx)

def getRandomArticle():
    '''
        Return a random article
    '''

    articles = models.Article.objects.all()
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
        summary = getSummary(article, articles_names)
        related = getRelatedArticles(article.title)
        sections = getArticleSections(article, articles_names)
        images = getArticleImages(article)
        comment_form = CommentForm()
        favourite = checkFavourite(article, request.user)
        
        article.views += 1
        article.save()

        article.main = getContentWithLinks(article.main, articles_names)

        ctx = {
            'article': article,
            'article_images': images,
            'summary': summary,
            'relatedArtices': related,
            'disambiguation': disambiguation,
            'sections': sections,
            'comment_form': comment_form,
            'is_favourite': favourite,
            'found': found
            }
    
    return render(request, 'articles/article.html', ctx)

def getSummary(article, ordened_names):
    '''
        Recieve an article and a list of ordered name (obtained by the getAllArticleNames function )
        Return the summary of the article with the hyperlinks added to them content
        Example: 
            If que race of a character is Dark Elf, the "Dark Elf" word will be a <a href="Dark Elf article">
            This too happens with the content of each section an main content or each article
    '''

    summaries = models.Summary.objects.filter(article=article)
    if len(summaries) > 0:
        summary = models.Summary.objects.get(article=article)
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
        if(len(models.RelatedArticles.objects.filter(article_title=item)) > 0):
            related = models.RelatedArticles.objects.get(article_title=item)
            for article in related.related.all():
                result.append({'id':article.id, 'title': article.title})

    elif type(item) == list:
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
        buffer = [ n for n in name['names'] if search.lower() in n ]
        if buffer:
            coincidences.append(name['id'])

    if len(coincidences) > 0:
        return models.Article.objects.filter(id__in=coincidences)
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


def getArticleSections(article, ordened_names):
    '''
        Recieve an article and the ordered_names of getAllArticleNames function
        Return all section of the article with hyperlinks added
        Example: 
            If in section's content exists "Dark elf" then it's replaced by <a href="Dark Elf article">
            This too happens with summary of each article
    '''

    result = []
    sections = models.Section.objects.filter(targetArticle=article, visible=True).order_by('order')
    if(len(sections) > 0):
        for section in sections:
            if(section.content):
                section.content = getContentWithLinks(section.content, ordened_names)

            if section.sectionType.name in ['Ordened list', 'Unordened list']:
                elements = [s.capitalize() for s in section.content.split('#;')]
                section.content = elements
                
            result.append(section)
    
    return result

def getArticleImages(article):
    '''
        Get all the images of an article
    '''

    images = []
    count = 1

    for img in [model_to_dict(ar) | {'url': ar.img.url} for ar in article.images.all()]:
        to_add = img | {'order' : count}
        count += 1
        images.append(to_add)
    return images


def getAllArticleNames(excluded_title = False):
    '''
        Return all names of all articles (title and other names)
        If you set excluded_title, then return all names of all articles excluding that title
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
        for name in names['names']:
            if name in written: continue

            content, replaced = getReplacedContent(content, name)

            if replaced:
                written.append(name)
                break

    return content


def getReplacedContent(content:str, word:str):
    '''
        Recieves a string and a word
        Replace all the word's appear by a <a></a> HTML hyperlink 
        Return the content with the hyperlinks
    '''

    variants = [word.capitalize(), word.title(), word.lower()]
    link = '<a class="text-capitalize fw-bold text-white" href="/article/{0}">{1}</a>'

    old = content
    for variant in variants:
        content = content.replace(
            variant,
            link.format(variant, variant.title())
        )

        if content != old:
            return content, True
        
    return content, False

def checkFavourite(article, user):
    '''
        Check if user has the article as favourite, return true or false, too can return None if the user is not logged in
    '''

    if user.is_authenticated:
        favourites = FavouriteArticles.objects.get(user=Author.objects.get(user=user))
        found = [ ar.id for ar in favourites.articles.all() if ar.id == article.id ]
        return True if len(found) == 1 else False
    else:
        return None
    
