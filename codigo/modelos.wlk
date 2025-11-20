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
  }
  
  }


object niveles {

  var property enemigo = enemigo1
  var property fondos = fondonivel1
  var property llaves = llaveInicial
  var property sonido = game.sound("John Carpenter - Halloween 1978 (main Theme).mp3")

  method nivel1() {
    keyboard.z().onPressDo({ self.setearLvl1() self.unirseANivel()})
  }
  
  method nivel2() {
    keyboard.y().onPressDo({ self.setearLvl2() self.unirseANivel() })
  }
  
  method nivel3() {
    keyboard.j().onPressDo({ self.setearLvl3() self.unirseANivel() })
  }

  method unirseANivel(){
    game.addVisual(fondos)
    game.addVisual(pepito)
    game.addVisual(enemigo)
    game.addVisual(llaves)

    foca.position(game.at(1, 1))
    azazel.position(game.at(1, 1))
    jayman.position(game.at(1, 1))
    tipito.position(game.at(1, 1))
  }

  
  method setearLvl1() {
    fondos = fondonivel1
    enemigo = enemigo1
    llaves = llaveInicial
  }
  
  method setearLvl2() {
    fondos = fondonivel2
    enemigo = enemigo2
    llaves = llavePlata


  }
  
  method setearLvl3() {

    fondos = fondonivel3
    enemigo = enemigo3
    llaves = llaveBronce  
    

  }
  
  method hasMuerto() {
    game.addVisual(pantallaMuerte)
    game.addVisual(fuego)
    game.removeVisual(enemigo)
    game.removeVisual(fondos) 
  }
  
  method hasVencido() {
    game.removeVisual(pepito)
    game.removeVisual(enemigo)
    game.removeVisual(fondos) 
    game.removeVisual(llaves)

    foca.position(game.at(3, 7))
    azazel.position(game.at(3, 5))
    jayman.position(game.at(3, 3))
    tipito.position(game.at(14, 4))
  }
  
  method atraparLlave() {
    game.onCollideDo(llaveInicial, { elemento => self.hasVencido() })
    console.println("jejeje")
    game.say(pepito, pepito.tipitoTriunfante())
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