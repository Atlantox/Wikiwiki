from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.log_in.as_view(), name='log_in'),
    path('register/', views.register.as_view(), name='register'),
    path('logout/', views.log_out, name='log_out'),
    path('set_nickname/', views.set_nickname.as_view(), name='set_nickname'),
]