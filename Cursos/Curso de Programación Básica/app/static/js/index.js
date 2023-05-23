// Botones funcion iniciar juego
const sectionSeleccionarAtaque = document.getElementById('seleccionar-ataque')
const sectionReiniciar = document.getElementById('reiniciar')
const botonMascotaJugador = document.getElementById('boton-mascota')


sectionReiniciar.style.display = 'none'
const botonReiniciar = document.getElementById('boton-reiniciar')

// Seleccionar mascota jugador
const sectionSeleccionarMascota = document.getElementById('seleccionar-mascota')
const spanMascotaJugador = document.getElementById('mascota-jugador')

// Seleccionar mascota enemigo
const spanMascotaEnemigo = document.getElementById('mascota-enemigo')

// Commbate y vidas
const spanVidasJugador = document.getElementById('vidas-jugador')
const spanVidasEnemigo = document.getElementById('vidas-enemigo')

// Mensajes - Mensaje final
const sectionMensajes = document.getElementById('resultado')
const ataquesDelJugador = document.getElementById('ataques-del-jugador')
const ataquesDelEnemigo = document.getElementById('ataques-del-enemigo')
const contenedorTarjetas = document.getElementById('contenedorTarjetas')
const contenedorAtaques = document.getElementById('contenedorAtaques')

// Canvas
const sectionVerMapa = document.getElementById('ver-mapa')
const mapa = document.getElementById('mapa')

// Variables
let mokepones = []
let ataqueJugador = []
let ataqueEnemigo = []
let opcionDeMokepones
let inputHipodoge
let inputCapipepo
let inputRatigueya
let mascotaJugador
let mascotaDeJugadorObjeto
let ataquesMokepon
let ataquesMokeponEnemigo
let botonFuego
let botonAgua
let botonTierra
let botones = []
let indexAtaqueJugador
let indexAtaqueEnemigo
let victoriasJugador = 0
let victoriasEnemigo = 0
let vidasJugador = 3
let vidasEnemigo = 3
let lienzo = mapa.getContext('2d') // Trabajamos en dos dimensiones
let intervalo
let mapaBackground = new Image() // Creamos una nueva imagen
mapaBackground.src = '../assets/mokemap.png' // Le asignamos la ruta de la imagen



// Clase Mokepon para crear los mokepones
class Mokepon {
    constructor(nombre, foto, vida, fotoMapa, x = 10, y = 10){
        this.nombre = nombre
        this.foto = foto
        this.vida = vida
        this.ataques = []
        this.x = 20 // Posicion en x
        this.y = 30 // Posicion en y
        this.ancho = 80 // Ancho de la imagen
        this.alto = 80 // Alto de la imagen
        this.mapaFoto = new Image() // Creamos una nueva imagen
        this.mapaFoto.src = fotoMapa // Le asignamos la ruta de la imagen
        this.velocidadX = 0 // Velocidad en x
        this.velocidadY = 0 // Velocidad en y
    }

    pintarMokepon() {
        lienzo.drawImage(
            this.mapaFoto, // Imagen
            this.x, // Posicion en x
            this.y, // Posicion en y
            this.ancho, // Ancho de la imagen
            this.alto // Alto de la imagen
        )
    //lienzo.fillRect(5, 15, 20, 40) // (x, y, ancho, alto)  
    }
}



// Mokepones
let capipepo = new Mokepon('Capipepo', '../assets/capipepo_attack.png', 5, '../assets/capipepo.png')
let hipodoge = new Mokepon('Hipodoge', '../assets/hipodoge_attack.png', 5, '../assets/hipodoge.png')
let ratigueya = new Mokepon('Ratigueya', '../assets/ratigueya_attack.png', 5, '../assets/ratigueya.png')

// Mokepones Enemigos
let capipepoEnemigo = new Mokepon('Capipepo', '../assets/capipepo_attack.png', 5, '../assets/capipepo.png', 80, 120)
let hipodogeEnemigo = new Mokepon('Hipodoge', '../assets/hipodoge_attack.png', 5, '../assets/hipodoge.png', 150, 95)
let ratigueyaEnemigo = new Mokepon('Ratigueya', '../assets/ratigueya_attack.png', 5, '../assets/ratigueya.png', 200, 200)



// Usamos el metodo push para agregar los mokepones al array
//mokepones.push(hipodoge, capipepo, ratigueya)
hipodoge.ataques.push(
    { nombre: '💧', id: 'boton-agua'},
    { nombre: '💧', id: 'boton-agua'},
    { nombre: '💧', id: 'boton-agua'},
    { nombre: '🔥', id: 'boton-fuego'},
    { nombre: '🌱', id: 'boton-tierra'}
)

capipepo.ataques.push(
    { nombre: '🌱', id: 'boton-tierra'},
    { nombre: '🌱', id: 'boton-tierra'},
    { nombre: '🌱', id: 'boton-tierra'},
    { nombre: '💧', id: 'boton-agua'},
    { nombre: '🔥', id: 'boton-fuego'}
)

ratigueya.ataques.push(
    { nombre: '🔥', id: 'boton-fuego'},
    { nombre: '🔥', id: 'boton-fuego'},
    { nombre: '🔥', id: 'boton-fuego'}, 
    { nombre: '💧', id: 'boton-agua'},
    { nombre: '🌱', id: 'boton-tierra'}
)
mokepones.push(hipodoge, capipepo, ratigueya)



// Funcion para iniciar el juego
function iniciarJuego() {
    sectionSeleccionarAtaque.style.display = 'none'
    sectionVerMapa.style.display = 'none'

    // Recorremos el array de mokepones y creamos los botones
    mokepones.forEach((mokepon) => {
        opcionDeMokepones = `
        <input type="radio" name="mascota" id="${mokepon.nombre}" />
        <label class="tarjeta-de-mokepon" for="${mokepon.nombre}">
            <p>${mokepon.nombre}</p>
            <img src="${mokepon.foto}" alt="${mokepon.nombre}">
        </label>
        `
    contenedorTarjetas.innerHTML += opcionDeMokepones

    inputHipodoge = document.getElementById('Hipodoge')
    inputCapipepo = document.getElementById('Capipepo')
    inputRatigueya = document.getElementById('Ratigueya')
    })

    botonMascotaJugador.addEventListener('click',  seleccionarMascotaJugador)
    
    botonReiniciar.addEventListener('click', reiniciarJuego)
}



function seleccionarMascotaJugador() {
    sectionSeleccionarMascota.style.display = 'none'
    //sectionSeleccionarAtaque.style.display = 'flex'


    if (inputHipodoge.checked) {
        spanMascotaJugador.innerHTML = inputHipodoge.id
        mascotaJugador = inputHipodoge.id
    } else if (inputCapipepo.checked) {
        spanMascotaJugador.innerHTML = inputCapipepo.id
        mascotaJugador = inputCapipepo.id
    } else if (inputRatigueya.checked) {
        spanMascotaJugador.innerHTML = inputRatigueya.id
        mascotaJugador = inputRatigueya.id
    } else {
        alert('Selecciona una mascota')
    }

    extraerAtaques(mascotaJugador)
    sectionVerMapa.style.display = 'flex'
    iniciarMapa()
    seleccionarMascotaEnemigo()
}



function extraerAtaques (mascotaJugador){
    let ataques

    for (let i = 0; i < mokepones.length; i++) {

        if (mascotaJugador === mokepones[i].nombre) {
            ataques = mokepones[i].ataques
        }   
    }

    mostrarAtaques(ataques)
}



function mostrarAtaques(ataques) {

    ataques.forEach ((ataque) => {
        ataquesMokepon = `
        <button id="${ataque.id}" class="boton-de-ataque BAtaque">${ataque.nombre}</button>
        `

        contenedorAtaques.innerHTML += ataquesMokepon
    })

    botonFuego = document.getElementById('boton-fuego')
    botonAgua = document.getElementById('boton-agua')
    botonTierra = document.getElementById('boton-tierra')

    // querySelectorAll para seleccionar todos los botones de ataque
    botones = document.querySelectorAll('.BAtaque')
}



function secuenciaAtaque() {
    botones.forEach((boton) => {
        boton.addEventListener('click', (e) => {
            if (e.target.textContent === '🔥'){
                ataqueJugador.push('FUEGO')
                console.log(ataqueJugador)
                boton.style.background = '#112f58' 
                boton.disabled = true  
            } else if (e.target.textContent === '💧'){
                ataqueJugador.push('AGUA')
                console.log(ataqueJugador)
                boton.style.background = '#112f58'
                boton.disabled = true
            } else{
                ataqueJugador.push('TIERRA')
                console.log(ataqueJugador)
                boton.style.background = '#112f58'
                boton.disabled = true
            }
            ataqueAleatorioEnemigo()
        })
    })
}



function seleccionarMascotaEnemigo() {
    // Usammos length para que el numero aleatorio sea el mismo que la cantidad de mokepones y le restamos 1 para que no se pase del array
    let mascotaAleatoria = aleatorio(0, mokepones.length -1)

    // Conectamos el span con el nombre del mokepon aleatorio
    spanMascotaEnemigo.innerHTML = mokepones[mascotaAleatoria].nombre

    ataquesMokeponEnemigo = mokepones[mascotaAleatoria].ataques

    secuenciaAtaque()
}



function ataqueAleatorioEnemigo() {
    let ataqueAleatorio = aleatorio(0, ataquesMokeponEnemigo.length -1)
    
    if (ataqueAleatorio == 0 || ataqueAleatorio == 1) {
        ataqueEnemigo.push('FUEGO')
    } else if (ataqueAleatorio == 3 || ataqueAleatorio == 4) {
        ataqueEnemigo.push('AGUA')
    } else {
        ataqueEnemigo.push('TIERRA')
    }
    console.log(ataqueEnemigo)
    iniciarPelea()
}



function iniciarPelea() {
    if (ataqueJugador.length === 5) {
        combate()
    }
}



function indexAmbosOponente(jugador, enemigo){
    indexAtaqueJugador = ataqueJugador[jugador]
    indexAtaqueEnemigo = ataqueEnemigo[enemigo]
}



function combate() {

    for (let index = 0; index < ataqueJugador.length; index++) {
        if(ataqueJugador[index] === ataqueEnemigo[index]) {
            indexAmbosOponente(index, index)
            crearMensaje("EMPATE")

        }else if (ataqueJugador[index] === 'FUEGO' && ataqueEnemigo[index] === 'TIERRA') {
            indexAmbosOponente(index, index)
            crearMensaje("GANA JUGADOR")
            victoriasJugador++
            spanVidasJugador.innerHTML = victoriasJugador

        }else if (ataqueJugador[index] === 'AGUA' && ataqueEnemigo[index] === 'FUEGO') {
                indexAmbosOponente(index, index)
                crearMensaje("GANA ENEMIGO")
                victoriasJugador++
                spanVidasJugador.innerHTML = victoriasJugador

        } else if (ataqueJugador[index] === 'TIERRA' && ataqueEnemigo[index] === 'AGUA') {
                indexAmbosOponente(index, index)
                crearMensaje("GANA JUGADOR")
                victoriasJugador++
                spanVidasJugador.innerHTML = victoriasJugador

        } else {
            indexAmbosOponente(index, index)
            crearMensaje("GANA ENEMIGO")
            victoriasEnemigo++
            spanVidasEnemigo.innerHTML = victoriasEnemigo
        }   
    }

    // Revisar las vidas jugador enemigo
    revisarVidas()
}




function revisarVidas() {

    if (victoriasJugador === victoriasEnemigo) {
        crearMensajeFinal("EMPATE, NADIE GANA")

    } else if (victoriasJugador > victoriasEnemigo) {
        crearMensajeFinal('GANASTE')

    }else {
        crearMensajeFinal('PERDISTE')
    }       
}



function crearMensaje(resultado) {
    let nuevoAtaqueDelJugador = document.createElement('p')
    let nuevoAtaqueDelEnemigo = document.createElement('p')

    sectionMensajes.innerHTML = resultado
    nuevoAtaqueDelJugador.innerHTML = indexAtaqueJugador
    nuevoAtaqueDelEnemigo.innerHTML = indexAtaqueEnemigo

    ataquesDelJugador.appendChild(nuevoAtaqueDelJugador)
    ataquesDelEnemigo.appendChild(nuevoAtaqueDelEnemigo)
}



function crearMensajeFinal(resultadoFinal) {    
    sectionMensajes.innerHTML = resultadoFinal

    sectionReiniciar.style.display = 'block'
}



function reiniciarJuego() {
    location.reload()
}



function aleatorio(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min)
}



function pintarCanvas(){
    mascotaDeJugadorObjeto.x += mascotaDeJugadorObjeto.velocidadX
    mascotaDeJugadorObjeto.y += mascotaDeJugadorObjeto.velocidadY
    lienzo.clearRect(0, 0, mapa.width, mapa.height) // Limpiamos el mapa
    lienzo.drawImage(
        mapaBackground, // Imagen
        0, // Posicion en x
        0, // Posicion en y
        mapa.width, // Ancho de la imagen
        mapa.height // Alto de la imagen
    )
    mascotaDeJugadorObjeto.pintarMokepon()
}



function moverDerecha(){
    mascotaDeJugadorObjeto.velocidadX = 5
}



function moverIzquierda(){
    mascotaDeJugadorObjeto.velocidadX = -5
}



function moverArriba(){
    mascotaDeJugadorObjeto.velocidadY = -5
}



function moverAbajo(){
    mascotaDeJugadorObjeto.velocidadY = 5
}



function detenerMovimiento(){
    mascotaDeJugadorObjeto.velocidadX = 0
    mascotaDeJugadorObjeto.velocidadY = 0
}



function teclaPresionada(event){
    switch(event.key){
        case 'ArrowUp':
            moverArriba()
            break
        case 'ArrowDown':
            moverAbajo()
            break
        case 'ArrowLeft':
            moverIzquierda()
            break
        case 'ArrowRight':
            moverDerecha()
            break
        default:
            break
    }
}



function iniciarMapa(){

    mapa.width = 600
    mapa.height = 500
    mascotaDeJugadorObjeto = obtenerObjetoMascota(mascotaJugador)

    // Usamos el metodo addEventListener para escuchar el evento keydown
    window.addEventListener('keydown', teclaPresionada)
    window.addEventListener('keyup', detenerMovimiento)

    intervalo = setInterval(pintarCanvas, 1000/60) // 60 fps
}



function obtenerObjetoMascota(){
    for (let i = 0; i < mokepones.length; i++) {

        if (mascotaJugador === mokepones[i].nombre) {
            return mokepones[i]
        }   
    }
}



// Iniciar juego al cargar la pagina web
window.addEventListener('load', iniciarJuego)