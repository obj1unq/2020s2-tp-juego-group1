import pepe.*
import wollok.game.*

class Corazon {
	const property position
	const corazonPepe
	method image (){
		return if(pepe.energia() >= corazonPepe) "corazon_vivo.png" else "corazon_muerto.png"
	}
	method teEncontro(personaje){
		
	}
}