import wollok.game.*
import pepe.*
import nivel.*
import extras.*

class Moneda {
	const property valor = 100
	var property position = game.at(3,4)
	
	method image() {
		return "spinning-coin.gif"
	}
	
	method teEnvistio(argento) {
		argento.agarrarDinero(self)
	} 
	
}



class Billete {
	const property valor = 300
	var property position = game.at(1,5)
	
	method image() {
		return "spinning-coin.gif"
	}
	
	method teEnvistio(argento) {
		argento.agarrarDinero(self)
	} 
		
}

class Falso {
	const property valor = -50
	var property position = game.at(6,2)
	
	method image() {
		return "spinning-coin.gif"
	}
	
	method teEnvistio(argento) {
		argento.agarrarDinero(self)
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