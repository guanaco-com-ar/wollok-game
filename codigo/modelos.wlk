import wollok.game.*
import tipito.*
import personaje.*
import juego.*


    object personajes{
        method consultasPersonaje(){
            game.say(foca, foca.hablar())
        }
        
        method consultasTipito(){
            game.say(tipito, tipito.tipitoHablar()) 
        }

        method dialogos(){
        game.onCollideDo(foca, {elemento => self.consultasPersonaje()})
        game.onCollideDo(tipito, {elemento => self.consultasTipito()})
        }
    }


object niveles {
  method nivel1() {
    keyboard.z().onPressDo({self.setearLvl1()})
    
  }

  method setearLvl1() {
    game.addVisual(fondonivel1)    
  }
}
object fondonivel1{
    var property position = game.origin()
    method image() = "nivel1.png"
}