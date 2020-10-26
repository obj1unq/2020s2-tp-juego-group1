import wollok.game.*
import pepe.*
import divisas.*



object nivel1 {
	
	method iniciar() {
		game.addVisual(pepe)
		config.configurarColisiones()
		game.onTick(3000,"crearDivisas",{generadorDeDivisas.crearDivisa()})
		game.addVisual(moni)
//		game.addVisual(new Invisible(position = game.at(1,4)))
//		game.addVisual(new Invisible(position = game.at(2,5)))
//		game.addVisual(new Invisible(position = game.at(1,6)))
//		game.addVisual(new Invisible(position = game.at(0,5)))
		game.addVisual(mariaElena)
		config.configurarTeclas()
	}
}


object config {
	
	method configurarTeclas() {
		keyboard.left().onPressDo({pepe.irASiEstaEnElMapa(pepe.position().left(1))})
		keyboard.right().onPressDo({pepe.irASiEstaEnElMapa(pepe.position().right(1))})
		keyboard.up().onPressDo({pepe.irASiEstaEnElMapa(pepe.position().up(1))})
		keyboard.down().onPressDo({pepe.irASiEstaEnElMapa(pepe.position().down(1))})
		
		keyboard.a().onPressDo({pepe.comprarAMoni(50)})
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