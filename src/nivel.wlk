import wollok.game.*
import pepe.*
import divisas.*
import comidas.*
import extras.*
import items.*

const arma1 = new Arma(nombre = "arma1", valor = 10, potencia = 1, cantidadDeBalas= 5)
const arma2 = new Arma(nombre = "arma2", valor = 20, potencia = 2, cantidadDeBalas= 7)
const arma3 = new Arma(nombre = "arma3", valor = 30, potencia = 3, cantidadDeBalas= 10)
const cafecito = new Comida(nombre = "cafecito", valor = 10, potencia = 1)
const pizza = new Comida(nombre = "pizza", valor = 15, potencia = 2)
const milanesa = new Comida(nombre = "milanesa", valor = 20, potencia = 3)
const sanguchito = new Comida(nombre = "sanguchito", valor = 20, potencia = 3)
const obelisco = new Obstaculo(image= "obelisco.png", position= game.at(9, 12))
const columna1 = new Columna(image= "objeto_transparente.png", position= game.at(0,3))
const columna2 = new Columna(image= "objeto_transparente.png", position= game.at(1,3))
const columna3 = new Columna(image= "objeto_transparente.png", position= game.at(2,3))
		
object nivel1 {
	
	method iniciar() {
		columna1.crearColumna(0,3, 6, "objeto_transparente.png")
		columna1.dibujarColumna()
		columna2.crearColumna(1,3, 6, "objeto_transparente.png")
		columna2.dibujarColumna()
		columna3.crearColumna(2,3, 6, "objeto_transparente.png")
		columna3.dibujarColumna()
		moni.position(game.at(0,1)) 
		moni.comidaDisponible([cafecito, pizza, milanesa, sanguchito])

		mariaElena.position(game.at(15,1))
		mariaElena.armasDisponibles([arma1, arma2, arma3])
		
		game.addVisual(pepe)
		config.configurarColisiones()
		game.onTick(3000,"crearDivisas",{generadorDeDivisas.crearDivisa()})
		game.addVisual(moni)
		game.addVisual(mariaElena)
		game.addVisual(proyectilMalo)
		game.addVisual(obelisco)
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