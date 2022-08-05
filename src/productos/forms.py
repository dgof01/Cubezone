from django import forms
from django.db.models import fields
from matplotlib.pyplot import cla
from .models import Producto

class Formulario_Producto(forms.ModelForm):
    class Meta:
        model = Producto
        exclude = ()

class AgregarProducto(forms.ModelForm):
    class Meta:
        model = Producto
        fields = {'nombre', 'precio'}