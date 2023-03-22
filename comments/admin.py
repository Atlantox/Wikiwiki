from django.contrib import admin
from . import models

class CommentAdmin(admin.ModelAdmin):
    readonly_fields = ['created']

admin.site.register(models.Comment, CommentAdmin)
admin.site.register(models.Author)
admin.site.register(models.FavouriteArticles)