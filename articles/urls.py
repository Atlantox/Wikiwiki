from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('article/<str:search>/', views.article, name='article'),  # ex: article/sushi/
    path('favourites/', views.favouriteArticles, name='favouriteArticles'),
    path('random/', views.random_article, name='random_article'),
    path('search/', views.search, name='search'),
    path('categories/', views.CategoriesView.as_view(), name='categories'),
    path('category/<str:search>', views.category, name='category'),  # ex: actegory/characters
    path('gallery/', views.GalleryView.as_view(), name='gallery'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
