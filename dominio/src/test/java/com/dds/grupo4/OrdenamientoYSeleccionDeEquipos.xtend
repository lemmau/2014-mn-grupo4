package com.dds.grupo4

import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.dominio.Admin
import org.joda.time.DateTime
import org.junit.Before
import com.dds.grupo4.tipoDeInscripcion.Estandar
import org.junit.Test
import java.util.List
import com.dds.grupo4.home.Partidos
import com.dds.grupo4.ordenamiento.Handicap
import com.dds.grupo4.divisorequipos.ParImpar
import com.dds.grupo4.dominio.Inscripcion
import org.junit.Assert
import com.dds.grupo4.ordenamiento.CriterioOrden
import java.util.ArrayList

class OrdenamientoYSeleccionDeEquipos {
	
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

		jugadorEstandar0 = new Jugador("A","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 1)
		jugadorEstandar1 = new Jugador("B","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 2)
		jugadorEstandar2 = new Jugador("C","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 3)
		jugadorEstandar3 = new Jugador("D","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 4)
		jugadorEstandar4 = new Jugador("E","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 5)
		jugadorEstandar5 = new Jugador("F","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 6)
		jugadorEstandar6 = new Jugador("G","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 7)
		jugadorEstandar7 = new Jugador("H","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 8)
		jugadorEstandar8 = new Jugador("I","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 10)
		jugadorEstandar9 = new Jugador("J","pepe", "Mulder", new DateTime(1979, 12, 14,0,0), new Estandar, 9)

		jugadores = #[jugadorEstandar0, jugadorEstandar1, jugadorEstandar2, jugadorEstandar3, jugadorEstandar4
			, jugadorEstandar5, jugadorEstandar6, jugadorEstandar7, jugadorEstandar8, jugadorEstandar9]

		partido.inscribirTodos(jugadores)

	}
	
	@Test
	def void dividirYSeleccionarEquipos(){
		val List<CriterioOrden> criterios = new ArrayList()
		
		criterios.add(new Handicap) 
		val esperado = #["A", "C", "E", "G", "J", "B", "D", "F", "H", "I"] 
		
		val List<Inscripcion> resultado = partido.generarEquipo(new ParImpar(partido),criterios)
		
		Assert.assertEquals(esperado,resultado.map[ins | ins.jugador.nombre])
		
	}
	
	
	
}