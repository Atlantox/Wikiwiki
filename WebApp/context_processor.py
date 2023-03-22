from comments.models import Author

def get_nickname(request):
    nickname = ''
    if request.user.is_authenticated:
        author = Author.objects.get(user=request.user)
        nickname = author.nickname
    return {'nickname': nickname}