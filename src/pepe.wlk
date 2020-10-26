import wollok.game.*
import extras.*
import nivel.*
import divisas.*

object pepe {
	var property energia = 5
	var property position = game.origin()
	var property cuenta = cuentaCorriente

	method image() {
		return "pepe_atras.png"
	}

	method irASiEstaEnElMapa(nuevaPosicion) {
		if(self.estaDentroDelMapa(nuevaPosicion)) {
			self.position().distance(nuevaPosicion)
		}
	}
	
	method estaDentroDelMapa(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1)
		and		nuevaPosicion.y().between(0, game.height() - 1) 
	}
	
	method agarrarDinero(divisa) {
		cuenta.depositar(divisa)
		generadorDeDivisas.remover(divisa)
	}
	
	method comprarAMoni(comida) {
		
		if (self.estoyConMoni()) {
			self.elegirYPagar(comida)
		}
		
	}
			
	method elegirYPagar(comida) {
		const cafecito = 50
		const milanesa = 100
		const pizza = 250
		const sanguchito = 300
		
		self.validarDineroEnCuenta(comida)
		
		if (comida == cafecito) {
			game.say(self, "Dame un cafecito, Moni " )
			}
		else if (comida == milanesa) {
			game.say(self, "Dame una mila, Moni " )
			} 
		else if (comida == pizza) {
			game.say(self, "Dame una muzza, Moni " )
			}
		else if (comida == sanguchito) {
			game.say(self, "Dame uno de bondiola, Moni " )
			} 
		else { } 
		cuenta.extraer(comida)		
	}

	method validarDineroEnCuenta(comida) {
		const cafecito = 50
		const milanesa = 100
		const pizza = 250
		const sanguchito = 300
		
		if  (comida > cuentaCorriente.saldo()) {
			self.error("No me alcanza la guitaaa!!")
		}
	}

	method estoyConMoni() {
		return self.position() == moni.position()
	}
	
	method comprarAMariaElena(armas) {
		
		if (self.estoyConMElena()) {
			self.elegirArmasYPagar(armas)
		}	
	}
	
	method estoyConMElena() {
		return self.position() == mariaElena.position()
	}
	
	method elegirArmasYPagar(armas) {
		const pistolaLaser = 700
		const escopetaConVeneno = 500
		const lanzaFuegos = 300
		
		self.validarDineroEnCuenta(armas)
		
		if (armas == pistolaLaser) {
			game.say(self, "Quiero esa Pistola Laser!" )
			}
		else if (armas == escopetaConVeneno) {
			game.say(self, "Dame la Escopeta Envenenada!" )
			} 
		else if (armas == lanzaFuegos) {
			game.say(self, "¡¡¡llamas a miiií!!! " )
			}
		else { } 
		cuenta.extraer(armas)
	}
	
	
}

class Invisible {
	var property position = game.origin()
	
	method image() {
		return ""
	}
}

object moni {
	var property position = game.at(1,5)
	
	method image() { 
		return "moni.png"	
	}
		
	method teEnvistio(argento) {
		game.say(self, "Hola Pepe... cafecitoooo") 
	}
		
}

object mariaElena {
	var property position = game.at(8,8)
	
	method image() { 
		return "maria_elena.png"	
	}
		
	method teEnvistio(argento) {
		game.say(self, "qué pasa bigote!.. ¿sos careta?") 
	}
	
}