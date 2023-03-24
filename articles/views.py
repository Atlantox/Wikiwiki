from django.shortcuts import render, redirect
from django.forms.models import model_to_dict
from comments.views import CommentForm
from comments.models import Author, FavouriteArticles
from . import models
import random

def article(request, search:str, error = 0):
    if search.isnumeric():
        article = models.Article.objects.filter(id=int(search))
        exists = True if len(article) > 0 else False
        return show_article(request, article.first(), exists, commentError=error)
    else:
        articles = getArticlesbySearch(search)

        if articles is not None:
            if len(articles) > 1:
                ctx = {
                    'title': search + ' (disambiguation)',
                    'articles': articles.values('id', 'title'),
                    'found': True
                    }
                return loadArticleList(request,ctx)
            elif len(articles) == 1:
                return show_article(request, articles.first(), True)
        else:
            return show_article(request, None, False)


def random_article(request):
    return show_article(request, getRandomArticle())

def categories(request):
    categories = models.Category.objects.all()
    ctx = {
        'categories': categories
    }
    return render(request, 'articles/categories.html', ctx)

def category(request, search:str):
    found = False
    articles = None
    if search.isnumeric():
        category = models.Category.objects.filter(id=search)            
    else:
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
    if request.method == 'POST':
        if request.POST['search']:
            search = request.POST['search']

            coincidences = list(models.Article.objects.filter(title__icontains=search))
            coincidencesByOtherNames = models.Article.objects.filter(other_names__icontains=search)

            ids = [ar.id for ar in coincidences]

            for co in coincidencesByOtherNames:
                if co.id not in ids:
                    ids.append(co.id)
                    coincidences.append(co)

            related = getRelatedArticles(coincidences)

            ctx = {
                'title': f'Results for "{search}"',
                'articles': coincidences,
                'related': related,
                'found': True
            }

            return loadArticleList(request, ctx)
            
    else:
        return redirect('Home')


def loadArticleList(request, ctx):
    return render(request, 'articles/list.html', ctx)


def gallery(request):
    images = models.Image.objects.all().order_by('title')
    ctx = {
        'images': images,
    }
    return render(request, 'articles/gallery.html', ctx)

def getRandomArticle():
    articles = models.Article.objects.all()
    count = len(articles) - 1
    return articles[random.randint(0, count)]

def show_article(request, article, found = True, move_to = False, commentError = 0):
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
            'move_to': move_to,
            'error': commentError,
            'is_favourite': favourite,
            'found': found
            }
    
    return render(request, 'articles/article.html', ctx)

def getSummary(article, ordened_names):
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
    names = getAllArticleNames()
    coincidences = []

    for name in names:
        if search.lower() in name['names']:
            coincidences.append(name['id'])

    if len(coincidences) > 0:
        return models.Article.objects.filter(id__in=coincidences)
    else:
        return None

def getDisambiguation(other_names, articles):
    article_names = [ar.lower().strip() for ar in other_names.split(',')]

    for article in articles:
        for name in article['names']:
            if name in article_names:
                return name.capitalize()

    return None


def getArticleSections(article, ordened_names):
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
    images = []
    count = 1

    for img in [model_to_dict(ar) | {'url': ar.img.url} for ar in article.images.all()]:
        to_add = img | {'order' : count}
        count += 1
        images.append(to_add)
    return images


def getAllArticleNames(excluded_title = False):
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
    link = '<a class="text-capitalize fw-bold text-white" href="/article/{0}">{1}</a>'
    new_content, old_content = content, content
    
    for names in ordened_names:
        id = names['id']
        for name in names['names']:
            new_content = new_content.replace(name.lower(), link.format(name, name))
            if new_content != old_content:
                old_content = new_content
                break
            else:
                new_content = new_content.replace(name.capitalize(), link.format(name, name))
                if new_content != old_content:
                    old_content = new_content
                    break

    return new_content

def checkFavourite(article, user):
    if user.is_authenticated:
        favourites = FavouriteArticles.objects.get(user=Author.objects.get(user=user))
        found = [ ar.id for ar in favourites.articles.all() if ar.id == article.id ]
        return True if len(found) == 1 else False
    else:
        return None
    
