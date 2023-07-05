// Importamos las librerias necesarias
using System.ComponentModel.DataAnnotations;


// Asignamso un nombre a la tabla que se va a crear en la base de datos
// .Models es opcional
namespace minimal.Models; // Namespace de la clase



public class Categoria {

    // Ogregmos el atributo Key para indicar que es la llave primaria (ID)
    // Guid es un tipo de dato que genera un identificador unico
    // Usamos data annotation para indicar que es la llave primaria
    [Key]
    public Guid CategoriaId { get; set; }


    // Nombre de la categoria
    // Usamos data annotation para indicar que es un campo requerido
    [Required]
    [MaxLength(150)] // Usamos MaxLength para indicar la cantidad maxima de caracteres
    public string Nombre { get; set; }

    // Descripcion de la categoria
    public string Descripcion { get; set; }


    // Relacion de la clase Categoria con la clase Tarea
    // Usamos una propiedad virtual para que Entity Framework pueda hacer el seguimiento de los cambios
    // ICollection es una interfaz que nos permite acceder a una coleccion de datos
    // Ponemos Tarea entre <> para indicar que es una coleccion de Tareas
    public virtual ICollection<Tarea> Tareas { get; set; }
}