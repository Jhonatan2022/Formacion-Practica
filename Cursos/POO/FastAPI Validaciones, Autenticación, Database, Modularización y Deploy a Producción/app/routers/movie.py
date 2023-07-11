# Importamos apirouter para poder usar el metodo post y recibir datos en el body
# Importamos Body para poder usar el metodo post y recibir datos en el body
# Importamos path para poder usar parametros en la ruta
# Importamos Query para poder usar parametros query
from fastapi import APIRouter, Depends, Path, Query

# Importamos jsonResponse para poder devolver código JSON
from fastapi.responses import JSONResponse

# Importamos BaseModel para poder usar validaciones
# Importamos Field para poder usar validaciones en los campos (requeridos, longitud, etc)
from pydantic import BaseModel, Field

# Importamso opional para poder usar validaciones
# Importamos list para poder usar listas en las validaciones
from typing import Optional, List

# Importamos las variables de configuración de la base de datos
from config.database import Session

# Importamos el modelo de la base de datos
from models.movie import Movie as MovieModel

# Importamos jsonable_encoder para poder convertir los modelos de datos a JSON
from fastapi.encoders import jsonable_encoder


# Importamos auth para poder usar middlewares (intermediarios)
from middlewares.jwt_bearer import Auth
#------------------------------IMPORT THIS-------------------------------------



# Asignamos un nombre al router
movie_router = APIRouter()



# Creamos una clase movia que hereda de BaseModel para poder usar validaciones
class Movie(BaseModel):
    # Optional para que el id sea opcional
    id: Optional[int] = None 
    # Field para usar validaciones (requerido, longitud, etc
    title: str = Field(min_length=5, max_length=15  ) 
    overview: str = Field(min_length=2, max_length=50)
    # le: es menor o igual, ge: es mayor o igual
    year: int = Field(le=2023, ge=1990) 
    # ge: es mayor o igual, le: es menor o igual
    rating: float = Field( ge=1, le=10) 
    category: str = Field(min_length=6, max_length=15)


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




# Definimos otra ruta
# Usamos response_model para devolver un modelo de datos en formato de lista (List[Movie])
@movie_router.get("/movies", tags=["Movies"], response_model=List[Movie], dependencies=[Depends(Auth())])
def get_movies() -> List[Movie]:

    db = Session()

    # Obtenemos todas las películas de la base de datos
    result = db.query(MovieModel).all()

    # status_code: para devolver un código de estado (200: OK, 404: Not Found, 500: Internal Server Error, etc)
    return JSONResponse(content=jsonable_encoder(result), status_code=200)




# Ruta con parametros
@movie_router.get("/movies/{id}" , tags=["Movies"], response_model=dict)
def get_movie(id: int = Path(ge=1)) -> dict:

    db = Session()

    # Obtenemos la película por el id
    result = db.query(MovieModel).filter(MovieModel.id == id).first()

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
    result = db.query(MovieModel).filter(MovieModel.category == category).all()

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

    new_movie = MovieModel(**movie.dict())

    # Agregamos la película a la base de datos
    db.add(new_movie)

    # Guardamos los cambios en la base de datos
    db.commit()

    # Agregamos la película a la base de datos
    # movies.append(movie)    

    # Devolvemos la lista de películas actualizada
    return JSONResponse(content={'message': 'Movie added'}, status_code=201)




# Metodo PUT
@movie_router.put("/movies/{id}", tags=["Movies"], response_model=dict)
def update_movie(id: int, movie: Movie) -> dict:

    db = Session()

    # Obtenemos la película por el id
    result = db.query(MovieModel).filter(MovieModel.id == id).first()

    # Si no se encuentra la película, devolvemos un mensaje
    if not result:
        return JSONResponse(content={'message': 'Movie not found'}, status_code=404)

    # Actualizamos la película
    result.title = movie.title
    result.overview = movie.overview
    result.year = movie.year
    result.rating = movie.rating
    result.category = movie.category

    # Guardamos los cambios en la base de datos
    db.commit()

    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Update success'}, status_code=200)




# Metodo DELETE
@movie_router.delete("/movies/{id}", tags=["Movies"], response_model=List[Movie])
def delete_movie(id: int) -> List[Movie]:

    db = Session()

    # Obtenemos la película por el id
    result = db.query(MovieModel).filter(MovieModel.id == id).first()

    # Si no se encuentra la película, devolvemos un mensaje
    if not result:
        return JSONResponse(content={'message': 'Movie not found'}, status_code=404)
    
    # Eliminamos la película
    db.delete(result)

    # Guardamos los cambios en la base de datos
    db.commit()
    
    # Si no se encuentra la película, devolvemos un mensaje
    return JSONResponse(content={'message': 'Delete success'}, status_code=200)
