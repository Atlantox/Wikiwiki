from django.urls import path
from .views import Comment, Favourite

urlpatterns = [
    path('comments/', Comment.as_view(), name='comments'),
    path('comments/<int:art_id>/', Comment.as_view(), name='comments'),
    path('add_comment/<int:art_id>/', Comment.as_view(), name='add_comment'),
    path('get_favourites/', Favourite.as_view(), name='favourite'),
]