import base64, uuid
from django.core.files.base import ContentFile

def obtener_img_del_Reporte(img):
    _ , str_image = img.split(';base64')
    decoded_img = base64.b64decode(str_image)
    nombreIMG = str(uuid.uuid4())[:10] + '.png'
    img = ContentFile(decoded_img, name=nombreIMG)
    return img