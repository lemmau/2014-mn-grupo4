package com.dds.grupo4

import java.util.ArrayList
import java.util.List

import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException

class Inscripcion {

	val private static MAX_CALIFICACIONES_XPARTIDO = Integer.valueOf(9)
	@Property private Interesado jugador
	@Property List<Calificacion> calificaciones = new ArrayList;


	new(Interesado interesado) {
		this.jugador = interesado
	}


	def void calificar (Integer puntaje, String critica) {
		if (cantidadCalificaciones >= MAX_CALIFICACIONES_XPARTIDO)
			throw new SuperaMaximoCalificacionesException("El jugador ya tiene el maximo de calificaciones por partido")

		this.calificaciones.add( new Calificacion( puntaje, critica ) )
	}

	def Integer cantidadCalificaciones () {
		this.calificaciones.size
	}

	def private Integer promedio(List<Calificacion> calificaciones) {
		calificaciones.map[nota].reduce[p1, p2| p1 + p2] / calificaciones.size
	}

	def Integer promedioCalificaciones () {
		promedio(this.calificaciones)
	}
	
	def promedioUltimasCalificaciones(Integer ultimasN) {
		try {
			promedio(calificaciones.subList(calificaciones.size - ultimasN -1, calificaciones.size-1))
		} catch (IndexOutOfBoundsException e) {
			throw new SuperaMaximoCalificacionesException("No se puede calcular el promedio. Cantidad calificaciones actual: " + calificaciones.size)
		}
	}

}