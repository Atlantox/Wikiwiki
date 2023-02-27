from django.contrib import admin
from . import models

class ArticleAdmin(admin.ModelAdmin):
    readonly_fields = ['views', 'created']

admin.site.register(models.Image)
admin.site.register(models.SectionType)
admin.site.register(models.Category)
admin.site.register(models.Article, ArticleAdmin)
admin.site.register(models.Summary)
admin.site.register(models.Section)
admin.site.register(models.RelatedArticles)

