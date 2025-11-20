import personaje.*
import wollok.game.*
import tipito.*
import modelos.*
import enemigos.*
import llave.*
import fuego.*

object juego {
  
  method iniciar() {
    self.configuracionInicial()
    game.title("Juego")
    game.addVisualCharacter(tipito)
    game.addVisual(foca)
    game.addVisual(azazel)
    game.addVisual(jayman)
    personajes.dialogos()
    enemigos.ejecutarDialogoEnemigo()
    personajes.conocerFoca()
    personajes.conocerAzazel()
    personajes.conocerJayman()
    enemigos.tick()
    fuego.animar()
    niveles.atraparLlave()
    enemigos.muereProtagonista()
  }
  
  method configuracionInicial() {
    game.width(15)
    game.height(11)
    game.cellSize(50)
    game.boardGround("fondoDecente.png")
  }
}