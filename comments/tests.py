import json

from django.test import TestCase, Client
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

def create_comment(
        content:str,
        article:models.Article,
        author:Author = None,
        bloqued:bool = False):
    
    if author is None:
        my_author, my_user = get_author_and_user()

    return Comment.objects.create(
        content=content,
        article=article,
        author=my_author,
        bloqued=bloqued
    )

def get_author_and_user():
    authors = Author.objects.all()
    if len(authors) > 0:
        my_author = authors.first()
        return my_author, my_author.user
    else:
        my_user = User.objects.create_user('user',password='password')
        #my_user = User.objects.create(username='user', is_active=True)
        my_user.set_password('password')
        my_user.save()
        my_author = Author.objects.create(user=my_user, nickname='kanache1')
        return my_author, my_user


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

    def test_user_not_logged(self):
        '''
        If user noy logged in, the comment form will not displayed
        '''
        article = create_article('example title', self.defaultCategory, 'example content')

        response = self.client.get(reverse('article', args=(article.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertNotContains(response, 'comment_form')

    def test_user_logged_in(self):
        '''
        If the user is logged in, he can write a comment
        '''
        article = create_article('example title', self.defaultCategory, 'example content')
        my_author, my_user = get_author_and_user()
        c = Client()
        c.login(username='user', password='password')

        response = c.get(reverse('article', args=(article.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'comment_form')

    def test_try_write_comment_logged_in(self):
        '''
        Only the authenticated users tan write comments
        '''
        article = create_article('example title', self.defaultCategory, 'example content')
        my_author, my_user = get_author_and_user()
        c = Client()
        c.login(username='user', password='password')
        comment_content = 'This is my comment!'
        response = c.post(reverse('add_comment', args=(article.id,)), {'comment': comment_content})

        comment = Comment.objects.all().first()

        self.assertEqual(comment.content, comment_content)
        self.assertEqual(comment.author, my_author)        

    def test_try_write_comment_not_logged_in(self):
        '''
        A not logged in user, can't write comments
        '''
        article = create_article('example title', self.defaultCategory, 'example content')
        c = Client()

        comment_content = 'This is my comment!'
        response = c.post(reverse('add_comment', args=(article.id,)), {'comment': comment_content})

        self.assertEqual(json.loads(response.content), {'message:': 'You are not logged in', 'status': 'fail'})


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

    def test_trying_to_add_a_favourite_article_logged(self):
        '''
        Only logged in users can add favourite articles
        '''
        article1 = create_article('title of article 1', self.defaultCategory, 'content 1')
        my_author, my_user = get_author_and_user()
        c = Client()
        c.login(username='user', password='password')

        response = c.post(reverse('add_favourite', args=(article1.id,)))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(json.loads(response.content), {'message': 'success', 'status': 'ok'})

        response = c.get(reverse('favouriteArticles'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, article1.title)

    def test_trying_to_add_a_favourite_article_without_login(self):
        '''
        Users can't add favourite articles if they are not logged in
        '''
        article1 = create_article('title of article 1', self.defaultCategory, 'content 1')

        response = self.client.post(reverse('add_favourite', args=(article1.id,)))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(json.loads(response.content), {'message:': 'You are not logged in', 'status': 'fail'})

    def test_user_with_no_favourites_articles(self):
        '''
        If a user is logged in and no have favourite articles, a appropiated messsage is displayed
        '''
        my_author, my_user = get_author_and_user()
        c = Client()
        c.login(username='user', password='password')
        response = c.get(reverse('favouriteArticles'))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Looks like it's not Your favourite articles yet")
        
    def test_user_tryng_to_view_favourites_without_login(self):
        '''
        If a not logged in user tries to go to favourites article views, a Http 404 is raised
        '''
        response = self.client.get(reverse('favouriteArticles'))

        self.assertEqual(response.status_code, 404)

    def test_user_with_favourites_articles(self):
        '''
        If a user is logged an have favourite articles, they are displayed
        So, related articles of these favourite articles too are displayed
        '''
        article1 = create_article('title of article 1', self.defaultCategory, 'content 1')
        article2 = create_article('title of article 2', self.defaultCategory, 'content 2')

        related = models.RelatedArticles.objects.create(article_title=article1.title)
        related.related.set([article2])
        related.save()

        my_author, my_user = get_author_and_user()
        c = Client()
        c.login(username='user', password='password')

        response = c.post(reverse('add_favourite', args=(article1.id,)))
        self.assertEqual(json.loads(response.content), {'message': 'success','status': 'ok'})

        response = c.get(reverse('favouriteArticles'))        
        self.assertEqual(response.status_code, 200)
        self.assertQuerysetEqual(response.context['articles'], [{'id':article1.id, 'title':article1.title}])
        self.assertQuerysetEqual(response.context['related'], related.related.all().values('id', 'title'))
        
