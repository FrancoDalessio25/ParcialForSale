class Inmuebles{
	
	const tamanioMetroCuadrado
	const cantidadAmbiente
	var property valorInmueble
	const zona 
	method valor() = valorInmueble + zona.plus()
	method puedeVenderse()
}

class Casa inherits Inmuebles{
	var valorParticular
	
	override method valorInmueble() = valorParticular
}

class PH inherits Inmuebles{
	
	override method valorInmueble() = (14000*tamanioMetroCuadrado).max(500000)
}

class Departamento inherits Inmuebles{
	
	override method valorInmueble() = 350000*cantidadAmbiente
}


class Local inherits Casa{
	var tipoLocal
	
	override method valor() = tipoLocal.valorTotal(valorParticular)
	
	override method puedeVenderse() = throw new DomainException (message = " NO SE PUEDE VENDER FLACO")
	
}

object galpones{

	method valorTotal(valorPropiedad) = valorPropiedad /2
	
	
}
object aLaCalle{
	var property montoFijo
	method valorTotal(valorPropiedad) = valorPropiedad + montoFijo
}















class Zona{
	var plus 
	
	method plus() = plus
	
	
	
}