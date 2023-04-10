import json

from django.test import TestCase, Client
from django.core.files.uploadedfile import SimpleUploadedFile
from django.urls import reverse
from articles import models
from comments.models import Author, Comment, FavouriteArticles
from api.views import getOrderedComments
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


    return Comment.objects.create(
        content=content,
        article=article,
        author=author,
        bloqued=bloqued
    )

def get_ordered_article(article:models.Article):
    return {
        'id': article.id,
        'title':article.title,
        'main': article.main,
        'other_names': article.other_names,
        'views': article.views
    }

def add_favourite(article:models.Article, author:Author):
    favourite = FavouriteArticles.objects.create(user=author)
    favourite.articles.add(article)
    favourite.save()
    return favourite

class APITest(TestCase):
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

        self.username = 'original_username'
        self.password = 'original_password'
        self.nickname = 'default nickname'
        self.defaultUser = User.objects.create_user(self.username, password=self.password)
        self.staffUser = User.objects.create_superuser(username='admin', password='admin')
        self.staffAuthor = Author.objects.create(user=self.staffUser, nickname='super admin')
        self.author = Author.objects.create(user=self.defaultUser, nickname=self.nickname)

    def test_get_article_by_title(self):
        '''
        Search for articles when the search is in the title
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        response = self.client.get(reverse('api_article', args=('ex',)))  # will match in 'ex'ample_article
        ordered_article = get_ordered_article(article)

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['found'], 1)
        self.assertEqual(response['articles'], [ordered_article])


    def test_get_article_by_other_name(self):
        '''
        Search for articles when the search is any of the other names of article
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        response = self.client.get(reverse('api_article', args=('diff',)))  # will match in 'diff'erent_name
        ordered_article = get_ordered_article(article)

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['found'], 1)
        self.assertEqual(response['articles'], [ordered_article])

    def test_no_article_found_in_search(self):
        '''
        If no results are returned in the search of article, recieves appropiated data
        '''
        response = self.client.get(reverse('api_article', args=('example search',))) 

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Articles not found')
        self.assertEqual(response['status'], 'fail')

    def test_get_random_article(self):
        '''
        Returns a random article
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        ordered_article = get_ordered_article(article)

        response = self.client.get(reverse('api_random_article')) 

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['article'], ordered_article)

    def test_get_random_article_with_no_articles_in_database(self):
        '''
        If the user queries for a random article and the database don't have articles
        returns a appropiated response
        '''
        response = self.client.get(reverse('api_random_article')) 

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Not articles in database')
        self.assertEqual(response['status'], 'fail')    

    def test_get_most_viewed_article(self):
        '''
        Returns the 10 most viewed articles
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')
        article1.views = 1000
        article1.save()
        article2 = create_article('normal article', self.defaultCategory, 'normal content', other_names='neutral')
        article2.views = 50
        article2.save()
        article3 = create_article('boring article', self.defaultCategory, 'boring content', other_names='bad')
        # by default articles has 0 views

        response = self.client.get(reverse('most_viewed'))

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)

        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')

        data = [
            get_ordered_article(article1),
            get_ordered_article(article2),
            get_ordered_article(article3)
        ]

        self.assertEqual(response['articles'], data)

    def test_get_full_article(self):
        '''
        Returns full content of an article search by id
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        section1 = create_section('biography', 'example biography', article, self.section_types['Pure text'])
        section2 = create_section('etimology', 'example etimology', article, self.section_types['Pure text'])
        section3 = create_section('origin', 'example origin', article, self.section_types['Pure text'])


        response = self.client.get(reverse('full_article', args=(str(article.id),)))

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        sections_data = [{'title': s.title, 'content': s.content} for s in [section1, section2, section3]]

        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['article'], get_ordered_article(article))
        self.assertEqual(response['sections'], sections_data)
        self.assertEqual(response['summary'], {})
        self.assertEqual(response['related_articles'], [])

    def test_get_full_article_not_found(self):
        '''
        Trying to get a full article but not exists
        '''
        response = self.client.get(reverse('full_article', args=('100',)))

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)

        self.assertEqual(response['message'], 'Article not found')
        self.assertEqual(response['status'], 'fail')

    def test_get_full_article_invalid_id(self):
        '''
        Trying to get a full article but not exists
        '''
        response = self.client.get(reverse('full_article', args=('wrong',)))

        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)

        self.assertEqual(response['message'], 'Invalid id')
        self.assertEqual(response['status'], 'fail')

    def test_get_all_comments(self):
        '''
        Return all comments of all articles
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')
        article2 = create_article('normal article', self.defaultCategory, 'normal content', other_names='neutral')
        comment1 = create_comment('comment 1', article1, self.author)
        comment2 = create_comment('comment 2', article1, self.author)
        comment3 = create_comment('comment 3', article2, self.author)
        comments = getOrderedComments([comment1, comment2, comment3])

        response = self.client.get(reverse('comments'))
        self.assertEqual(response.status_code, 200)

        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')      
        self.assertEqual(response['comments'], comments)
        
    def test_get_all_comments_with_bloqued_comments(self):
        '''
        Get comments only return the not bloqued comments
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')
        article2 = create_article('normal article', self.defaultCategory, 'normal content', other_names='neutral')
        comment1 = create_comment('comment 1', article1, self.author)
        bloqued_comment = create_comment('comment 2', article1, self.author, bloqued=True)
        comment2 = create_comment('comment 3', article2, self.author)
        comments = getOrderedComments([comment1, comment2])

        response = self.client.get(reverse('comments'))
        self.assertEqual(response.status_code, 200)

        #{"id": 37, "author": "Atlantox7", "content": "Horrible...", "article": 10, "bloqued": false, "date": "2023-03-27 20:46"}
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['comments'], comments)

    def test_get_all_comments_of_article(self):
        '''
        Users can get all comments of a specific article giving the id
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')
        article2 = create_article('normal article', self.defaultCategory, 'normal content', other_names='neutral')
        comment1 = create_comment('comment 1', article1, self.author)
        comment2 = create_comment('comment 2', article1, self.author)
        comment3 = create_comment('comment 3', article2, self.author)
        comments = getOrderedComments([comment1, comment2])

        response = self.client.get(reverse('comments', args=(article1.id,)))
        self.assertEqual(response.status_code, 200)

        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['comments'], comments)

    def test_get_all_comments_comments_not_found(self):
        '''
        If not comments in data base, returns a appropiated message
        '''
        response = self.client.get(reverse('comments'))
        self.assertEqual(response.status_code, 200)

        response = json.loads(response.content)
        self.assertEqual(response['message'], 'No comments in data base')
        self.assertEqual(response['status'], 'fail')

    def test_get_comments_of_article_with_no_comments(self):
        '''
        If not comments in the target article, returns a appropiated message
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        response = self.client.get(reverse('comments', args=(article.id,)))
        self.assertEqual(response.status_code, 200)
        
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'This article not have comments')
        self.assertEqual(response['status'], 'fail')

    def test_write_comment_logged_in(self):
        '''
        Logged users can write comments in any article
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)
        
        response = c.post(reverse('add_comment', args=(article.id,)), {'comment': 'example_comment'})
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)

        self.assertEqual(response['status'], 'ok')

    def test_write_comment_not_logged_in(self):
        '''
        Not logged users can't wrtie comments
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        
        response = self.client.post(reverse('add_comment', args=(article.id,)), {'comment': 'example_comment'})
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        
        self.assertEqual(response['message'], 'You are not logged in')
        self.assertEqual(response['status'], 'fail')

    def test_write_comment_to_article_that_not_exists(self):
        '''
        If an article not exists you can't write comments in that article
        '''
        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)
        
        response = c.post(reverse('add_comment', args=(100,)), {'comment': 'example_comment'})
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)

        self.assertEqual(response['status'], 'fail')

    def test_block_comment_logged_in_as_staff(self):
        '''
        Staff users can block comments, bloqued comments not appear in their article
        After block a comment, redirects to the respective article view
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        comment = create_comment('comment to block', article, self.author)

        c = Client()
        response = c.post(reverse('log_in'), {'username':'admin', 'password': 'admin'}, follow=True)
        self.assertEqual(response.status_code, 200)
        
        response = c.post(reverse('block_comment', args=(article.id,)), {'comment_id': comment.id}, follow=True)
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, article.title)
        comments = Comment.objects.filter(article=article).filter(bloqued=False)
        self.assertEqual(list(comments), [])

    def test_block_comment_comment_not_found(self):
        '''
        Staff users can't block unexisting comments, the user will be redirected to Home
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')

        c = Client()
        response = c.post(reverse('log_in'), {'username':'admin', 'password': 'admin'}, follow=True)
        self.assertEqual(response.status_code, 200)
        
        response = c.post(reverse('block_comment', args=(article.id,)), {'comment_id': 100}, follow=True)
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Welcome to WikiWiki')

    def test_block_comment_user_is_not_staff(self):
        '''
        Normal users cannot block comments
        '''
        article = create_article('example_article', self.defaultCategory, 'main content', other_names='different_name')
        comment = create_comment('comment to block', article, self.author)

        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)
        
        response = c.post(reverse('block_comment', args=(article.id,)), {'comment_id': comment.id}, follow=True)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(Comment.objects.get(article=article).bloqued, False)
        self.assertContains(response, 'Welcome to WikiWiki')

    def test_get_favourites_articles_logged_in(self):
        '''
        Only the logged in users can view their favourite articles
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')
        article2 = create_article('normal article', self.defaultCategory, 'normal content', other_names='neutral')
        add_favourite(article1, self.author)
        favourites = FavouriteArticles.objects.get(user=self.author).articles.values('id', 'title')

        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)

        response = c.get(reverse('favourite'))
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        self.assertEqual(response['favourites'], list(favourites))

    def test_get_favourites_articles_not_logged_in(self):
        '''
        If you try to get favourite articles with no logged in a appropaited message is returned
        '''
        c = Client()

        response = c.get(reverse('favourite'))
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'You are not logged in')
        self.assertEqual(response['status'], 'fail')

    def test_set_article_as_favourite_logged_in(self):
        '''
        Logged in users can add article of their favourite articles collection
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')

        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)

        response = c.post(reverse('add_favourite', args=(article1.id,)))
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')

    def test_set_article_as_favourite_not_logged_in(self):
        '''
        Not logged users can't add articles as favourite
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')

        c = Client()

        response = c.post(reverse('add_favourite', args=(article1.id,)))
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'You are not logged in')
        self.assertEqual(response['status'], 'fail')

    def test_set_article_as_favourite_article_not_found(self):
        '''
        Logged users can't add articles as favourite if the article not exists
        '''
        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)

        response = c.post(reverse('add_favourite', args=(100,)))
        self.assertEqual(response.status_code, 200)
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Article not found')
        self.assertEqual(response['status'], 'fail')

    def test_delete_favourite_logged_in(self):
        '''
        Users logged in can delete an article of their collection of favourrites
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')

        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)

        response = c.post(reverse('add_favourite', args=(article1.id,)))
        self.assertEqual(response.status_code, 200) # Article setted as favourite
        favourite = FavouriteArticles.objects.get(user=self.author)
        self.assertEqual(favourite.articles.first(), article1)

        response = c.delete(reverse('delete_favourite', args=(article1.id,)))
        self.assertEqual(response.status_code, 200)

        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Success')
        self.assertEqual(response['status'], 'ok')
        favourite = FavouriteArticles.objects.get(user=self.author)
        self.assertEqual(list(favourite.articles.all()), [])

    def test_delete_favourite_not_logged_in(self):
        '''
        Not logged users can't delete favourite articles
        '''
        article1 = create_article('famous article', self.defaultCategory, 'interesting content', other_names='nice')
        c = Client()        

        response = c.delete(reverse('delete_favourite', args=(article1.id,)))
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'You are not logged in')
        self.assertEqual(response['status'], 'fail')

    def test_delete_favourite_article_not_found(self):
        '''
        Users can't delete favourite articles if the article is not in the favourite collection of the user
        '''
        c = Client()
        response = c.post(reverse('log_in'), {'username':self.username, 'password': self.password}, follow=True)
        self.assertEqual(response.status_code, 200)

        response = c.delete(reverse('delete_favourite', args=(100,)))
        response = json.loads(response.content)
        self.assertEqual(response['message'], 'Article not found')
        self.assertEqual(response['status'], 'fail')
    
    