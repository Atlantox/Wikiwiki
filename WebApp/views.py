from django.shortcuts import render
from django.contrib.auth.models import User
from django.conf import settings
from articles import models as art
from articles.views import getRandomArticle

def home(request):
    categories = art.Category.objects.all()
    final_categories = []

    counters = {
        'articles': art.Article.objects.count(),
        'members': User.objects.count(),
        'editors': User.objects.filter(is_staff=True).count(),
        'images': art.Image.objects.count()
    }

    for category in categories:
        articles = art.Article.objects.filter(category=category).order_by('views')[:10]
        final_categories.append({
            'category': category,
            'articles': articles
        })

    most_viewed = art.Article.objects.all().order_by('-views')[:12]


    ctx = {
        'wiki_name': settings.WIKI_NAME,
        'counters': counters,
        'categories': final_categories,
        'most_viewed': most_viewed,
        'random_article': getRandomArticle()
    }
    return render(request, 'WebApp/home.html', ctx)

def about(request):
    return render(request, 'WebApp/about.html')

def text_resumer(text):
    return text[0:100] + '...'