from django import forms
from .models import Reporte

class Formulario_Reporte(forms.ModelForm):
    class Meta:
        model = Reporte
        fields = {'nombre', 'comentarios'}
