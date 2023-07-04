// Namespace nos sirve para organizar nuestras clases
namespace minimal.Models;

// Asignamso un nombre a la tabla que se va a crear en la base de datos
public class Tarea{

    // Ogregmos el atributo Key para indicar que es la llave primaria (ID)
    public Guid TareaId { get; set; }

    // Traemos la llave foranea de la clase Categoria
    public Guid CategoriaId { get; set; }

    // Titulo de la tarea
    public string Titulo { get; set; }

    // Descripcion de la tarea
    public string Descripcion { get; set; }

    // Prioridad de la tarea
    public Prioridad PrioridadTarea { get; set; }

    // Fecha de creacion de la tarea
    public DateTime FechaCreacion { get; set; }


    // Relacion de la clase Tarea con la clase Categoria
    // Usamos una propiedad virtual para que Entity Framework pueda hacer el seguimiento de los cambios
    public virtual Categoria Categoria { get; set; }    
}


// Creamos una enumeracion para la prioridad de la tarea
public enum Prioridad {
    Baja,
    Media,
    Alta
}