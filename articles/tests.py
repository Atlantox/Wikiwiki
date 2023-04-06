from django.test import TestCase
from django.core.files.uploadedfile import SimpleUploadedFile
from django.urls import reverse
from . import models

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


class ArticleTest(TestCase):
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

    def test_article_not_found_by_id(self):
        ''' If a user search an article that doesn't exists, a appropiated message is displayed '''
        response = self.client.get(reverse('article', args=(1,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Article not found')
        self.assertEqual(response.context['found'], False)

    def test_article_not_found_by_title(self):
        ''' If a user search an article that doesn't exists, a appropiated message is displayed '''
        response = self.client.get(reverse('article', args=('example title',)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Article not found')
        self.assertEqual(response.context['found'], False)

    def test_article_found_by_id(self):
        ''' IF a user search an article and it exists, the target article is displayed '''

        article = create_article('example article', self.defaultCategory, 'example content')

        url = reverse('article', args=(article.id,))
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, article.title)

    def test_article_found_by_title(self):
        ''' IF an user search an article and it exists, the target article is displayed '''

        article = create_article('example article', self.defaultCategory, 'example content')

        url = reverse('article', args=(article.title,))
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, article.title)

    def test_more_than_one_article_found_in_search_title_coincidence(self):
        ''' If an user do a search and the system found a title coincidence(s), return all coincidences '''

        article1 = create_article('same title', self.defaultCategory, 'main content 1')
        article2 = create_article('same title', self.defaultCategory, 'main content 2')


        url = reverse('article', args=(article1.title,))
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, article1.title)
        self.assertContains(response, article2.title)

        queryset = [
            {
                'id':article1.id,
                'title':article1.title
            },
            {
                'id':article2.id,
                'title':article2.title
            }
        ]
        self.assertQuerysetEqual(list(response.context['articles']), queryset)

    def test_more_than_one_article_found_in_search_other_names_coincidence(self):
        ''' If an user do a search and the system found a other_names coincidence(s), return all coincidences '''

        article1 = create_article('a title', self.defaultCategory, 'main content 1', other_names='banana,turtle')
        article2 = create_article('totally diferent title', self.defaultCategory, 'main content 2', other_names='ball,turtle')


        url = reverse('article', args=('turtle',))  # Searching 'turtle'
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, article1.title)
        self.assertContains(response, article2.title)

        queryset = [
            {
                'id':article1.id,
                'title':article1.title
            },
            {
                'id':article2.id,
                'title':article2.title
            }
        ]

        self.assertQuerysetEqual(list(response.context['articles']), queryset)
       

    def test_article_page_have_hyperlinks_of_other_articles_coincidence_by_title(self):
        ''' 
        If in any text of an article (main, summary, sections's content) appears the title of another article,
        automatically an <a></a> hyperlink to that article is inserted in that text
        '''
        dogs = create_article('Dogs', self.defaultCategory, 'Fight with cats')
        cats = create_article('Cats', self.defaultCategory, 'Fight with dogs')

        dogs_url = reverse('article', args=(dogs.title.title(),))
        cats_url = reverse('article', args=(cats.title.title(),))

        link = '<a class="text-capitalize fw-bold text-white" href="{0}">'

        # Testing if Dogs article contain Cats hyperlink
        response = self.client.get(dogs_url)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, link.format(cats_url.lower()))

        # Testing if Cats article contain Dogs hyperlink
        response = self.client.get(cats_url)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, link.format(dogs_url).lower())
        
    def test_article_page_have_hyperlinks_of_other_articles_coincidence_by_other_names(self):
        ''' 
        If in any text of an article (main, summary, sections's content) appears the other_names of another article,
        automatically an <a></a> hyperlink to that article is inserted in that text
        '''
        dogs = create_article('A title', self.defaultCategory, 'Hate felines', other_names='canines,dogs')
        cats = create_article('A different title', self.defaultCategory, 'Hate dogs', other_names='felines,cats')

        dogs_url = reverse('article', args=(dogs.title,))
        cats_url = reverse('article', args=(cats.title,))
        link = '<a class="text-capitalize fw-bold text-white" href="{0}">'
        
        # Testing if Dogs article contain Cats hyperlink
        response = self.client.get(dogs_url)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, link.format(cats_url).lower())

        # Testing if Cats article contain Dogs hyperlink
        response = self.client.get(cats_url)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, link.format(dogs_url).lower())

    def test_display_categories_correctly(self):
        ''' Categories view displays all categories '''
        response = self.client.get(reverse('categories'))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.defaultCategory.name)

    def test_category_not_found(self):
        ''' If a user search for a category that doesn' exists, displays an appropiate message '''
        response = self.client.get(reverse('category', args=(8,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Category not found')
        self.assertEqual(response.context['found'], False)

    def test_display_multiple_categories_correctly(self):
        ''' Categories view displays all categories '''
        other_category = models.Category.objects.create(
            name = 'other category',
            img = self.defaultCategory.img
        )
        other_category.save()
        response = self.client.get(reverse('categories'))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Categories')
        self.assertContains(response, self.defaultCategory.name)
        self.assertContains(response, other_category.name)
        self.assertQuerysetEqual(list(response.context['categories']), [self.defaultCategory, other_category])

    def test_display_all_articles_of_category(self):
        ''' In the view of each category, it displays all articles of that category '''
        article1 = create_article('example article', self.defaultCategory, 'example main content')
        article2 = create_article('another artcle', self.defaultCategory, 'another main content')

        url = reverse('category', args=(self.defaultCategory.name,))
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.defaultCategory.name +' Category')

        queryset = [
            {
                'id':article2.id,
                'title':article2.title
            },
            {
                'id':article1.id,
                'title':article1.title
            }
        ]

        self.assertQuerysetEqual(response.context['articles'], queryset)
    
    def test_display_category_of_article(self):
        ''' If an article has one category, that category is displayed '''
        article1 = create_article('example article', self.defaultCategory, 'example main content')

        response = self.client.get(reverse('article', args=(article1.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.defaultCategory.name)

    def test_display_all_categories_of_article(self):
        ''' In the article view, all categories of the article are displayed '''
        other_category = models.Category.objects.create(
            name = 'other category',
            img = self.defaultCategory.img
        )
        other_category.save()

        article1 = create_article('example article', [self.defaultCategory, other_category], 'example main content')

        response = self.client.get(reverse('article', args=(article1.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.defaultCategory.name)
        self.assertContains(response, other_category.name)

    def test_article_with_no_sections(self):
        ''' If the article doesn't have a section, no sections are displayed '''
        article1 = create_article('example article', self.defaultCategory, 'example main content')
        response = self.client.get(reverse('article', args=(article1.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertNotContains(response, 'article-section')

    def test_article_with_sections(self):
        ''' If an article have sections, they are displayed '''
        article1 = create_article('example article', self.defaultCategory, 'example main content')

        section = create_section(
            title='example section',
            content='This is the content of the example section',
            targetArticle=article1,
            sectionType=self.section_types['Pure text']
        )

        response = self.client.get(reverse('article', args=(article1.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'article-section')
        self.assertContains(response, section.content)
        self.assertContains(response, f'{article1.title}-{section.title}-section')
    
    def test_article_not_related_with_others_articles(self):
        ''' An article without related articles will not display related articles '''
        article1 = create_article('example article', self.defaultCategory, 'example main content')

        response = self.client.get(reverse('article', args=(article1.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertNotContains(response, 'Related articles:')
        self.assertQuerysetEqual(response.context['relatedArtices'], [])

    def test_article_related_with_others_articles(self):
        ''' An article with related articles will display all related articles '''
        article1 = create_article('example article', self.defaultCategory, 'example main content')
        article2 = create_article('another article', self.defaultCategory, 'another content')

        related = models.RelatedArticles.objects.create(article_title=article1.title)
        related.related.set([article2])
        related.save()

        response = self.client.get(reverse('article', args=(article1.title,)))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Related articles:')
        self.assertQuerysetEqual(response.context['relatedArtices'], [{'id':article2.id, 'title':article2.title}])
