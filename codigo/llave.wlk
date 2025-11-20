import wollok.game.*
import tipito.*
import personaje.*
import juego.*
import enemigos.*

class Llaves {
  var property centrado = true
  var property image = "keys1.png"
  
  method position(){
    if(centrado){
      game.center()
    } else {
      game.at(10, 5)
    }
  }
}
const llaveInicial = new Llaves()
const llavePlata = new Llaves(image = "silverkeys.png")
const llaveBronce = new Llaves(image = "bronzekeys.png")  