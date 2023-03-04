from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('article/<int:id>', views.article, name='article'),
    path('random/', views.random_article, name='random_article'),
    path('category/<int:id>', views.category, name='category')
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
