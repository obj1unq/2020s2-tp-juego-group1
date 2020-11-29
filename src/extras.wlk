import wollok.game.*
import pepe.*
import divisas.*
import nivel.*


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


