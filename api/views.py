from django.http.response import JsonResponse
from django.views import View
from django.forms.models import model_to_dict
from comments import models as Com
from articles import models as Art
from articles.views import show_article

class Comment(View):

    def get(self, request, art_id=None):
        if art_id:
            comments = Com.Comment.objects.filter(article=art_id)
            comments = getOrderedComments(comments)
            if len(comments) > 0:
                data = {'message': 'Success', 'comments': comments}
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
        to_add = Com.Comment(
            author=author,
            content=request.POST['comment'],
            article=article)
        
        to_add.save()
        
        return show_article(request, article, move_to='comments_section')

    def put(self, request):
        pass

    def delete(self, request):
        pass

def getOrderedComments(comments):
    result = []
    for comment in comments:
        if '<' in comment.content or '>' in comment.content:
            continue

        myDate = str(comment.created.strftime('%Y-%m-%d %H:%M'))
        new_comment = model_to_dict(comment) | {'date': myDate}
        new_comment['author'] = comment.author.nickname
        result.append(new_comment)
        
    return result