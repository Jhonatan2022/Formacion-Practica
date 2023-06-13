# Comando para conectarnos al servicio (Container) que esta corriendo ne docker
docker-compose exec mongodb bash # Nos conectamos al servicio de mongo por medio de bash


# Comando para conectarnos con mongosh
mongosh "mongodb://root:root123@localhost:27017/?authMechanism=DEFAULT&tls=false"


# Comando para ver las bases de datos
show dbs


# Comando para ver las colecciones (tablas)
show collections