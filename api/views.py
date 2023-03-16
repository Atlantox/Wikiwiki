from django.http.response import JsonResponse
from django.views import View
from django.forms.models import model_to_dict
from comments import models as Com

class Comment(View):

    def get(self, request):
        comments = Com.Comment.objects.all()

        comments = [ model_to_dict(c) for c in comments ]
        if len(comments) > 0:
            data = {'message': 'Success', 'comments': comments}
        else:
            data = {'message': 'No comments in data base'}

        return JsonResponse(data)


    def post(self, request):
        pass

    def put(self, request):
        pass

    def delete(self, request):
        pass