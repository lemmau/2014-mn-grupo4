package com.dds.grupo4

import java.util.List
import org.joda.time.DateTime
import java.util.ArrayList
import com.dds.grupo4.observers.PartidoObservador

class Partido {

	val private static PRIMERA_POSICION = 0
	val private static UNA_POSICION = 1
	val private static MIN_CANTIDAD_JUGADORES = Integer.valueOf(0)
	val private static MAX_CANTIDAD_JUGADORES = Integer.valueOf(10)
	@Property DateTime fechaInicio;
	@Property List<Interesado> interesados = new ArrayList;
	@Property List<PartidoObservador> observers = new ArrayList;
	@Property private String admin
	@Property private Interesado ultimoInteresadoAgregado

	def void inscribirA(Interesado interesado) {

		var cantInteresadosEstandar = this.interesados.filter[inte|inte.sosEstandar].size;

		if (cantInteresadosEstandar <= MAX_CANTIDAD_JUGADORES) {
			interesado.inscribite(this)
			this.ultimoInteresadoAgregado = interesado
		}

		this.observers.forEach[observer|observer.notificar(this)]

	}

	def List<Interesado> jugadoresFinales() {

		if (! (this.interesados.size < MAX_CANTIDAD_JUGADORES)) {
			return this.interesados.subList(MIN_CANTIDAD_JUGADORES, MAX_CANTIDAD_JUGADORES);
		} else {
			throw new RuntimeException("No hay diez jugadores para realizar un partido")
		}
	}

	def inscribirEstandar(Interesado interesadoEstandar) {
		this.interesados.add(PRIMERA_POSICION, interesadoEstandar)
	}

	def inscribirSolidario(Interesado interesadoSolidario) {
		val Interesado interesadoEstandar = this.interesados.findLast[inte|inte.sosEstandar]
		val Integer posicion = this.interesados.lastIndexOf(interesadoEstandar) + UNA_POSICION

		this.interesados.add(posicion, interesadoSolidario);
	}

	def inscribirCondicional(Interesado interesadoCondicional) {
		val (List<Interesado>)=>Boolean condicionPartido = interesadoCondicional.condicionDelPartido

		if (condicionPartido.apply(this.interesados)) {
			this.interesados.add(interesadoCondicional)
		}

	}

	def void darDeBajaA(Interesado interesado,Infraccion infraccion) {

		if (this.interesados.contains(interesado)) {

			try {
				this.interesados.remove(interesado)
				this.inscribirA(interesado.getReemplazante)
			} catch (RuntimeException e) {
				interesado.agregarInfraccion(infraccion)
			}

		} else {
			//throw some exception 
		}

	}

}
