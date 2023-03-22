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
        names = getAllArticleNames()
        coincidences = []
        exists = True
        article = None
        for name in names:
            if search.lower() in name['names']:
                coincidences.append(name['id'])

        if len(coincidences) > 1:
            articles = []
            for id in coincidences:
                articles.append(models.Article.objects.get(id=id))
            
            ctx = {
                'title': search + ' (disambiguation)',
                'articles': articles,
                'found': exists
                }
            
            return loadArticleList(request, ctx)
        else:
            if len(coincidences) == 1:
                article = models.Article.objects.get(id=coincidences[0])
            else:
                exists = False

            return show_article(request, article, exists, commentError=error)

def random_article(request):
    return show_article(request, getRandomArticle())

def categories(request):
    categories = models.Category.objects.all()
    ctx = {
        'categories': categories
    }
    return render(request, 'articles/categories.html', ctx)

def category(request, search):
    found = False
    articles = None
    category = models.Category.objects.filter(name=search)
    if len(category) == 1:
        category = models.Category.objects.get(name=category[0].name)
        articles = models.Article.objects.filter(category=category).order_by('title')
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

        ctx = {
            'title': 'Your favourite articles',
            'articles': articles,
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
        article_names = getAllArticleNames(article.title)
        summary = getSummary(article, article_names)
        related = getRelatedArticles(article.title)
        sections = getArticleSections(article, article_names)
        images = getArticleImages(article)
        comment_form = CommentForm()
        
        article.views += 1
        article.save()

        article.main = getContentWithLinks(article.main, article_names)

        ctx = {
            'article': article,
            'article_images': images,
            'summary': summary,
            'relatedArtices': related,
            'sections': sections,
            'comment_form': comment_form,
            'move_to': move_to,
            'error': commentError,
            'found': found
            }
    
    return render(request, 'articles/article.html', ctx)

def getSummary(article, ordened_names):
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

def getRelatedArticles(title):
    result = []
    if(len(models.RelatedArticles.objects.filter(article_title=title)) > 0):
        related = models.RelatedArticles.objects.get(article_title=title)
        for article in related.related.all():
            result.append({'id':article.id, 'title': article.title})
    
    return result

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
