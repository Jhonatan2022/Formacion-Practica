# Importamos APIRouter para poder crear rutas
from fastapi import APIRouter

# Importamos el generate_token de jwt_manager.py
from utils.jwt_manager import create_token

# Importamos jsonResponse para poder devolver código JSON
from fastapi.responses import JSONResponse

# Importamos User para poder usarlo
from schemas.user import User
#------------------------------IMPORT THIS-------------------------------------



# Asignamos un nombre al router
user_router = APIRouter()




# Creamos una ruta para que el usuario se pueda loguear y le devolvemos un token
@user_router.post("/login", tags=["Auth"])
def login(user: User):
    
    if user.email == "admin@gmail.com" and user.password == "admin":
        token: str = create_token(user.dict())

        return JSONResponse(status_code=200, content=token)