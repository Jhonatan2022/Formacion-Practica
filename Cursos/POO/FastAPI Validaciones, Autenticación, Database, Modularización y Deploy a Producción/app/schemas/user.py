# Importamos BaseModel para poder usar validaciones
from pydantic import BaseModel



# Creamos una clase de usuario que hereda de BaseModel para poder usar validaciones
class User(BaseModel):
    email:str
    password:str