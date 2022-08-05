import uuid, base64
from clientes.models import Cliente
from perfiles.models import Perfil
from io import BytesIO
import matplotlib.pyplot as plt
import seaborn as sns

def generar_codigo():
    codigo = str(uuid.uuid4()).replace('-', '').upper()[:12]
    return codigo

def obtener_vendedor_desde_id(val):
    vendedor = Perfil.objects.get(id=val)
    return vendedor.usuario.username

def obtener_cliente_desde_id(val):
    cliente = Cliente.objects.get(id=val)
    return cliente

def obtener_graficaPNG():
    buffer = BytesIO()
    plt.savefig(buffer, format='png')
    buffer.seek(0)
    png = buffer.getvalue()
    graficaPNG = base64.b64encode(png)
    graficaPNG = graficaPNG.decode('utf-8')
    buffer.close()
    return graficaPNG

def obtener_campo(resultados):
    if resultados == '#1':
        campo = 'Orden'
    elif resultados == '#2':
        campo = 'Creado'
    return campo

def obtener_grafica(tipoGrafica, datos, resultados, **kwargs):
    plt.switch_backend('AGG')
    fig = plt.figure(figsize=(10,4))
    campo = obtener_campo(resultados)
    datosObenidos = datos.groupby(campo, as_index=False)['Precio Total'].agg('sum')
    if tipoGrafica == '#1':
        sns.barplot(x=campo, y='Precio Total', data=datosObenidos)
    elif tipoGrafica == '#2':
        plt.pie(data=datosObenidos, x='Precio Total', labels=datosObenidos[campo].values)
    elif tipoGrafica == '#3':
        plt.plot(datosObenidos[campo], datosObenidos['Precio Total'])
    else:
        print("error")
    plt.tight_layout()
    graficaPNG = obtener_graficaPNG()
    return graficaPNG

