import wollok.game.*
import tipito.*
import personaje.*
import juego.*
import enemigos.*
import llave.*

object personajes {
  method consultasFoca() {
    game.say(foca, foca.hablar())
  }
  
  method consultasAzazel() {
    game.say(azazel, azazel.hablar())
  }
  
  method consultasJayman() {
    game.say(jayman, jayman.hablar())
  }
  
  method consultasTipito() {
    game.say(tipito, tipito.tipitoHablar())
  }
  
  method dialogos() {
    game.onCollideDo(foca, { elemento => self.consultasFoca() })
    game.onCollideDo(tipito, { elemento => self.consultasTipito() })
    game.onCollideDo(azazel, { elemento => self.consultasAzazel() })
    game.onCollideDo(jayman, { elemento => self.consultasJayman() })
  }
  
  method conocerFoca() {
    game.onCollideDo(foca, { elemento => niveles.nivel1() })
  }
}

object enemigos {
  method dialogoEnemigos() {
    game.say(enemigo1, enemigo1.matarTexto())
    
    const elEnemigoHablo = true
    return elEnemigoHablo
  }
  
  method ejecutarDialogoEnemigo() {
    game.onCollideDo(enemigo1, { elemento => self.dialogoEnemigos() })
  }
  
  method tick() {
    const tick = game.tick(500, { enemigo1.perseguir() }, false)
    tick.start()
  }
  
  method matar() {
    if (self.dialogoEnemigos()) {
      
    }
  }
}

object niveles {
  method nivel1() {
    keyboard.z().onPressDo({ self.setearLvl1() })
  }
  
  method limpiarLobby() {
    game.removeVisual(foca)
    game.removeVisual(azazel)
    game.removeVisual(jayman)
    game.removeVisual(tipito)
  }
  
  method volverLobby1() {
    juego.iniciar()
    game.removeVisual(foca)
    game.removeVisual(fondonivel1)
    game.removeVisual(pepito)
  }
  
  method setearLvl1() {
    self.limpiarLobby()
    game.addVisual(fondonivel1)
    game.addVisualCharacter(pepito)
    game.addVisual(enemigo1)
    game.addVisual(llaveInicial)
  }
}

object fondonivel1 {
  var property position = game.origin()
  
  method image() = "nivel1resize.png"
}