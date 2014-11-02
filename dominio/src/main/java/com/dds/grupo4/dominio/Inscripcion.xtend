package com.dds.grupo4.dominio

import java.util.ArrayList
import java.util.List

import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException
import com.dds.grupo4.excepciones.NoTieneCalificacionesException
import java.io.Serializable

class Inscripcion implements Serializable {

	val private static MAX_CALIFICACIONES_XPARTIDO = 9
	@Property Jugador jugador
	@Property List<Calificacion> calificaciones = new ArrayList;

	new(Jugador interesado) {
		this.jugador = interesado
	}

	new(Jugador jugador, List<Calificacion> calificaciones) {
		_jugador = jugador
		_calificaciones = calificaciones
	}

	def void calificar(Integer puntaje, String critica) {
		if (cantidadCalificaciones >= MAX_CALIFICACIONES_XPARTIDO)
			throw new SuperaMaximoCalificacionesException("El jugador ya tiene el maximo de calificaciones por partido")

		this.calificaciones.add(new Calificacion(puntaje, critica))
	}

	def Integer sumaCalificaciones() {
		sumaCalificaciones(_calificaciones)
	}

	def Integer sumaCalificaciones(List<Calificacion> calificaciones) {
		calificaciones.map[nota].reduce[p1, p2|p1 + p2]
	}

	def Integer cantidadCalificaciones() {
		cantidadCalificaciones(_calificaciones)
	}

	def Integer cantidadCalificaciones(List<Calificacion> calificaciones) {
		calificaciones.size
	}

	def private Double promedio(List<Calificacion> calificaciones) {
		if (0.equals(cantidadCalificaciones(calificaciones)))
			throw new NoTieneCalificacionesException("El jugador no tiene calificaciones")

		//println(jugador.nombre + " " + new Double(sumaCalificaciones(calificaciones) / cantidadCalificaciones(calificaciones) as double))
		new Double(sumaCalificaciones(calificaciones) / cantidadCalificaciones(calificaciones) as double)
	}

	def Double promedioCalificaciones() {
		promedio(calificaciones)
	}

	def Double promedioUltimasCalificaciones(Integer ultimasN) {
		try {
			promedio(calificaciones.subList(cantidadCalificaciones - ultimasN, cantidadCalificaciones))
		} catch (IndexOutOfBoundsException e) {
			throw new SuperaMaximoCalificacionesException(
				"No se puede calcular el promedio. Cantidad calificaciones actual: " + calificaciones.size)
		}
	}

}
