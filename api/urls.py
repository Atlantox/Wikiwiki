from django.urls import path
from .views import Comment

urlpatterns = [
    path('comments/', Comment.as_view(), name='comments'),
]