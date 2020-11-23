import wollok.game.*
import pepe.*
import divisas.*
import nivel.*


object cuentaCorriente {
	var property saldo = 0
	
	method depositar(monto) {
		saldo += monto.valor()
	}
	
	method extraer(monto) {
		saldo-= monto
	}
}
object proyectilMalo {
	var property position = game.at(3,4)
	method image(){ return "laser_naranja.png"}
	method teEnvistio(argento){
		argento.heridoPor(self)
		
	}
	method esAtravesable(){
		return true
	}
}