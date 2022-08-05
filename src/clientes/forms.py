from django import forms
from django.db.models import fields
from matplotlib.pyplot import cla
from .models import Cliente

class Formulario_Cliente(forms.ModelForm):
    class Meta:
        model = Cliente
        exclude = ()

class AgregarCliente(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = {'nombre', 'primerApellido', 'segundoApellido', 'correo'}