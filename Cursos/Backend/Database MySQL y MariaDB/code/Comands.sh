# Para limpiar la consola
system cls

# Nos conectamos a mariadb
mariadb -u root -p # Nos pedira la contraseña

# Nos desconectamos de mariadb
exit; # CTRL + C

# Cargando un archivo sql
mysql < archivo.sql # Linux
# Otra forma de cargar un archivo sql
mysql -u root -p -e "source data-set.sql"

# Mostramos las bases de datos
show databases; 

# Eliminar una base de datos
drop database nombre_base_datos;
