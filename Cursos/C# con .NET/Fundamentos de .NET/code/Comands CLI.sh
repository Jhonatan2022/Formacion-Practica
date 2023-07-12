# Comando para mostrar la ayuda de .NET
dotnet --help

# Comando para revisar la versión de .NET instalada
dotnet --version

# Comando para ver los templates mas comunes de .NET
dotnet new 

# Comando para ver todos los templates de .NET
dotnet new --list

# Comando para crear un proyecto de consola
dotnet new console -o NombreProyecto

# Comando para correr un proyecto de consola
dotnet run

# Comando para compilar un proyecto de consola y verificando que no tenga errores o problemas con dependencias
dotnet build

# Comando para limpiar un proyecto de consola
dotnet clean

# Comando para que la app este escuchando los cambios y se actualice automaticamente
dotnet build --configuration Release

# cuando usamos debug no se actualiza automaticamente y se debe volver a compilar
dotnet build --configuration Debug

# Comando para crear el archivo de configuración de la app
dotnet new globaljson

# Comando para ver las versiones de .NET instaladas
dotnet --info