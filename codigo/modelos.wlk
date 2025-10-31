import wollok.game.*
import tipito.*
import personaje.*
import juego.*


    object personajes{
        method consultasFoca(){
            game.say(foca, foca.hablar())
        }

        method consultasAzazel(){
          game.say(azazel, azazel.hablar())
        }

        method consultasJayman(){
          game.say(jayman, jayman.hablar())
        }
        
        method consultasTipito(){
            game.say(tipito, tipito.tipitoHablar()) 
        }

        method dialogos(){
        game.onCollideDo(foca, {elemento => self.consultasFoca()})
        game.onCollideDo(tipito, {elemento => self.consultasTipito()})
        game.onCollideDo(azazel, {elemento => self.consultasAzazel()})
        game.onCollideDo(jayman, {elemento => self.consultasJayman()})
        }

        method conocerFoca(){
          game.onCollideDo(foca, {elemento => niveles.nivel1()}   )
        } 
    }


object niveles {
  method nivel1() {
    keyboard.z().onPressDo({self.setearLvl1()})
    
  }

  method limpiarLobby(){
    game.removeVisual(foca)
    game.removeVisual(azazel)
    game.removeVisual(jayman)
    game.removeVisual(tipito)  
  }

  method volverLobby1(){
    juego.iniciar()
    game.removeVisual(foca)
    game.removeVisual(fondonivel1)
    game.removeVisual(pepito)
  }

  method setearLvl1() {
    self.limpiarLobby()
    game.addVisual(fondonivel1)
    game.addVisualCharacter(pepito)
  }
}
object fondonivel1{
    var property position = game.origin()
    method image() = "nivel1resize.png"
}