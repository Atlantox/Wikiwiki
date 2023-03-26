from django import forms

class CommentForm(forms.Form):
    '''
        The comment form
    '''

    comment = forms.CharField(
        max_length=200, 
        widget=forms.Textarea(
            attrs={'class': 'fs-5 col-8 bg-primary align-self-start p-1',
                   'rows': "3"}
    ))