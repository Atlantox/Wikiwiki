from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('article/<str:search>/', views.article, name='article'),
    path('article/<str:search>/<int:error>/', views.article, name='article'),
    path('favourites/', views.favouriteArticles, name='favouriteArticles'),
    path('random/', views.random_article, name='random_article'),
    path('categories/', views.categories, name='categories'),
    path('category/<str:search>', views.category, name='category'),
    path('gallery/', views.gallery, name='gallery'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
