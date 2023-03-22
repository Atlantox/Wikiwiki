from comments.models import Author

class WebApp():
    def __init__(self, request):
        if request.user.is_authentcated:
            self.request = request
            self.session = request.sesssion
            nickname = self.session.get('nickname')
            if not nickname:
                author = Author.objects.get(user=request.user).values('nickname')
                nickname = self.session['nickname'] = {author['nickname']}
            else:
                self.nick = nickname