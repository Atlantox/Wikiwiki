from django.shortcuts import render
from django.conf import settings

def home(request):
    ctx = {
        'wiki_name': settings.WIKI_NAME
    }
    return render(request, 'WebApp/home.html', ctx)

def contact(request):
    return None

def text_resumer(text):
    return text[0:100] + '...'