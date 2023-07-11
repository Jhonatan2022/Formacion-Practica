# Importamos moviemodel para poder usarlo
from models.movie import Movie as MovieModel

# Importamos el schema Movie para poder usarlo
from schemas.movie import Movie



# Creamos una clase MovieService para poder usarla en el router
class MovieService:

    # Usamos el metodo constructor para inicializar la clase
    def __init__(self, db):

        # Asignamos la base de datos a la clase
        self.db = db


    # Creamos un metodo para obtener todas las peliculas
    def get_movies(self):

        # Obtenemos todas las películas de la base de datos
        result = self.db.query(MovieModel).all()

        # Retornamos el resultado
        return result
    

    # Creamos un metodo para obtener una pelicula por id
    def get_movie_id(self, id: int):
        
        # Obtenemos la película por el id
        result = self.db.query(MovieModel).filter(MovieModel.id == id).first()

        # Retornamos el resultado
        return result
    


    # Creamos un metodo para obtener peliculas por categoria
    def get_movies_category(self, category):

        # Obtenemos todas las películas de la base de datos
        result = self.db.query(MovieModel).filter(MovieModel.category == category).all()

        # Retornamos el resultado
        return result
    


    # Creamos un metodo para agregar una pelicula
    def add_movie(self, movie: Movie):

        # Pasamos el objeto movie a un diccionario
        new_movie = MovieModel(**movie.dict())

        # Agregamos la película a la base de datos
        self.db.add(new_movie)

        # Guardamos los cambios en la base de datos
        self.db.commit()



    # Creamos un metodo para actualizar una pelicula
    def update_movie(self, id: int, data: Movie):

        # Obtenemos la película por el id
        movie = self.db.query(MovieModel).filter(MovieModel.id == id).first()
        
        # Actualizamos la película
        movie.title = data.title
        movie.overview = data.overview
        movie.year = data.year
        movie.rating = data.rating
        movie.category = data.category

        # Guardamos los cambios en la base de datos
        self.db.commit()



    # Creamos un metodo para eliminar una pelicula
    def delete_movie(self, id: int):

        # Obtenemos la película por el id
        movie = self.db.query(MovieModel).filter(MovieModel.id == id).first()
        
        # Eliminamos la película
        self.db.delete(movie)

        # Guardamos los cambios en la base de datos
        self.db.commit()