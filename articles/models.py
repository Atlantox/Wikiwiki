from django.db import models

ARTICLE_TITLE_LENGTH = 40


class ArticleImages(models.Model):
    title = models.CharField(max_length=30, verbose_name='Image title')
    img = models.ImageField(upload_to='article_imgs', verbose_name='Image')
    description = models.TextField(verbose_name='Description', blank=True, null=True)

    class Meta():
        verbose_name= 'Article image'
        verbose_name_plural= 'Article images'

    def __str__(self):
        return self.title


class SectionType(models.Model):
    name = models.CharField(max_length=30, unique=True, verbose_name='Name')

    class Meta():
        verbose_name= 'Section type'
        verbose_name_plural= 'Section types'

    def __str__(self):
        return self.name


class MainCategory(models.Model):
    name = models.CharField(max_length=30, unique=True, verbose_name='Name')

    class Meta():
        verbose_name= 'Article category'
        verbose_name_plural= 'Article categories'

    def __str__(self):
        return self.name
    
class Subcategory(models.Model):
    category = models.ForeignKey(MainCategory, on_delete=models.CASCADE, verbose_name='Sub-category')
    name = models.CharField(max_length=30, unique=True, verbose_name='Name')

    class Meta():
        verbose_name= 'Subcategory'
        verbose_name_plural= 'Subcategories'

    def __str__(self):
        return self.name


class Article(models.Model):
    title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='Title')
    other_names = models.TextField(verbose_name='Other names')
    images = models.ManyToManyField(ArticleImages, verbose_name="Article main image(s)")
    category = models.ForeignKey(MainCategory, verbose_name='Main Category', on_delete=models.SET_NULL, null=True)
    subcategory = models.ManyToManyField(Subcategory, verbose_name='Subcategories')
    main = models.TextField(verbose_name='Main content')  # This are the firsts paragraphs of content
    views = models.PositiveBigIntegerField(verbose_name='Views number')

    class Meta():
        verbose_name= 'Article'
        verbose_name_plural= 'Articles'

    def __str__(self):
        return self.title
    

class ArticleSummary(models.Model):
    article = models.OneToOneField(Article, on_delete=models.CASCADE, default=None, null=True)
    summary = models.TextField(verbose_name="Article's summary", default=None, null=True)

    class Meta():
        verbose_name= 'Article summary'
        verbose_name_plural= 'Articles summaries'

    def __str__(self):
        return f"{self.article.title}'s summary"


class ArticleSection(models.Model):
    title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='Title')
    content = models.TextField(verbose_name='Section text', blank=True, null=True)
    targetArticle = models.ForeignKey(Article, verbose_name='Target article', on_delete=models.CASCADE)
    images = models.ManyToManyField(ArticleImages, verbose_name='Section images', blank=True)
    articleType = models.ForeignKey(SectionType, verbose_name='Section type', on_delete=models.SET_NULL, null=True)
    order = models.PositiveIntegerField(default=0, verbose_name='Show order')
    visible = models.BooleanField(default=True, verbose_name='Is visible')
    collapse = models.BooleanField(default=False, verbose_name='Is collapse')

    class Meta():
        verbose_name= 'Article section'
        verbose_name_plural= 'Article sections'

    def __str__(self):
        return f'{self.title}: {self.targetArticle.title}'


class RelatedArticles(models.Model):
    article_title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name="Title of target article")
    related = models.ManyToManyField(Article, verbose_name='Related articles')

    class Meta():
        verbose_name= 'Related articles'
        verbose_name_plural= 'Related articles'

    def __str__(self):
        return self.article_title