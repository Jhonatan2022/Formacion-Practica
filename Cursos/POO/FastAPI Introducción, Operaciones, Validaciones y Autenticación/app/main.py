# Importamos FastAPI
# Importamos Body para poder usar el metodo post y recibir datos en el body
# Importamos path para poder usar parametros en la ruta
# Importamos Query para poder usar parametros query
from fastapi import FastAPI, Body, Path, Query

# Importamos htmlResponse para poder devolver código HTML
# Importamos jsonResponse para poder devolver código JSON
from fastapi.responses import HTMLResponse, JSONResponse

# Importamos requests de fastapi para poder usar el metodo post
from fastapi import Request

# Importamos BaseModel para poder usar validaciones
# Importamos Field para poder usar validaciones en los campos (requeridos, longitud, etc)
from pydantic import BaseModel, Field

# Importamso opional para poder usar validaciones
# Importamos list para poder usar listas en las validaciones
from typing import Optional, List
#------------------------------IMPORT THIS-------------------------------------




# Instanciamos FastAPI
app = FastAPI()

# Para cambiar el nombre de la aplicación
app.title = "My First API" # Se verá en la documentación de la API

# Para asignar la versión de la API
app.version = "1.0.0" # Se verá en la documentación de la API



# Creamos una clase movia que hereda de BaseModel para poder usar validaciones
class Movie(BaseModel):
    # Optional para que el id sea opcional
    id: Optional[int] = None 
    # Field para usar validaciones (requerido, longitud, etc
    title: str = Field(min_length=2, max_length=50) 
    overview: str = Field(min_length=2, max_length=50)
    # le: es menor o igual, ge: es mayor o igual
    year: str = Field(default=2023, le=2023, ge=1990) 
    rating: float = Field(default=7.8, le=10, ge=1)
    category: str = Field(min_length=6, max_length=20)


    class Config:
        schema_extra = {
            "example": {
                "id": 1,
                "title": "Film Title",
                "overview": "Description of the film",
                "year": 2023,
                "rating": 7.8,
                "category": "Action"
            }
        }




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
# Usamos response_model para devolver un modelo de datos en formato de lista (List[Movie])
@app.get("/movies", tags=["Movies"], response_model=List[Movie])
def get_movies() -> List[Movie]:

    # status_code: para devolver un código de estado (200: OK, 404: Not Found, 500: Internal Server Error, etc)
    return JSONResponse(content=movies, status_code=200)




# Ruta con parametros
@app.get("/movies/{id}" , tags=["Movies"], response_model=Movie)
def get_movie(id: int = Path(ge=1)) -> Movie:

    # Buscamos la película por el id
    for movie in movies:
        if movie['id'] == id:
            return JSONResponse(content=movie, status_code=200)
    
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Movie not found'}, status_code=404)




# Parametros query
@app.get("/movies/", tags=["Movies"], response_model=List[Movie])
def get_movies_category(category: str = Query(min_length=6, max_length=20)) -> List[Movie]:

    # Buscamos la película por la categoría y el año y lo almacenamos en una variable
    movies_found = [movie for movie in movies if movie['category'] == category]
        
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content=movies_found, status_code=200)




# Metodo POST
@app.post("/movies", tags=["Movies"], response_model=List[Movie])
def add_movie(movie: Movie) -> List[Movie]:

    # Agregamos la película a la base de datos
    movies.append(movie)    

    # Devolvemos la lista de películas actualizada
    return JSONResponse(content={'message': 'Success', 'movies': movies}, status_code=201)




# Metodo PUT
@app.put("/movies/{id}", tags=["Movies"], response_model=List[Movie])
def update_movie(id: int, movie: Movie) -> List[Movie]:

    # Buscamos la película por el id
    for item in movies:
        if item['id'] == id:
            item['title'] = movie.title
            item['overview'] = movie.overview
            item['year'] = movie.year
            item['rating'] = movie.rating
            item['category'] = movie.category


            # Devolvemos el id de la pelicula actualizada y la lista de películas actualizada
            return JSONResponse(content={'message': 'Movie updated', 'movie': item, 'movies': movies}, status_code=200)
    
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Movie not found'}, status_code=404)




# Metodo DELETE
@app.delete("/movies/{id}", tags=["Movies"], response_model=List[Movie])
def delete_movie(id: int) -> List[Movie]:

    # Buscamos la película por el id
    for movie in movies:
        if movie['id'] == id:
            movies.remove(movie)

            # Devolvemos un mensaje de confirmación con las películas actualizadas
            return JSONResponse(content={'message': 'Movie deleted', 'movies': movies}, status_code=200)
    
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Movie not found'}, status_code=404)




# Para ejecutar el servidor de desarrollo
# uvicorn main:app --reload
# main: nombre del archivo
# app: nombre de la instancia de FastAPI    
# --reload: para que se reinicie el servidor cada vez que se haga un cambio en el código
# --port 8000: para especificar el puerto
# --host 0.0.0.0: para especificar la dirección IP (Los 4 ceros es para que sea accesible desde cualquier dirección IP)