object knightRider {
	method peso() { 
		return 500 
	}

	method nivelPeligrosidad() { 
		return 10 
	}

	method totalBultos (){
		return 1
	}

	method sufrirAccidente(){}
}

object arenaAGranel{
	var property peso = 100

	method nivelPeligrosidad(){
		return 1
	}

	method totalBultos (){
		return 1
	}

	method sufrirAccidente(){
		peso += 20
	}
}

object bumblebee{
	var property estaEnModoAuto = true

	method peso(){
		return 800
	}

	method nivelPeligrosidad(){
		if (estaEnModoAuto) {
			return 15
		} else {
			return 30
		}
	}

	method totalBultos (){
		return 2
	}

	method sufrirAccidente(){
		estaEnModoAuto = not estaEnModoAuto
	}
}

object paqueteDeLadrillos{
	var cantidadDeLadrillos = 0

	method peso(){
		return cantidadDeLadrillos * 2
	}
	
	method nivelPeligrosidad(){
		return 2
	}

	method cantidadDeLadrillos (_cantidadDeLadrillos){
		cantidadDeLadrillos = 0.max(_cantidadDeLadrillos)
	}

	method cantidadDeLadrillos (){
		return cantidadDeLadrillos
	}

	method totalBultos (){
		if (cantidadDeLadrillos <= 100){
			return 1
		} else if (cantidadDeLadrillos <= 300){
			return 2
		} else {
			return 3
		}
	}

	method sufrirAccidente(){
		cantidadDeLadrillos = 0.max(cantidadDeLadrillos - 12)
	}
}

object bateriaAntiaerea{
	var property estaCargada = false

	method peso(){
		if (estaCargada){
			return 300
		} else {
			return 200
		}
	}

	method nivelPeligrosidad(){
		if (estaCargada) {
			return 100
		} else {
			return 0
		}
	}

	method totalBultos (){
		if (!estaCargada){
			return 1
		} else {
			return 2
		}
	}

	method sufrirAccidente(){
		estaCargada = false
	}
}

object residuosRadioactivos{
	var property peso = 100

	method nivelPeligrosidad(){
		return 200
	}

	method totalBultos (){
		return 1
	}

	method sufrirAccidente(){
		peso += 15
	}
}

object contenedorPortuario{
	const cosas = #{}

	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		} else {
			return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}

	method cargar (cosa){
		cosas.add(cosa)
	}

	method totalBultos (){
		return 1 + cosas.sum({cosa => cosa.totalBultos()})
	}

	method sufrirAccidente(){
		cosas.forEach({cosa => cosa.sufrirAccidente()})
	}
}

object embalajeDeSeguridad{
	var cosaEnvuelta = knightRider

	method peso(){
		return cosaEnvuelta.peso()
	}

	method nivelPeligrosidad(){
		return cosaEnvuelta.nivelPeligrosidad() / 2
	}

	method cosaEnvuelta(cosa){
		cosaEnvuelta = cosa
	}

	method totalBultos (){
		return 2
	}

	method sufrirAccidente(){}
}