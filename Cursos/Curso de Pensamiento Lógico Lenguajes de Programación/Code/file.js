// Crearemos una funcion que espere dos numeros para sumarlos
function sumar(a, b) {
    return a + b;
}

console.log("El resultado es: " + sumar(1, 2)); // 3



let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9];
let numeroMayor = 0;
let tamano = numeros.length;


for (let i = 0; i < tamano; i++) {
    if (numeros[i] > numeroMayor) {
        numeroMayor = numeros[i];
    }
}


console.log("El numero mayor es: " + numeroMayor); // 9