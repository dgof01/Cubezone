from django import forms

TIPOS_DE_GRAFICAS = (
    ('#1', 'Gráfica de Barras'),
    ('#2', 'Gráfico Circular'),
    ('#3', 'Gráfico de Linea'),
)

RESULTADOS = (
    ('#1', 'Ordenes'),
    ('#2', 'Fechas'),
)

class Formulario_BusquedaDeVentas(forms.Form):
    fechaInicio = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    fechaFin = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    tipoGrafica = forms.ChoiceField(choices=TIPOS_DE_GRAFICAS)
    resultados = forms.ChoiceField(choices=RESULTADOS)