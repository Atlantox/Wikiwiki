from django.contrib import admin
from . import models

class ArticleAdmin(admin.ModelAdmin):
    readonly_fields = ['views']

admin.site.register(models.ArticleImages)
admin.site.register(models.SectionType)
admin.site.register(models.MainCategory)
admin.site.register(models.Article, ArticleAdmin)
admin.site.register(models.ArticleSummary)
admin.site.register(models.ArticleSection)
admin.site.register(models.RelatedArticles)
