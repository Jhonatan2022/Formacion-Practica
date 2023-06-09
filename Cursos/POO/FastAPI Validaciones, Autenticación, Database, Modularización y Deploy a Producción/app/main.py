# Importamos FastAPI
from fastapi import FastAPI

# Importamos htmlResponse para poder devolver código HTML
from fastapi.responses import HTMLResponse

# Importamos las variables de configuración de la base de datos
from config.database import engine, Base

# Importamos errorhandler para poder usar middlewares (intermediarios)
from middlewares.error_handler import ErrorHandler

# Importamos el router de movie para poder usarlo
from routers.movie_router import movie_router

# Importamos el router de user para poder usarlo
from routers.user_router import user_router
#------------------------------IMPORT THIS-------------------------------------




# Instanciamos FastAPI
app = FastAPI()

# Para cambiar el nombre de la aplicación
app.title = "My First API" # Se verá en la documentación de la API

# Para asignar la versión de la API
app.version = "0.0.1" # Se verá en la documentación de la API



# Agregamos el middleware (intermediario)
app.add_middleware(ErrorHandler)

# Agregamos el router de movie
app.include_router(movie_router)

# Agregamos el router de user
app.include_router(user_router)



# Creamos la base de datos y las tablas
Base.metadata.create_all(bind=engine)





# Creamos el diccionario que usarémos como base de datos
# Lista = []
# Diccionario = {}
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




# Para ejecutar el servidor de desarrollo
# uvicorn main:app --reload
# main: nombre del archivo
# app: nombre de la instancia de FastAPI    
# --reload: para que se reinicie el servidor cada vez que se haga un cambio en el código
# --port 8000: para especificar el puerto
# --host 0.0.0.0: para especificar la dirección IP (Los 4 ceros es para que sea accesible desde cualquier dirección IP)