// Importamos el paquete de Entity Framework para poder usar la base de datos en memoria (InMemoryDatabase)
using Microsoft.EntityFrameworkCore;

// Importamos la base de datos
using minimal;

// Importamos el paquete de Microsoft.AspNetCore.Mvc para poder usar el Results
using Microsoft.AspNetCore.Mvc;
//--------------------------------------------------------------



var builder = WebApplication.CreateBuilder(args);

// Registramos el contexto de la base de datos
// Tiene que estar antes de la vatiable app para que funcione correctamente la base de datos en memoria
builder.Services.AddDbContext<TareasContext>(p => p.UseInMemoryDatabase("TareasDB"));

var app = builder.Build();


app.MapGet("/", () => "Hello World!");

// Hacemos un mapeo para comprobar que funciona correctamente la base de datos
app.MapGet("/dbconexion", async ([FromServices] TareasContext dbContext) => {
    dbContext.Database.EnsureCreated(); // Creamos la base de datos si no existe
    return Results.Ok("Conexión establecida: " + dbContext.Database.IsInMemory());
});


app.Run();
