from django.urls import path
from .views import Comment, Favourite, tutorial, Article, block_comment, getMostViewed, getFullArticle, getRandomArticle

urlpatterns = [
    path('article/<str:search>', Article.as_view(), name='api_article'),
    path('full_article/<str:art_id>', getFullArticle, name='full_article'),
    path('random_article/', getRandomArticle, name='api_random_article'),
    path('most_viewed/', getMostViewed, name='most_viewed'),
    path('comments/', Comment.as_view(), name='comments'),
    path('comments/<int:art_id>/', Comment.as_view(), name='comments'),
    path('add_comment/<int:art_id>/', Comment.as_view(), name='add_comment'),
    path('block_comment/<int:art_id>/', block_comment, name='block_comment'),
    path('get_favourites/', Favourite.as_view(), name='favourite'),
    path('add_favourite/<int:id>', Favourite.as_view(), name='add_favourite'),
    path('delete_favourite/<int:id>', Favourite.as_view(), name='delete_favourite'),
    path('', tutorial, name='api_tutorial'),
    path('api_tutorial/', tutorial, name='api_tutorial'),
]