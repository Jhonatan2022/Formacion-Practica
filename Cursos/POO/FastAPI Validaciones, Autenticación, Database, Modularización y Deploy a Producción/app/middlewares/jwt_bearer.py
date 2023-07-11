# Importamos httpbearer para poder usar el metodo post y recibir datos en el body
from fastapi.security import HTTPBearer

# Importamos request para poder usar el metodo post y recibir datos en el body
from fastapi import Request, HTTPException

# Importamos el generate_token de jwt_manager.py
from utils.jwt_manager import create_token, validate_token


# Creamos una clase que hereda httpbearer para poder usar el metodo post y recibir datos en el body
class Auth(HTTPBearer):

    # Ponemos la funcion asincrona para que se ejecute en segundo plano (no bloquee la ejecución de otras funciones)
    async def __call__(self, request: Request):
        
        auth = await super().__call__(request)

        # Llamamos a la funcion validate_token y le pasamos el token
        # Credentials es el token
        data = validate_token(auth.credentials)
        
        # Si el token es valido, devolvemos el token
        if data['email'] != "admin@gmail.com":
            raise HTTPException(status_code=401, detail="Invalid token")
