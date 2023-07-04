# Creamos una minimal api con el siguiente comando
dotnet new web


# Instalamos el paquete de entity framework
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.8


# Instalamos Entity Framework in memory para poder hacer pruebas sin necesidad de una base de datos
dotnet add package Microsoft.EntityFrameworkCore.InMemory --version 7.0.8


# Instalamos Entity Framework sql server para poder hacer pruebas con una base de datos sql server
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 7.0.8