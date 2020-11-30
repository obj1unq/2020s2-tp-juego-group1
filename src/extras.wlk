import wollok.game.*
import personajes.*
import divisas.*
import nivel.*
import items.*

object izquierda {
	method nombre() {return "izq"}
	method mover(posicion) {
		return posicion.left(1)
	}
}

object derecha {
	method nombre() {return "der"}
	method mover(posicion) {
		return posicion.right(1)
	}
}

object arriba {
	method nombre() {return "atras"}
	method mover(posicion) {
		return posicion.up(1)
	}
}

object abajo {
	method nombre() {return "adelante"}
	method mover(posicion) {
		return posicion.down(1)
	}
}

object billetera {
	const property position = game.at(17, 13)
	var property saldo = 0
	var property image = "0.png"
	
	method image(){
		return saldo.toString()+".png"
	}
	method guardar(monto) {
		saldo = 0.max(saldo + monto.valor())
	}
	method sacar(monto) {
		saldo = 0.max(saldo - monto)
	}
}

class Corazon {
	const property position
	const corazonPepe
	method image (){
		return if(pepe.energia() >= corazonPepe) "corazon_vivo.png" else "corazon_muerto.png"
	}
	method teEncontro(personaje){
		
	}
}

object enemigosDelNivel{
	var property enemigosVivos = #{}
	
	method borrar(unEnemigo){
		enemigosVivos.remove(unEnemigo)
	}
	
}
