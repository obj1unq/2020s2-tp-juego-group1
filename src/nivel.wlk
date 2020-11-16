import wollok.game.*
import pepe.*
import divisas.*



object nivel1 {
	
	method iniciar() {
		game.addVisual(pepe)
		config.configurarColisiones()
		game.onTick(3000,"crearDivisas",{generadorDeDivisas.crearDivisa()})
		game.addVisual(moni)
		game.addVisual(new Invisible(position = game.at(1,4)))
		game.addVisual(new Invisible(position = game.at(2,5)))
		game.addVisual(new Invisible(position = game.at(1,6)))
		game.addVisual(new Invisible(position = game.at(0,5)))
		game.addVisual(mariaElena)
		config.configurarTeclas()
	}
}

object config {
	
	method configurarTeclas() {
		keyboard.left().onPressDo({pepe.irA(izquierda)})
		keyboard.right().onPressDo({pepe.irA(derecha)})
		keyboard.up().onPressDo({pepe.irA(arriba)})
		keyboard.down().onPressDo({pepe.irA(abajo)})
		
		keyboard.a().onPressDo({pepe.comprar(cafecito, moni)})
		keyboard.s().onPressDo({pepe.comprarAMoni(100)})
		keyboard.d().onPressDo({pepe.comprarAMoni(250)})
		keyboard.f().onPressDo({pepe.comprarAMoni(300)})
		
		keyboard.q().onPressDo({pepe.comprarAMariaElena(700)})
		keyboard.w().onPressDo({pepe.comprarAMariaElena(500)}) 
		
		keyboard.e().onPressDo({pepe.comprarAMariaElena(200)})
								
	}
	
	method configurarColisiones() {
		game.onCollideDo(pepe, {algo => algo.teEnvistio(pepe)})
	}
}