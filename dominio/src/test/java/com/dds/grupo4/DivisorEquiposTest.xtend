package com.dds.grupo4

import com.dds.grupo4.dominio.Admin
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.tipoDeInscripcion.Estandar

import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import com.dds.grupo4.divisorequipos.NumerosFijos
import com.dds.grupo4.divisorequipos.DivisorDeEquipos
import com.dds.grupo4.divisorequipos.ParImpar
import org.joda.time.DateTime

class DivisorEquiposTest {

	Partido partido

	List<Jugador> jugadores
	Jugador jugadorEstandar0
	Jugador jugadorEstandar1
	Jugador jugadorEstandar2
	Jugador jugadorEstandar3
	Jugador jugadorEstandar4
	Jugador jugadorEstandar5
	Jugador jugadorEstandar6
	Jugador jugadorEstandar7
	Jugador jugadorEstandar8
	Jugador jugadorEstandar9
	Jugador jugadorEstandar10
	

	@Before
	def void setUp() {
		partido = new Partido(new Admin("admin@ddsutn.com"))
		partido.setFechaInicio(new DateTime(2014, 06, 12, 21, 00))

		jugadorEstandar0 = new Jugador("A","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 10)
		jugadorEstandar1 = new Jugador("B","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 1)
		jugadorEstandar2 = new Jugador("C","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 2)
		jugadorEstandar3 = new Jugador("D","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 3)
		jugadorEstandar4 = new Jugador("E","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 4)
		jugadorEstandar5 = new Jugador("F","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 5)
		jugadorEstandar6 = new Jugador("G","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 6)
		jugadorEstandar7 = new Jugador("I","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 7)
		jugadorEstandar8 = new Jugador("J","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 8)
		jugadorEstandar9 = new Jugador("K","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 9)
		jugadorEstandar10 = new Jugador("L","pepe", "Mulder", new DateTime(1979, 12, 15,0,0), new Estandar, 9)

		jugadores = #[jugadorEstandar0, jugadorEstandar1, jugadorEstandar2, jugadorEstandar3, jugadorEstandar4
			, jugadorEstandar5, jugadorEstandar6, jugadorEstandar7, jugadorEstandar8, jugadorEstandar9]

		partido.inscribirTodos(jugadores)

	}

	@Test
	def void dividirEquiposxNumerosFijos() {

		val DivisorDeEquipos divisor = new NumerosFijos(partido)
		
		divisor.dividirEnEquipos(partido.inscripciones)
		
		val esperadoA = #["B","E","F","J","K"]
		val esperadoB = #["A","C","D","G","I"]

		Assert.assertEquals(esperadoA, partido.equipoA.map[inscripcion | inscripcion.jugador.nombre])
		Assert.assertEquals(esperadoB, partido.equipoB.map[inscripcion | inscripcion.jugador.nombre])
	}

	@Test
	def void dividirEquiposxParImpar() {

		val DivisorDeEquipos divisor = new ParImpar(partido)
		
		divisor.dividirEnEquipos(partido.inscripciones)
		
		val esperadoA = #["A","C","E","G","J"]
		val esperadoB = #["B","D","F","I","K"]

		Assert.assertEquals(esperadoA, partido.equipoA.map[inscripcion | inscripcion.jugador.nombre])
		Assert.assertEquals(esperadoB, partido.equipoB.map[inscripcion | inscripcion.jugador.nombre])
	}
}
