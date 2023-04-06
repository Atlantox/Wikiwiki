from django.test import TestCase
from django.core.files.uploadedfile import SimpleUploadedFile
from django.urls import reverse
from articles import models
from .models import Author, Comment
from django.contrib.auth.models import User

def create_article(
        title:str, 
        categories:models.Category, 
        main:str, 
        other_names:str = '', 
        images:models.Image = None, 
        summary:models.Summary = None) -> models.Article:
    

    if summary is None:
        my_summary = models.Summary.objects.create(title=title)

    if images is None:
        my_images = create_image('example_image')

    article = models.Article.objects.create(
        title=title,
        main=main,
        other_names=other_names,
        summary=summary if summary is not None else my_summary)
    
    if images is not None:
        for img in images:
            article.images.set([img])
    else:
        article.images.set([my_images])

    try:
        if len(categories) > 1:
            article.category.set(categories)
    except:
        article.category.set([categories])

    article.save()
    return article


def create_image(title, description = ''):
    return models.Image.objects.create(
        title=title, 
        description=description,
        img=SimpleUploadedFile(name=title+'.jpg',
                                content=open('D:/Proyectos/wikiwiki/WebApp/static/WebApp/icons/favicon.png', 'rb').read(),
                                content_type='image/jpg'))

def create_section(
        title:str, 
        content:str, 
        targetArticle:models.Article, 
        sectionType:models.SectionType, 
        images:models.Image = None,
        order:int = 1, 
        visible:bool = True, 
        collapse:bool = False):

    section = models.Section.objects.create(
        title=title,
        content=content,
        targetArticle = targetArticle,
        sectionType = sectionType,
        order = order,
        visible = visible,
        collapse = collapse
    )

    section.images.set(images if images is not None else '')
    section.save()

    return section

class CommentViewTest(TestCase):
    def setUp(self):
        self.defaultCategory = models.Category.objects.create(
            name='test category',
            img = create_image('example category image')
        )

        self.section_types = {
            'Ordened list': models.SectionType.objects.create(name='Ordened list'),
            'Unordened list': models.SectionType.objects.create(name='Unordened list'),
            'Pure text': models.SectionType.objects.create(name='Pure text'),
            'Text with L image': models.SectionType.objects.create(name='Text with L image'),
            'Text with R image': models.SectionType.objects.create(name='Text with R image'),
        }

    def test_article_with_no_comments(self):
        pass

    def test_article_with_comments(self):
        pass

    def test_article_with_multiple_comments(self):
        pass

    def test_write_comment(self):
        pass

class FavouriteViewTest(TestCase):
    def setUp(self):
        self.defaultCategory = models.Category.objects.create(
            name='test category',
            img = create_image('example category image')
        )

        self.section_types = {
            'Ordened list': models.SectionType.objects.create(name='Ordened list'),
            'Unordened list': models.SectionType.objects.create(name='Unordened list'),
            'Pure text': models.SectionType.objects.create(name='Pure text'),
            'Text with L image': models.SectionType.objects.create(name='Text with L image'),
            'Text with R image': models.SectionType.objects.create(name='Text with R image'),
        }

    def test_user_with_no_favourites_articles(self):
        pass

    def test_user_with_favourites_articles(self):
        pass
