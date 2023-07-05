// Importamos las librerias necesarias
using Microsoft.EntityFrameworkCore;

// Importamos el espacio de nombres de la clase Categoria
using minimal.Models;
//--------------------------IMPORT THIS SNIPPET---------------------------------



// Usamos el espacio de nombres de la clase Categoria
namespace minimal;

// Heredamos de DbContext para poder usar Entity Framework Core
public class TareasContext: DbContext {

    // Usamso dbset para indicar que vamos a crear una tabla en la base de datos
    // Ponemos Categoria entre <> para indicar que es una coleccion de Categorias
    public DbSet<Categoria> Categorias { get; set; }


    // Usamso dbset para indicar que vamos a crear una tabla en la base de datos
    // Ponemos Tarea entre <> para indicar que es una coleccion de Tareas
    public DbSet<Tarea> Tareas { get; set; }



    // DbContexOptions es una clase que nos permite configurar la base de datos
    // Usamos el constructor de la clase padre para pasarle las opciones de configuracion
    public TareasContext(DbContextOptions<TareasContext> options): base(options) { }
}
