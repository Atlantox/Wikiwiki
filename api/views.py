from django.http.response import JsonResponse
from django.views import View
from django.shortcuts import render, redirect
from django.forms.models import model_to_dict
from comments import models as Com
from comments.views import CommentForm
from articles.views import getArticlesbySearch, getRandomArticle as randomArticle
from articles import models as Art
import re

class Article(View):
    def get(self, request, search:str):
        '''
            Return one or more articles by a certain search, it returns the id, title, main content, other names and views of the article
        '''

        articles = getArticlesbySearch(search)

        if articles is None:
            return JsonResponse({'message': 'Articles not found', 'status': 'fail'})
        else:
            articles = articles.values('id', 'title', 'main', 'other_names', 'views')
            return JsonResponse({'message': 'Success', 'status': 'ok', 'found': len(articles), 'articles': list(articles)})

class Comment(View):
    def get(self, request, art_id=None):
        '''
            Get each not bloqued comment of each article
            Passing art_id return each comment of that article's id
        '''

        if art_id:
            comments = Com.Comment.objects.filter(article=art_id, bloqued=False)
            comments = getOrderedComments(comments)
            if len(comments) > 0:
                data = {'message': 'Success', 'status':'ok', 'comments': comments}
            else:
                data = {'message': 'This article not have comments', 'status':'fail'}
        else:
            comments = Com.Comment.objects.filter(bloqued=False)
            comments = getOrderedComments(comments)
            if len(comments) > 0:
                data = {'message': 'Success', 'status':'ok', 'comments': comments}
            else:
                data = {'message': 'No comments in data base', 'status':'fail'}

        return JsonResponse(data)


    def post(self, request, art_id):
        '''
            Create a comment, the user needs to be logged in
            The art_id param is necessary
        '''

        if request.user.is_authenticated:
            author = Com.Author.objects.get(user=request.user)
            articles = Art.Article.objects.filter(id=art_id)
            if len(articles) == 1:
                content = request.POST['comment']
                article = articles.first()
                form = CommentForm(request.POST)
                if form.is_valid() and not re.search('[<>]', content):
                    to_add = Com.Comment(
                        author=author,
                        content=form.cleaned_data['comment'],
                        article=article)

                    to_add.save()
                    data = {'status': 'ok'}
                else:
                    data = {'status': 'fail'}
            else:
                data = {'message': 'Article not found', 'status': 'fail'}

            return JsonResponse(data)
        else:
            return JsonResponse({'message': 'You are not logged in', 'status': 'fail'})
       

class Favourite(View):
    def get(self, request):
        '''
            Return the favourite articles of user, the user needs to stay logged in
        '''

        if request.user.is_authenticated:
            author = Com.Author.objects.get(user=request.user)
            favourites = Com.FavouriteArticles.objects.get(user=author)
            favourites = [fa for fa in favourites.articles.all().values('id', 'title') ]
            data = {
                'message': 'Success',
                'status': 'ok',
                'favourites': favourites
            }

            return JsonResponse(data)
        else:
            return JsonResponse({'message': 'You are not logged in', 'status': 'fail'})

    def post(self, request, id):
        '''
            Add an article to the favourite articles of user, the user needs to stay logged in
        '''

        if request.user.is_authenticated:
            author = Com.Author.objects.get(user=request.user)
            favourites = Com.FavouriteArticles.objects.filter(user=author)
            if len(favourites) == 0:
                current_favourite = Com.FavouriteArticles.objects.create(user=author)
            else:
                current_favourite = favourites.first()
                
            articles = Art.Article.objects.filter(id=id)
            if len(articles) == 1:
                current_favourite.articles.add(articles.first())
                current_favourite.save()
                data = {'message': 'Success','status': 'ok'}
            else:
                data = {'message': 'Article not found','status': 'fail'}        

            return JsonResponse(data)
        else:
            return JsonResponse({'message': 'You are not logged in', 'status': 'fail'})

    def delete(self, request, id):
        '''
            Delete an article of the favourites articles of user, the user needs to stay logged in
        '''

        if request.user.is_authenticated:
            author = Com.Author.objects.get(user=request.user)
            favourites = Com.FavouriteArticles.objects.filter(user=author)
            if len(favourites) == 0:
                current_favourite = Com.FavouriteArticles.objects.create(user=author)
            else:
                current_favourite = favourites.first()

            articles = current_favourite.articles.filter(id=id)
            if len(articles) == 1:
                current_favourite.articles.remove(articles.first())
                current_favourite.save()
                data = {'message': 'Success','status': 'ok'}
            else:
                data = {'message': 'Article not found','status': 'fail'} 

            return JsonResponse(data)
        else:
            return JsonResponse({'message': 'You are not logged in','status': 'fail'})

def tutorial(request):
    '''
        Displays the view that explain each API request
    '''

    return render(request, 'api/api_tutorial.html')

def block_comment(request, art_id):
    '''
        Block a comment to hide it, only staff users can do that
    '''

    if request.user.is_authenticated:
        if request.user.is_staff:

            to_block = Com.Comment.objects.filter(id= request.POST['comment_id'])
            if len(to_block) == 1:
                to_block = to_block.first()
                to_block.bloqued = True
                to_block.save()
                return redirect('article', search=art_id)
            
    return redirect('Home')        
    

def getMostViewed(request):
    '''
        Get the 10 articles most viewed, returning the id, title, main content, other names and views of it
    '''

    most_viewed = Art.Article.objects.all().order_by('-views')[0:10].values('id', 'title', 'main', 'other_names', 'views')
    if len(most_viewed) > 0:
        return JsonResponse({'message': 'Success', 'status': 'ok', 'articles': list(most_viewed)})
    
    return JsonResponse({'message': 'Not articles in data base', 'status': 'fail'})


def getFullArticle(request, art_id:str):
    '''
        Get an article passing the art_id
        Returns id, title, main content, other names, views, summary, sections and related articles
    '''

    if art_id.isnumeric():
        result = Art.Article.objects.filter(id=art_id)
        if len(result) == 1:
            article = result.first()
            sections = Art.Section.objects.filter(targetArticle=article, content__isnull=False, visible=True).order_by('order').values('title', 'content')
            sections = [ {'title': sec['title'], 'content': sec['content']} for sec in sections ]
            related = Art.RelatedArticles.objects.filter(article_title = article.title)
            related_names = []
            if len(related) == 1:
                related_names = [ r.title for r in related.first().related.all() ]

            content = article.summary.content
            summary = {}
            if content != '':
                for sum in content.split(';'):
                    key, value = sum.split(':')
                
                    if '#' in key:
                        key = key[2:]

                    summary[key] = value

            return JsonResponse({
                'message': 'Success',
                'status': 'ok',
                'article': result.values('id', 'title', 'main', 'other_names', 'views').first(),
                'sections': sections,
                'summary': summary,
                'related_articles': related_names
            })
        else:
            return JsonResponse({'message': 'Article not found', 'status': 'fail' })
    else:
        return JsonResponse({'message': 'Invalid id', 'status': 'fail' })


def getRandomArticle(request):
    ''''
        Return id, title, main, other names and views of a random article
    '''

    article = randomArticle()
    if article is None:
        return JsonResponse({'message': 'Not articles in database', 'status': 'fail'})

    article = {
        'id': article.id,
        'title':article.title,
        'main': article.main,
        'other_names': article.other_names,
        'views': article.views
    }
    
    return JsonResponse({'message': 'Success', 'status': 'ok', 'article': article })


def getOrderedComments(comments):
    '''
        Obtain a list of comments and returns it ordered as a list of dicts
    '''

    result = []
    for comment in comments:
        if re.search('[<>]', comment.content):
            continue

        myDate = str(comment.created.strftime('%Y-%m-%d %H:%M'))
        new_comment = model_to_dict(comment) | {'date': myDate}
        new_comment['author'] = comment.author.nickname
        result.append(new_comment)
        
    return result

