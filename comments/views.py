from django.shortcuts import render
from django import forms

'''
    Relacionar Users con Comment
    Crear formulario en el article.html
    El formulario envía por POST User.id User.name y el contenido del comentario
    Se valida en comments.views, que en efecto sea el usuario y el contenido del comentario
    Si todo sale bien se registra y se recarga la página
    Si no el usuario es devuelto mandandole al show_articles un parámetro try_comment
    try_comment por defecto será null, pero también podrá ser "ok" para indicar que el comentario fue exitoso
    "invalid" para indicar que hubo algún error
'''

class CommentForm(forms.Form):
    comment = forms.CharField(
        max_length=200, 
        widget=forms.Textarea(
            attrs={'class': 'fs-5 col-8 bg-primary align-self-start p-1',
                   'rows': "3"}
    ))