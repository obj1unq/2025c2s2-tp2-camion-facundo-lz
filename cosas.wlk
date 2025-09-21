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

	method sufrioAccidente(){}
}

object arenaAGranel{
	var property peso = 100

	method nivelPeligrosidad(){
		return 1
	}

	method totalBultos (){
		return 1
	}

	method sufrioAccidente(){
		peso += 20
	}
}

object bumblebee{
	var estaTransformadoEnAuto = true

	method peso(){
		return 800
	}

	method nivelPeligrosidad(){
		if (estaTransformadoEnAuto) {
			return 15
		} else {
			return 30
		}
	}

	method estaTransformadoEnAuto (bool){
		estaTransformadoEnAuto = bool
	}

	method totalBultos (){
		return 2
	}

	method sufrioAccidente(){
		estaTransformadoEnAuto = not estaTransformadoEnAuto
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
		self.validarCantidadDeLadrillos(_cantidadDeLadrillos)
		cantidadDeLadrillos = _cantidadDeLadrillos
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

	method validarCantidadDeLadrillos (_cantidadDeLadrillos){}

	method sufrioAccidente(){
		cantidadDeLadrillos = 0.max(cantidadDeLadrillos - 12)
	}
}

object bateriaAntiaerea{
	var tieneMisiles = true

	method peso(){
		if (tieneMisiles){
			return 300
		} else {
			return 200
		}
	}

	method nivelPeligrosidad(){
		if (tieneMisiles) {
			return 100
		} else {
			return 0
		}
	}

	method tieneMisiles (bool){
		tieneMisiles = bool
	}

	method totalBultos (){
		if (!tieneMisiles){
			return 1
		} else {
			return 2
		}
	}

	method sufrioAccidente(){
		tieneMisiles = false
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

	method sufrioAccidente(){
		peso += 15
	}
}

object contenedorPortuario{
	const cosas = #{}

	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad(){
		return 0.max(cosas.max({cosa => cosa.nivelPeligrosidad()}))
	}

	method cargar (cosa){
		cosas.add(cosa)
	}

	method totalBultos (){
		return 1 + cosas.sum({cosa => cosa.totalBultos()})
	}

	method sufrioAccidente(){
		cosas.forEach({cosa => cosa.sufrioAccidente()})
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

	method sufrioAccidente(){}
}