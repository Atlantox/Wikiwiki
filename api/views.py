from django.http.response import JsonResponse
from django.views import View
from django.forms.models import model_to_dict
from comments import models as Com
from comments.views import CommentForm
from articles import models as Art
import re

class Comment(View):

    def get(self, request, art_id=None):
        if art_id:
            comments = Com.Comment.objects.filter(article=art_id)
            comments = getOrderedComments(comments)
            if len(comments) > 0:
                data = {'message': 'Success', 'comments': comments,}
        else:
            comments = Com.Comment.objects.all()

            comments = getOrderedComments(comments)
            if len(comments) > 0:
                data = {'message': 'Success', 'comments': comments}

        if len(comments) == 0:
            data = {'message': 'No comments in data base'}

        return JsonResponse(data)


    def post(self, request, art_id):
        author = Com.Author.objects.get(user=request.user)
        article = Art.Article.objects.get(id=art_id)
        content = request.POST['comment']
        form = CommentForm(request.POST)
        if form.is_valid() and not re.search('[<>]', content):
            to_add = Com.Comment(
                author=author,
                content=form.cleaned_data['comment'],
                article=article)

            to_add.save()
            data = {'status': 'ok'}
            #return redirect('article', search=str(art_id))
        else:
            data = {'status': 'fail'}
            #return redirect('article', search=str(art_id), error=1)
        return JsonResponse(data)


def getOrderedComments(comments):
    result = []
    for comment in comments:
        if re.search('[<>]', comment.content):
            continue

        myDate = str(comment.created.strftime('%Y-%m-%d %H:%M'))
        new_comment = model_to_dict(comment) | {'date': myDate}
        new_comment['author'] = comment.author.nickname
        result.append(new_comment)
        
    return result

class Favourite(View):
    def get(self, request):
        if request.user.is_authenticated:
            author = Com.Author.objects.get(user=request.user)
            favourites = Com.FavouriteArticles.objects.get(user=author)
            favourites = [fa for fa in favourites.articles.all().values('id', 'title') ]
            print(favourites)
            data = {
                'message': 'success',
                'status': 'ok',
                'favourites': favourites
            }

            return JsonResponse(data)

        else:
            return JsonResponse({'message:': 'You are not logged in', 'status': 'fail'})

    def post(self, request, id):
        pass

    def delete(self, request, id):
        pass
