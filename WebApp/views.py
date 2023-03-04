from django.shortcuts import render
from django.conf import settings
from articles import models as art
from articles.views import getRandomArticle

def home(request):
    categories = art.Category.objects.all()
    final_categories = []

    for category in categories:
        articles = art.Article.objects.filter(category=category)
        final_categories.append({
            'category': category,
            'articles': articles
        })


    ctx = {
        'wiki_name': settings.WIKI_NAME,
        'categories': final_categories,
        'random_article': getRandomArticle()
    }
    return render(request, 'WebApp/home.html', ctx)

def contact(request):
    return None

def text_resumer(text):
    return text[0:100] + '...'