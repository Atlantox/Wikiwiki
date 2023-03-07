from django.shortcuts import render
from django.forms.models import model_to_dict
from . import models
import random

def article(request, id):
    ctx = {}
    exists = True
    if len(models.Article.objects.filter(id=id)) == 0:
        exists = False

    article = models.Article.objects.get(id=id)

    return show_article(request, article, exists)

def random_article(request):
    return show_article(request, getRandomArticle())

def categories(request):
    categories = models.Category.objects.all()
    ctx = {
        'categories': categories
    }
    return render(request, 'articles/categories.html', ctx)

def category(request, id):
    found = False
    category = models.Category.objects.filter(id=id)
    if len(category) > 0:
        category = models.Category.objects.get(id=id)
        articles = models.Article.objects.filter(category=category).order_by('title')

    ctx = {
        'category': category,
        'articles': articles,
        'found': found,
    }
    return render(request, 'articles/category.html', ctx)

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

def show_article(request, article, found = True):
    summary = getSummary(article)
    related = getRelatedArticles(article.title)
    sections = getArticleSections(article)
    images = getArticleImages(article)

    article.views += 1
    article.save()

    ctx = {
        'article': article,
        'article_images': images,
        'summary': summary,
        'relatedArtices': related,
        'sections': sections,
        'found': found
        }
    
    return render(request, 'articles/article.html', ctx)

def getSummary(article):
    summary = models.Summary.objects.get(article=article)
    fields = summary.content.split(';')
    result = []
    for field in fields:
        key, value = field.split(':')[0].capitalize(), field.split(':')[1].capitalize()
        result.append([key, value])
    return result

def getRelatedArticles(title):
    result = []
    if(len(models.RelatedArticles.objects.filter(article_title=title)) > 0):
        related = models.RelatedArticles.objects.get(article_title=title)
        for article in related.related.all():
            result.append({'id':article.id, 'title': article.title})
    
    return result

def getArticleSections(article):
    result = []
    sections = models.Section.objects.filter(targetArticle=article).order_by('order')
    if(len(sections) > 0):
        for section in sections:
            result.append(section)
    
    return result

def getArticleImages(article):
    images = []
    count = 1
    for img in article.images.all():
        to_add = {
            'url': img.img.url,
            'order': count
        }
        count += 1
        images.append(to_add)

    return images
