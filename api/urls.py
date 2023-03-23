from django.urls import path
from .views import Comment, Favourite, tutorial

urlpatterns = [
    path('comments/', Comment.as_view(), name='comments'),
    path('comments/<int:art_id>/', Comment.as_view(), name='comments'),
    path('add_comment/<int:art_id>/', Comment.as_view(), name='add_comment'),
    path('get_favourites/', Favourite.as_view(), name='favourite'),
    path('add_favourite/<int:id>', Favourite.as_view(), name='add_favourite'),
    path('delete_favourite/<int:id>', Favourite.as_view(), name='delete_favourite'),
    path('', tutorial, name='api_tutorial'),
    path('api_tutorial/', tutorial, name='api_tutorial'),
]