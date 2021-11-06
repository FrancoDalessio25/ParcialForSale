// Que empiece la fiesta!



class Operacion{
	
	var inmueble
	var estado = abierto 
	method comision()
	method zona()
	
	method estado() = estado
	method reservarPara(cliente){
		estado.realizarReserva(self, cliente)
	}
	method concretarPara(cliente){
		estado.concretarOperacion(self, cliente)
	}
}


class Venta inherits Operacion{
	var property porcentajeInmueble = 1.5
	override method comision() =  inmueble.valorInmueble() * self.porcentajeInmueble()
	
}

class Alquiler inherits Operacion{
	var cantidadMeses 
	override method comision() =  (inmueble.valorInmueble() * cantidadMeses) / 50000	
	
}


class Estado{
	
	method realizarReserva(operacion,cliente)
	 method concretarOperacion(operacion,cliente){
	 	self.validarCierre(cliente)
		operacion.estado(cerrado)
	}
	
	method validarCierre(cliente){return true}
	
}

object abierto inherits Estado{
	
	override method realizarReserva(operacion,cliente){
		
		operacion.estado(new Reservado(nuevoCliente = cliente))
		
	}
	
	
}


object cerrado inherits Estado{
	
	override method realizarReserva(operacion,cliente){
		
		throw new DomainException(message    =   "ya esta cerrado")
		
	}
	
	method validarCierre(operacion,cliente){
		
			
			throw new DomainException(message    =   "ya esta cerrado")
			}
		
}



class Reservado inherits Estado{
	var nuevoCliente
	method nuevoCliente(cliente){ nuevoCliente = cliente }
	override method realizarReserva(operacion,cliente){

			throw new DomainException(message    =   "ya esta reservado")
		
	}
	
	 method validarCierre(operacion,cliente){
		if (nuevoCliente != cliente){
			
			throw new DomainException(message    =   "ya esta reservado por otro cliente")
			
		}
			
		
	}
}



























