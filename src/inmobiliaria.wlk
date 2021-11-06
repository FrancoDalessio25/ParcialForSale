
class Inmobiliaria{
	const listaEmpleados = []
	
	method mejorEmpleado(criterio){
		
		listaEmpleados.max{empleado => criterio.criterioParaGanar(empleado)}
		
	}
}

object porTotalDeComisiones{
	
	method criterioParaGanar(empleado) = empleado.totalSumaComisiones()
	
}

object cantidadOperacionesCerradas{
	
	method criterioParaGanar(empleado) = empleado.operacionesCerradas().length()
	
}

object cantidadDeReservas{
	
	method criterioParaGanar(empleado) = empleado.reservas().length()
	
}


class Empleado{
	const operacionesCerradas=[]
	const reservas = []
	method totalSumaComisiones(){
		
		operacionesCerradas.sum{operacion => operacion.comision()}
		
	}
	
	
	method reservas() = reservas
	
	
	method vaATenerProblemasCon(otroEmpleado){ return
		
		self.operoEnLaMismaZona(otroEmpleado) && (self.algunoConcretoUnaOperacion(otroEmpleado) || 
				otroEmpleado.algunoConcretoUnaOperacion(self))
		
	}
	
	method operoEnLaMismaZona(otroEmpleado) = self.zonasOperadas().any{zona => otroEmpleado.zonasQueOperoOtroEmpleado(zona)}
		
		
	
	
	method zonasQueOperoOtroEmpleado(zona) = self.zonasOperadas().contains(zona)
	method zonasOperadas() = operacionesCerradas.map{operacion=>operacion.zona()}
		
	method algunoConcretoUnaOperacion(otroEmpleado){ return
		
		operacionesCerradas.any{operacion => otroEmpleado.reservo(operacion) }
		
	}	
	
	method reservo(operacion) = self.reservas().contains(operacion)
	
	
	method reservar(operacion, cliente){
		operacion.reservarPara(cliente)
		reservas.add(operacion)
	}
	method concretarOperacion(operacion, cliente){
		operacion.concretarPara(cliente)
		operacionesCerradas.add(operacion)
	}
	
}