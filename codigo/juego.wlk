import personaje.*
import wollok.game.*
import tipito.*
import modelos.*
import enemigos.*
import llave.*
import fuego.*

object juego {
  var property width = 0
  var property height = 0
  var property boardGround = "background.png"
  var property cellSize = 0
  var property title = "Juego"
  
  method iniciar() {
    self.configuracionInicial()
    game.title("Juego")
    game.addVisualCharacter(tipito)
    game.addVisual(fuego)
    game.addVisual(foca)
    game.addVisual(azazel)
    game.addVisual(jayman)
    personajes.dialogos()
    enemigos.ejecutarDialogoEnemigo()
    personajes.conocerFoca()
    enemigos.tick()
    fuego.animar()
    
  } 

  method configuracionInicial(){
    game.width(15)
    game.height(11)
    game.boardGround("fondoDecente.png")

  }

}


