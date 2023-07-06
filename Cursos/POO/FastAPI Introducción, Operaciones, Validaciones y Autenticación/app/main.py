# Importamos FastAPI
from fastapi import FastAPI


# Instanciamos FastAPI
app = FastAPI()

# Para cambiar el nombre de la aplicación
# app.title = "My First API"


# Definimos una ruta
# Si agregamos "/docs" al final de la URL, nos mostrará la documentación de la API (Swagger UI)
@app.get("/") 
def message():
    return ("Hola a todos")


# Definimos otra ruta
@app.get("/items")
def item (name):
    return {"name": name}


# Para ejecutar el servidor de desarrollo
# uvicorn main:app --reload
# main: nombre del archivo
# app: nombre de la instancia de FastAPI    
# --reload: para que se reinicie el servidor cada vez que se haga un cambio en el código
# --port 8000: para especificar el puerto
# --host 0.0.0.0: para especificar la dirección IP (Los 4 ceros es para que sea accesible desde cualquier dirección IP)