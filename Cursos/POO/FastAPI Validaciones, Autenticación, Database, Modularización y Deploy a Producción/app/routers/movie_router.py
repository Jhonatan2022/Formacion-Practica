# Importamos apirouter para poder usar el metodo post y recibir datos en el body
# Importamos Body para poder usar el metodo post y recibir datos en el body
# Importamos path para poder usar parametros en la ruta
# Importamos Query para poder usar parametros query
from fastapi import APIRouter, Depends, Path, Query

# Importamos jsonResponse para poder devolver código JSON
from fastapi.responses import JSONResponse


# Importamos list para poder usar listas en las validaciones
from typing import List

# Importamos las variables de configuración de la base de datos
from config.database import Session

# Importamos el modelo de la base de datos
from models.movie import Movie as MovieModel

# Importamos jsonable_encoder para poder convertir los modelos de datos a JSON
from fastapi.encoders import jsonable_encoder


# Importamos auth para poder usar middlewares (intermediarios)
from middlewares.jwt_bearer import Auth

# Importamos movieservice para poder usarlo
from services.services_movies import MovieService

# Importamos movie para poder usarlo
from schemas.movie import Movie
#------------------------------IMPORT THIS-------------------------------------



# Asignamos un nombre al router
movie_router = APIRouter()





# Definimos otra ruta
# Usamos response_model para devolver un modelo de datos en formato de lista (List[Movie])
# , dependencies=[Depends(Auth())]
@movie_router.get("/movies", tags=["Movies"], response_model=List[Movie], dependencies=[Depends(Auth())])
def get_movies() -> List[Movie]:

    db = Session()

    # Obtenemos todas las películas de la base de datos
    result = MovieService(db).get_movies()

    # status_code: para devolver un código de estado (200: OK, 404: Not Found, 500: Internal Server Error, etc)
    return JSONResponse(content=jsonable_encoder(result), status_code=200)




# Ruta con parametros
@movie_router.get("/movies/{id}" , tags=["Movies"], response_model=dict)
def get_movie(id: int = Path(ge=1)) -> dict:

    db = Session()

    # Obtenemos la película por el id
    result = MovieService(db).get_movie_id(id)

    # Si no se encuentra la película, devolvemos un mensaje
    if not result:
        return JSONResponse(content={'message': 'Movie not found'}, status_code=404)
    
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content=jsonable_encoder(result), status_code=200)




# Parametros query
@movie_router.get("/movies/", tags=["Movies"], response_model=List[Movie])
def get_movies_category(category: str = Query(min_length=6, max_length=20)) -> List[Movie]:

    db = Session()

    # Obtenemos todas las películas de la base de datos
    result = MovieService(db).get_movies_category(category)

    # Si no se encuentra la película, devolvemos un mensaje
    if not result:
        return JSONResponse(content={'message': 'Movie not found'}, status_code=404)
        
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content=jsonable_encoder(result), status_code=200)




# Metodo POST
@movie_router.post("/movies", tags=["Movies"], response_model=dict)
def add_movie(movie: Movie) -> dict:

    # Creamos una instancia de session
    db = Session()

    # Usamos el metodo add_movie de MovieService para agregar una película
    MovieService(db).add_movie(movie)

    # Devolvemos la lista de películas actualizada
    return JSONResponse(content={'message': 'Movie added'}, status_code=201)




# Metodo PUT
@movie_router.put("/movies/{id}", tags=["Movies"], response_model=dict)
def update_movie(id: int, movie: Movie) -> dict:

    db = Session()

    # Obtenemos la película por el id
    result = MovieService(db).get_movie_id(id)

    # Si no se encuentra la película, devolvemos un mensaje
    if not result:
        return JSONResponse(content={'message': 'Movie not found'}, status_code=404)
    
    # Actualizamos la película
    MovieService(db).update_movie(id, movie)

    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Update success'}, status_code=200)




# Metodo DELETE
@movie_router.delete("/movies/{id}", tags=["Movies"], response_model=List[Movie])
def delete_movie(id: int) -> List[Movie]:

    db = Session()

    # Obtenemos la película por el id
    result = MovieService(db).get_movie_id(id)

    # Si no se encuentra la película, devolvemos un mensaje
    if not result:
        return JSONResponse(content={'message': 'Movie not found'}, status_code=404)
    
    # Eliminamos la película
    MovieService(db).delete_movie(id)
    
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Delete success'}, status_code=200)
