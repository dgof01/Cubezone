from django import forms
from .models import Perfil

class Formulario_Perfil(forms.ModelForm):
    class Meta:
        model = Perfil
        exclude = ('user',)