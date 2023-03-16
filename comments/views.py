from django.shortcuts import render

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
