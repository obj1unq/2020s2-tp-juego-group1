import wollok.game.*
import personajes.*
import nivel.*
import extras.*
import items.*

class Dinero {
	method esAtravesable(){
		return true
	}
	method image()
	method teEnvistio(argento) {
		argento.agarrarDinero(self)
	} 
}
class Moneda inherits Dinero{
	const property valor = 5
	var property position = game.at(3,4)
	override method image() {
		return "Spinning-Coin.gif"
	}
}

class Billete inherits Dinero{
	const property valor = 10
	var property position = game.at(1,5)
	
	override method image() {
		return "billetes.png"
	}	
}

class Falso inherits Dinero{
	const property valor = -5
	var property position = game.at(6,2)
	
	override method image() {
		return "billetes.png"
	}	
}

object monedaFactory {
	
	method imprimirDivisa() {
		return new Moneda(position = randomizer.emptyPosition())	
	}
}

object billeteFactory {

	method imprimirDivisa() {
		return new Billete(position = randomizer.emptyPosition())	
	}		
}

object falsoFactory {
	
	method imprimirDivisa() {
		return new Falso(position = randomizer.emptyPosition())	
	}	
}

object generadorDeDivisas {
	const divisasGeneradas = #{}
	const maximoNroDivisas = 5
	const factoriesDeDivisas = [monedaFactory, billeteFactory, falsoFactory]
	
	method crearDivisa() {
		if (divisasGeneradas.size() < maximoNroDivisas) {
			const divisaSorteada = factoriesDeDivisas.get((0..factoriesDeDivisas.size() -1).anyOne())
			const divisaGanadora = divisaSorteada.imprimirDivisa()
			game.addVisual(divisaGanadora)
			divisasGeneradas.add(divisaGanadora)
		}
	}

	method remover(divisa) {
		if(game.hasVisual(divisa)) {
			game.removeVisual(divisa)
			divisasGeneradas.remove(divisa)
		}
	}
}

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 3).anyOne()
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
}