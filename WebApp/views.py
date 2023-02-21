from django.shortcuts import render

def home(request):
    ctx = {}
    return render(request, 'WebApp/home.html', ctx)

def contact(request):
    return None

def text_resumer(text):
    return text[0:100] + '...'