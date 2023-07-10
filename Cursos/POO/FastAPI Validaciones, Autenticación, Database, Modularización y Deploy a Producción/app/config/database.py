# Importamos el módulo os para poder acceder a las variables de entorno
import os

# Importamos create_engine para poder crear el motor de la base de datos
from sqlalchemy import create_engine

# Importamos sessionmaker para poder crear la sesión de la base de datos
from sqlalchemy.orm.session import sessionmaker

# Importamos declarative_base para poder crear los modelos de la base de datos
from sqlalchemy.ext.declarative import declarative_base




# Creamos una variable para guardar el nombre de la base de datos
sqlite_name = "../database.sqlite"


# Creamos una variable para guardar el directorio base
basedir = os.path.dirname(os.path.realpath(__file__))


# Creamos una variable para guardar la ruta de la base de datos
database_url = f"sqlite:///{os.path.join(basedir, sqlite_name)}"


# Creamos una variable para guardar el motor de la base de datos
engine = create_engine(database_url)


# Creamos una variable para guardar la sesión de la base de datos
Session = sessionmaker(bind=engine)


# Creamos una variable para guardar el modelo de la base de datos
Base = declarative_base()