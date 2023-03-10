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
    article_names = getAllArticleNames(article.title)
    summary = getSummary(article, article_names)
    related = getRelatedArticles(article.title)
    sections = getArticleSections(article, article_names)
    images = getArticleImages(article)

    article.views += 1
    article.save()

    article.main = getContentWithLinks(article.main, article_names)

    ctx = {
        'article': article,
        'article_images': images,
        'summary': summary,
        'relatedArtices': related,
        'sections': sections,
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
            if '</a>' not in value:
                value = value.capitalize()

            if '</a>' not in key:
                key = key.capitalize()

            result.append([key, value])

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
    for img in article.images.all():
        to_add = {
            'url': img.img.url,
            'order': count
        }
        count += 1
        images.append(to_add)

    return images

from datetime import datetime

def show_execution_time(func):
    def wrapper(*args, **kwargs):
        initial_time = datetime.now()
        func(*args, **kwargs)
        final_time = datetime.now()
        time_elapsed = final_time - initial_time
        print(f'[TIME]: {time_elapsed.total_seconds()}s')
    return wrapper()

#@show_execution_time
def getAllArticleNames(excluded_title = False):
    articles = models.Article.objects.all().values('id', 'title', 'other_names')
    ordened_names = []
    for article in articles:
        if(article['title'] != excluded_title):
            names = [n.lower().strip() for n in article['other_names'].split(',') if n != '']   
            names.append(article['title'])
            to_add = {
                'id': article['id'],
                'names': names
            }
            ordened_names.append(to_add)
    return ordened_names
    

def getContentWithLinks(content, ordened_names):
    link = '<a class="" href="/article/{0}">{1}</a>'
    new_content, old_content = content, content
    
    for names in ordened_names:
        id = names['id']
        for name in names['names']:
            C_name = name.capitalize()
            L_name = name.lower()
            new_content = new_content.replace(L_name, link.format(id, C_name))
            if new_content != old_content:
                print(f'{name} reemplazado \n')
                old_content = new_content
                break
            else:
                new_content = new_content.replace(C_name, link.format(id, C_name))
                if new_content != old_content:
                    print(f'{name} reemplazado \n')
                    old_content = new_content
                    break

    return new_content
