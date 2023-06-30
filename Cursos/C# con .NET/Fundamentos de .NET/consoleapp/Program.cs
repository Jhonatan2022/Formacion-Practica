// Usamos la libreria humanizer para convertir el texto a mayusculas
using Humanizer;


Console.WriteLine("Igerese su nombre");
var nombre = Console.ReadLine();


Console.WriteLine("Cuál es su cargo");
var cargo = Console.ReadLine();


Console.WriteLine("Cuál es su salario");
var salario = int.Parse(Console.ReadLine());


Console.WriteLine($"Nombre: {nombre} \n Cargo: {cargo} \n Salario: {salario.ToWords(new System.Globalization.CultureInfo("es-ES"))}");