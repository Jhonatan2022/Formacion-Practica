# Importamos FastAPI
# Importamos Body para poder usar el metodo post y recibir datos en el body
from fastapi import FastAPI, Body

# Importamos htmlResponse para poder devolver código HTML
from fastapi.responses import HTMLResponse

# Importamos requests de fastapi para poder usar el metodo post
from fastapi import Request

# Importamos BaseModel para poder usar validaciones
from pydantic import BaseModel

# Importamso opional para poder usar validaciones
from typing import Optional
#------------------------------IMPORT THIS-------------------------------------




# Instanciamos FastAPI
app = FastAPI()

# Para cambiar el nombre de la aplicación
app.title = "My First API" # Se verá en la documentación de la API

# Para asignar la versión de la API
app.version = "1.0.0" # Se verá en la documentación de la API



# Creamos una clase movia que hereda de BaseModel para poder usar validaciones
class Movie(BaseModel):
    id: Optional[int] = None # Optional para que el id sea opcional
    title: str
    overview: str
    year: str
    rating: float
    category: str


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




# Parametros query
@app.get("/movies/", tags=["Movies"])
def get_movies_category(category: str, year: int):

    # Buscamos la película por la categoría y el año
    for movie in movies:
        if movie['category'] == category and movie['year'] == str(year):
            return movie
        
    # Si no se encuentra la película, devolvemos un mensaje
    return {'message': 'Movie not found'}




# Metodo POST
@app.post("/movies", tags=["Movies"])
def add_movie(movie: Movie):

    # Agregamos la película a la base de datos
    movies.append(movie)    

    # Devolvemos la lista de películas actualizada
    return movies




# Metodo PUT
@app.put("/movies/{id}", tags=["Movies"])
def update_movie(id: int, movie: Movie):

    # Buscamos la película por el id
    for item in movies:
        if item['id'] == id:
            item['title'] = movie.title
            item['overview'] = movie.overview
            item['year'] = movie.year
            item['rating'] = movie.rating
            item['category'] = movie.category


            # Devolvemos el id de la pelicula actualizada y la lista de películas actualizada
            return {'message': 'Success Update','id': id, 'movies': movies}
    
    # Si no se encuentra la película, devolvemos un mensaje
    return {'message': 'Movie not found'}




# Metodo DELETE
@app.delete("/movies/{id}", tags=["Movies"])
def delete_movie(id: int):

    # Buscamos la película por el id
    for movie in movies:
        if movie['id'] == id:
            movies.remove(movie)

            # Devolvemos un mensaje de confirmación con las películas actualizadas
            return {'message': 'Movie deleted', 'movies': movies}
    
    # Si no se encuentra la película, devolvemos un mensaje
    return {'message': 'Movie not found'}




# Para ejecutar el servidor de desarrollo
# uvicorn main:app --reload
# main: nombre del archivo
# app: nombre de la instancia de FastAPI    
# --reload: para que se reinicie el servidor cada vez que se haga un cambio en el código
# --port 8000: para especificar el puerto
# --host 0.0.0.0: para especificar la dirección IP (Los 4 ceros es para que sea accesible desde cualquier dirección IP)