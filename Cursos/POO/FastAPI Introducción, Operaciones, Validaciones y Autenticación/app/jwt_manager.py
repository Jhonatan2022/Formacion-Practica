"""
jwt nos permite generar un token para autenticar a los usuarios

Json Web Token (JWT) es un estándar abierto basado en JSON propuesto por IETF para la

"""

# Importamso encode para codificar y decodificar el token
# Importamos decode para decodificar el token y validar si es valido
from jwt import encode, decode



# Creamos una función para generar el token
def create_token(data: dict):

    # Definimos el token y le pasamos los datos que queremos codificar
    # encode() recibe 3 parámetros: pyload, key y algorithm
    # pyload: datos que queremos codificar
    # key: clave secreta para codificar los datos
    # algorithm: algoritmo de codificación
    token: str = encode(payload=data, key='secret', algorithm='HS256')

    # Devolvemos el token
    return token




# Creamos la funcion para validar el token
def validate_token(token: str):

    data: dict = decode(token, key='secret', algorithms=['HS256'])

    return data