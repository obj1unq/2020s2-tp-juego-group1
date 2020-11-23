import nivel.*
import pepe.*
import extras.*

class Item {
	const property nombre
	var property valor
	var property potencia
	
	method usarEn(personaje)
	
}
class Arma inherits Item{
	var property cantidadDeBalas
	override method usarEn(personaje){
		personaje.equiparArma(self)
	}

}
class Comida inherits Item{
	override method usarEn(personaje){
		personaje.consumir(self)
	}
}

