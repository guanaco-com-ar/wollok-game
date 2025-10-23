import wollok.game.*

class Personaje{
    var property position = game.at(3,7)
    var property image  = "foca.png"

    method hablar() = "¡Hola, soy un lobo marino! Apreta Z para conseguir una llave."

}

class Personaje2 inherits Personaje{
    override method hablar() = "¡Hola, soy un cangrejo! Apreta Y para conseguir una llave."
}

class Personaje3 inherits Personaje {
    override method hablar() = "¡Hola, soy un luciernaga! Apreta J para conseguir una llave."
}


const foca = new Personaje()
const azazel = new Personaje2(image = "Azaze1.png", position= game.at(3, 5))
const jayman = new Personaje3(image = "Jayman.png", position = game.at(3,3))