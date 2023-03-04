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

def category(request, id):
    ctx = {}
    return render(request, 'articles/category.html', ctx)

def getRandomArticle():
    articles = models.Article.objects.all()
    count = len(articles) - 1
    return articles[random.randint(0, count)]

def show_article(request, article, found = True):
    ctx = {
        'article': article,
        'found': found
        }
    
    return render(request, 'articles/article.html', ctx)

