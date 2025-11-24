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
  

  
  method muereProtagonista() {
    game.onCollideDo(enemigo1, { elemento => niveles.hasMuerto() })
    
    game.onCollideDo(enemigo2, { elemento => niveles.hasMuerto() })
    
    game.onCollideDo(enemigo3, { elemento => niveles.hasMuerto() })

    return pepito.estaVivo(false)
  }
  
  }


object niveles {
  var property sonido = game.sound("John Carpenter - Halloween 1978 (main Theme).mp3")

  method nivel1() {
    keyboard.z().onPressDo({ self.setearLvl1()})
  }
  
  method nivel2() {
    keyboard.y().onPressDo({ self.setearLvl1() })
  }
  
  method nivel3() {
    keyboard.j().onPressDo({ self.setearLvl1() })
  }

    method setearLvl1() {
    game.addVisual(fondonivel1)
    game.addVisual(enemigo1)
    game.addVisual(llaveInicial)
    game.addVisual(pepito)

    foca.position(game.at(1, 1))
    azazel.position(game.at(1, 1))
    jayman.position(game.at(1, 1))
    tipito.position(game.at(1, 1))

  }
  
  method setearLvl2() {
    game.removeVisual(fondonivel1)
    game.removeVisual(enemigo1)
    game.removeVisual(llaveInicial)
    game.removeVisual(pepito)

    game.addVisual(fondonivel2)
    game.addVisual(enemigo2)
    game.addVisual(sandia)
    sandia.position(game.at(14, 4))
    game.addVisual(llavePlata)


  }
  
  method setearLvl3() {

    game.removeVisual(fondonivel2)
    game.removeVisual(enemigo2)
    game.removeVisual(llavePlata)
    game.removeVisual(sandia)


    game.addVisual(fondonivel3)
    game.addVisual(enemigo3)
    game.addVisual(gatito)
    gatito.position(game.at(14, 4))
    game.addVisual(llaveBronce)
    

  }

  method hasMuerto() {
    game.addVisual(pantallaMuerte)
    game.addVisual(fuego)
    
  
  }

  method hasGanado(){
    game.addVisual(pantallaVictoria)
  }
  

  method atraparLlave() {
    if (pepito.estaVivo()){
    game.onCollideDo(llaveInicial, { elemento => self.setearLvl2() })
    game.say(pepito, pepito.tipitoTriunfante())
  }

  if (sandia.estaVivo()){
    game.onCollideDo(llavePlata, { elemento => self.setearLvl3() })
    game.say(sandia, sandia.tipitoTriunfante())
  }

  if (gatito.estaVivo()){
    game.onCollideDo(llaveBronce, {elemento => self.hasGanado()})
    game.say(gatito, gatito.tipitoMuyTriunfante())
  }
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

object pantallaVictoria {
  var property position = game.origin()

  method image() = "imagenFinal (1).png"
}