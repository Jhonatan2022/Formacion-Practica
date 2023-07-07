# Importamos FastAPI
from fastapi import FastAPI

# Importamos htmlResponse para poder devolver código HTML
from fastapi.responses import HTMLResponse
#------------------------------IMPORT THIS-------------------------------------




# Instanciamos FastAPI
app = FastAPI()

# Para cambiar el nombre de la aplicación
app.title = "My First API" # Se verá en la documentación de la API

# Para asignar la versión de la API
app.version = "1.0.0" # Se verá en la documentación de la API



# Creamos el diccionario que usarémos como base de datos
movies = [
    {
        'id': 1,
        'title': 'Avatar',
        'overview': "En un exuberante planeta llamado Pandora viven los Na'vi, seres que ...",
        'year': '2009',
        'rating': 7.8,
        'category': 'Acción'    
    },
    {
        'id': 2,
        'title': 'Avengers: Endgame',
        'overview': "Después de los eventos devastadores de 'Avengers: Infinity War', el universo ...",
        'year': '2019',
        'rating': 8.4,
        'category': 'Acción'
    }
]




# Definimos una ruta
# Si agregamos "/docs" al final de la URL, nos mostrará la documentación de la API (Swagger UI)
# Tags es para agrupar las rutas en la documentación de la API
@app.get("/", tags=["Home"]) 
def message():
    return HTMLResponse(content="<h1>Welcome to my API</h1>", status_code=200)




# Definimos otra ruta
@app.get("/movies", tags=["Movies"])
def get_movies():
    return movies




# Ruta con parametros
@app.get("/movies/{id}" , tags=["Movies"])
def get_movie(id: int):

    # Buscamos la película por el id
    for movie in movies:
        if movie['id'] == id:
            return movie
    
    # Si no se encuentra la película, devolvemos un mensaje
    return {'message': 'Movie not found'}



# Para ejecutar el servidor de desarrollo
# uvicorn main:app --reload
# main: nombre del archivo
# app: nombre de la instancia de FastAPI    
# --reload: para que se reinicie el servidor cada vez que se haga un cambio en el código
# --port 8000: para especificar el puerto
# --host 0.0.0.0: para especificar la dirección IP (Los 4 ceros es para que sea accesible desde cualquier dirección IP)