import wollok.game.*
import pepe.*
import divisas.*
import niveles.*


object cuentaCorriente {
	var property saldo = 0
	
	method depositar(monto) {
		saldo += monto.valor()
	}
	
	method extraer(monto) {
		saldo-= monto
	}
}