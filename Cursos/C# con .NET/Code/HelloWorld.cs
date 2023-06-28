// See https://aka.ms/new-console-template for more information
// Console.WriteLine("Hello, World!");


// Calculando area de un rectangul
double ladoA; // Explicito
// var ladoA; // Implicito
double ladoB;
double result;

Console.WriteLine("ingrese el lado A");
ladoA = Convert.ToDouble(Console.ReadLine());

Console.WriteLine("ingrese el lado B");
ladoB = Convert.ToDouble(Console.ReadLine());

result = (ladoA * ladoB)/2;
// residuo
// result = (ladoA * ladoB)%2;

Console.WriteLine("el area del rectangulo es: " + result);
//--------------------------------------------------------------------------------------------




// Calculando area de un circulo
var radio = 0d;
var resultado = 0d; // las variables deben empezar con minuscula (CamelCase)

const double Pi = 3.1416; // Las contantes deben empezar con mayuscula (CamelCase)


Console.WriteLine("ingrese el radio del circulo");
radio = Convert.ToDouble(Console.ReadLine());

resultado = Pi * radio * radio;

Console.WriteLine("el area del circulo es: " + resultado);
//--------------------------------------------------------------------------------------------




// Operadores aritmeticos
var a = 10;
var b = 3;

a++; // a = a + 1;
a--; // a = a - 1;
a += 3; // a = a + 3;
a -= 3; // a = a - 3;
a *= 3; // a = a * 3;
a /= 3; // a = a / 3;
a %= 3; // a = a % 3;
//--------------------------------------------------------------------------------------------




// && = and si las dos condiciones son verdaderas
// || = or si una de las dos condiciones es verdadera
// ! = not niega la condicion
// ^ = xor si una de las dos condiciones es verdadera pero no las dos, (Si los valores son diferentes)
// Operadores logicos
var c = 10;
var d = 3;

Console.WriteLine(c > d && c < d); // false
Console.WriteLine(c > d || c < d); // true
Console.WriteLine(!(c > d)); // false
Console.WriteLine(c > d ^ c < d); // true
//--------------------------------------------------------------------------------------------




// Operadores relacionales
var (a, b, c) = (10, 3, 5);


Console.WriteLine(c > d); // true
Console.WriteLine(c < d); // false
Console.WriteLine(c >= d); // true
Console.WriteLine(c <= d); // false
Console.WriteLine(c == d); // false
Console.WriteLine(c != d); // true 
//--------------------------------------------------------------------------------------------




// Strings (Cadenas de texto)
int altura = 168;
int edad = 20;
string nombre = "Juan ricardo";
string information = "Nacio en 2001, tiene 20 años y mide 168 cm";
var hobby = "Deportista";


// Concatenando los valores
string tarjetaDeIdentidad = $"El usuario {nombre} \n Nacio en {information}, tiene {edad} años y mide {altura} cm";

Console.WriteLine(tarjetaDeIdentidad);
//--------------------------------------------------------------------------------------------




// Condicional IF
// Blackjack, juntar 21 pidiendo cartas o en caso de tener menos de 21, tener mas puntos que el dealer


// Jugador
int totalJugador = 0;
Console.WriteLine("Ingrese el valor del jugador");
totalJugador = Convert.ToInt32(Console.ReadLine());

// Dealer
int totalDealer = 0;
Console.WriteLine("Ingrese el valor del dealer");
totalDealer = Convert.ToInt32(Console.ReadLine());

// Mensaje
string message = "";


if (totalJugador > totalDealer && totalJugador <= 21){
    message = "Ganaste";
} else if (totalJugador < totalDealer && totalDealer <= 21){
    message = "Perdiste";
} else if (totalJugador == totalDealer && totalDealer <= 21){
    message = "Empate";
} else {
    message = "No es un valor valido";
}


Console.WriteLine(message);