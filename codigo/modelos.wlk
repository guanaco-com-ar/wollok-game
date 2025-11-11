import wollok.game.*
import tipito.*
import personaje.*
import juego.*
import enemigos.*
import llave.*
import fuego.*

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
  
  method conocerAzazel() {
    game.onCollideDo(azazel, { elemento => niveles.nivel2() })
  }
  
  method conocerJayman() {
    game.onCollideDo(jayman, { elemento => niveles.nivel3() })
  }
}

object enemigos {
  method dialogoEnemigo1() {
    game.say(enemigo1, enemigo1.matarTexto())
  }
  
  method dialogoEnemigo2() {
    game.say(enemigo2, enemigo2.matarTexto())
  }
  
  method dialogoEnemigo3() {
    game.say(enemigo3, enemigo3.matarTexto())
  }
  
  method ejecutarDialogoEnemigo() {
    game.onCollideDo(enemigo1, { elemento => self.dialogoEnemigo1() })
    game.onCollideDo(enemigo2, { elemento => self.dialogoEnemigo2() })
    game.onCollideDo(enemigo3, { elemento => self.dialogoEnemigo3() })
  }
  
  method tick() {
    const tick = game.tick(500, { enemigo1.perseguir() }, false)
    const tick2 = game.tick(500, { enemigo2.perseguir() }, false)
    const tick3 = game.tick(500, { enemigo3.perseguir() }, false)
    tick.start()
    tick2.start()
    tick3.start()
  }
  
  method venceProtagonista() {
    if (pepito.vencerAlEnemigo()) niveles.hasVencido()
  }
  
  method muereProtagonista() {
    game.onCollideDo(enemigo1, { elemento => niveles.hasMuerto() })
    
    game.onCollideDo(enemigo2, { elemento => niveles.hasMuerto() })
    
    game.onCollideDo(enemigo3, { elemento => niveles.hasMuerto() })
  }
  
  method revisarTieneLLaveProtagonista() {
    game.onTick(
      500,
      "¿Tiene la llave el protagonista?",
      { self.venceProtagonista() }
    )
  }
}

object niveles {
  method nivel1() {
    keyboard.z().onPressDo({ self.setearLvl1() })
  }
  
  method nivel2() {
    keyboard.y().onPressDo({ self.setearLvl2() })
  }
  
  method nivel3() {
    keyboard.j().onPressDo({ self.setearLvl3() })
  }
  
  method limpiarLobby() {
    game.removeVisual(foca)
    game.removeVisual(azazel)
    game.removeVisual(jayman)
    game.removeVisual(tipito)
  }
  
  method setearLvl1() {
    self.limpiarLobby()
    game.addVisual(fondonivel1)
    game.addVisualCharacter(pepito)
    game.addVisual(enemigo1)
    game.addVisual(llaveInicial)
  }
  
  method setearLvl2() {
    self.limpiarLobby()
    game.addVisual(fondonivel2)
    game.addVisualCharacter(pepito)
    game.addVisual(enemigo2)
    game.addVisual(llaveInicial)
  }
  
  method setearLvl3() {
    self.limpiarLobby()
    game.addVisual(fondonivel3)
    game.addVisualCharacter(pepito)
    game.addVisual(enemigo3)
    game.addVisual(llaveInicial)
  }
  
  method hasMuerto() {
    game.addVisual(pantallaMuerte)
    game.addVisual(fuego)
    game.removeVisual(pepito)
    game.removeVisual(fondonivel1)
    game.removeVisual(fondonivel2)
    game.removeVisual(enemigo1)
    self.limpiarLobby()
  }
  
  method hasVencido() {
    game.removeVisual(fondonivel1)
    game.removeVisual(fondonivel2)
    game.removeVisual(fondonivel3)
    game.removeVisual(pepito)
    game.removeVisual(enemigo1)
    game.removeVisual(enemigo2)
    game.removeVisual(enemigo3)
    game.addVisual(azazel)
    game.addVisual(jayman)
    game.addVisualCharacter(tipito)
  }
  
  method atraparLlave() {
    game.onCollideDo(llaveInicial, { elemento => pepito.obtenerLlave() })
  }
}

object fondonivel1 {
  var property position = game.origin()
  
  method image() = "nivel1resize.png"
}

object fondonivel2 {
  var property position = game.origin()
  
  method image() = "fondolvl2resized (1).png"
}

object fondonivel3 {
  var property position = game.origin()
  
  method image() = "fondolvl3.png"
}

object pantallaMuerte {
  var property position = game.origin()
  
  method image() = "pantallaMuerte.png"
}