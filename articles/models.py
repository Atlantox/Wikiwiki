from django.db import models

ARTICLE_TITLE_LENGTH = 40

class ArticleSummary(models.Model):
    target_article = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name="Target article's name")
    nickname = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='', blank=True, null=True, default='')
    realName = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    race = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    parents = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    couple = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    age = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    gender = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    favourite_food = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    favourite_color = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    civil_state = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    height = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    weight = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    birthdate = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    birthplace = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    begin_date = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    end_date = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    date = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    year = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    created_by = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    nacionality = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    status = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    location = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    branch = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    extension = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    population = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    speciality = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    participants_number = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    duration = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    symptoms = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    victims = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    species = models.CharField(max_length=50, verbose_name='', blank=True, null=True, default='')
    type = models.CharField(max_length=100, verbose_name='', blank=True, null=True, default='')
    result = models.CharField(max_length=20, verbose_name='', blank=True, null=True, default='')
    group = models.CharField(max_length=50, verbose_name='', blank=True, null=True, default='')
    king = models.CharField(max_length=50, verbose_name='', blank=True, null=True, default='')
    ruler = models.CharField(max_length=50, verbose_name='', blank=True, null=True, default='')
    # To add a new field, just copy, paste and rename the new var

    class Meta():
        verbose_name= 'Article summary'
        verbose_name_plural= 'Article summaries'

    def __str__(self):
        return self.target_article


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


class ArticleCategory(models.Model):
    name = models.CharField(max_length=30, unique=True, verbose_name='Name')

    class Meta():
        verbose_name= 'Article category'
        verbose_name_plural= 'Article categories'

    def __str__(self):
        return self.name


class Article(models.Model):
    title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='Title')
    other_names = models.TextField(verbose_name='Other names')
    images = models.ManyToManyField(ArticleImages, verbose_name="Article main's images")
    category = models.ManyToManyField(ArticleCategory, verbose_name='Category(ies)')
    main = models.TextField(verbose_name='Main content')  # This are the firsts paragraphs of content
    summary = models.OneToOneField(ArticleSummary, verbose_name='Summary', on_delete=models.SET_NULL, null=True)
    views = models.PositiveBigIntegerField(verbose_name='Views number')

    class Meta():
        verbose_name= 'Article'
        verbose_name_plural= 'Articles'

    def __str__(self):
        return self.title


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
        return f'{self.title} {self.targetArticle.title}'


class RelatedArticles(models.Model):
    article_title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name="Title of target article")
    related = models.ManyToManyField(Article, verbose_name='Related articles')

    class Meta():
        verbose_name= 'Related articles'
        verbose_name_plural= 'Related articles'

    def __str__(self):
        return self.article_title