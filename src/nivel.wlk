import wollok.game.*
import pepe.*
import divisas.*
import comidas.*
import extras.*

const arma1 = new Arma(nombre = "arma1", valor = 10, potencia = 1)
const arma2 = new Arma(nombre = "arma2", valor = 20, potencia = 2)
const arma3 = new Arma(nombre = "arma3", valor = 30, potencia = 3)
const cafecito = new Comida(nombre = "cafecito", valor = 10, potencia = 1)
const pizza = new Comida(nombre = "pizza", valor = 15, potencia = 2)
const milanesa = new Comida(nombre = "milanesa", valor = 20, potencia = 3)
const sanguchito = new Comida(nombre = "sanguchito", valor = 20, potencia = 3)
const moni = new Moni(nombre = "Moni", position= game.at(1,5),comidaDisponible=[cafecito, pizza, milanesa, sanguchito])
const mariaElena = new MariaElena(nombre = "Maria Elena",position= game.at(8,8), armasDisponibles=[arma1, arma2, arma3])
		
object nivel1 {
	
	method iniciar() {
		
		game.addVisual(pepe)
		config.configurarColisiones()
		game.onTick(3000,"crearDivisas",{generadorDeDivisas.crearDivisa()})
		//game.addVisual(new Invisible(variantex= 1, variantey=0, invisibleDe = moni))
		game.addVisual(moni)
		//game.addVisual(new Invisible(variantex= -1, variantey=0, invisibleDe = mariaElena))
		game.addVisual(mariaElena)
		game.addVisual(proyectilMalo)
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
		keyboard.s().onPressDo({pepe.comprar(milanesa, moni)})
		keyboard.d().onPressDo({pepe.comprar(pizza, moni)})
		keyboard.f().onPressDo({pepe.comprar(sanguchito, moni)})
		
		keyboard.q().onPressDo({pepe.comprar(arma1, mariaElena)})
		keyboard.w().onPressDo({pepe.comprar(arma2, mariaElena)}) 
		keyboard.e().onPressDo({pepe.comprar(arma3, mariaElena)})
								
	}
	
	method configurarColisiones() {
		game.onCollideDo(pepe, {algo => algo.teEnvistio(pepe)})
	}
}