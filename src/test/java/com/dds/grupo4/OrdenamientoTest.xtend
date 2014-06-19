package com.dds.grupo4

import com.dds.grupo4.ordenamiento.Handicap
import com.dds.grupo4.tipoDeInscripcion.Estandar
import java.time.LocalDate
import java.time.LocalDateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import java.util.List
import java.util.ArrayList
import com.dds.grupo4.ordenamiento.PromedioUltimosPartidos
import com.dds.grupo4.ordenamiento.PromedioCalificaciones

class OrdenamientoTest {

	List<Partido> partidos = new ArrayList
	Partido partido
	Partido partido2

	Interesado jugadorEstandar0
	Interesado jugadorEstandar1
	Interesado jugadorEstandar2
	Interesado jugadorEstandar3
	Interesado jugadorEstandar4
	Interesado jugadorEstandar5
	Interesado jugadorEstandar6
	Interesado jugadorEstandar7
	Interesado jugadorEstandar8
	Interesado jugadorEstandar9
	

	@Before
	def void setUp() {
		partido = new Partido(new Admin("admin@ddsutn.com"))
		partido.setFechaInicio(LocalDateTime.of(2014, 06, 12, 21, 00))

		partido2 = new Partido(new Admin("admin@ddsutn.com"))
		partido2.setFechaInicio(LocalDateTime.of(2014, 06, 13, 21, 00))

		jugadorEstandar0 = new Interesado("A", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 10)
		jugadorEstandar1 = new Interesado("B", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 1)
		jugadorEstandar2 = new Interesado("C", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 2)
		jugadorEstandar3 = new Interesado("D", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 3)
		jugadorEstandar4 = new Interesado("E", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 4)
		jugadorEstandar5 = new Interesado("F", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 5)
		jugadorEstandar6 = new Interesado("G", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 6)
		jugadorEstandar7 = new Interesado("H", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 7)
		jugadorEstandar8 = new Interesado("I", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 8)
		jugadorEstandar9 = new Interesado("J", "Mulder", LocalDate.of(1979, 12, 14), new Estandar, 9)

		partido.inscribirA(jugadorEstandar9)
		partido.inscribirA(jugadorEstandar0)
		partido.inscribirA(jugadorEstandar1)
		partido.inscribirA(jugadorEstandar8)
		partido.inscribirA(jugadorEstandar2)
		partido.inscribirA(jugadorEstandar3)
		partido.inscribirA(jugadorEstandar6)
		partido.inscribirA(jugadorEstandar4)
		partido.inscribirA(jugadorEstandar5)
		partido.inscribirA(jugadorEstandar7)

		partido.calificarA(jugadorEstandar0, 10, "a")
		partido.calificarA(jugadorEstandar1, 1, "a")
		partido.calificarA(jugadorEstandar2, 2, "a")
		partido.calificarA(jugadorEstandar3, 3, "a")
		partido.calificarA(jugadorEstandar4, 4, "a")
		partido.calificarA(jugadorEstandar5, 5, "a")
		partido.calificarA(jugadorEstandar6, 6, "a")
		partido.calificarA(jugadorEstandar7, 7, "a")
		partido.calificarA(jugadorEstandar8, 8, "a")
		partido.calificarA(jugadorEstandar9, 9, "a")

		partido2.inscribirA(jugadorEstandar9)
		partido2.inscribirA(jugadorEstandar0)
		partido2.inscribirA(jugadorEstandar1)
		partido2.inscribirA(jugadorEstandar8)
		partido2.inscribirA(jugadorEstandar2)
		partido2.inscribirA(jugadorEstandar3)
		partido2.inscribirA(jugadorEstandar6)
		partido2.inscribirA(jugadorEstandar4)
		partido2.inscribirA(jugadorEstandar5)
		partido2.inscribirA(jugadorEstandar7)

		partido2.calificarA(jugadorEstandar0, 10, "a")
		partido2.calificarA(jugadorEstandar1, 1, "a")
		partido2.calificarA(jugadorEstandar2, 2, "a")
		partido2.calificarA(jugadorEstandar3, 3, "a")
		partido2.calificarA(jugadorEstandar4, 4, "a")
		partido2.calificarA(jugadorEstandar5, 5, "a")
		partido2.calificarA(jugadorEstandar6, 6, "a")
		partido2.calificarA(jugadorEstandar7, 7, "a")
		partido2.calificarA(jugadorEstandar8, 8, "a")
		partido2.calificarA(jugadorEstandar9, 9, "a")
		
		partidos.add(partido)
		partidos.add(partido2)
	}

	@Test
	def void verificarOrdenamientoxHandicap() {

		partido.agregarCriterioOrdenamiento(new Handicap())
		partido.ordenarListaJugadores
//		partido.inscripciones.forEach[ins | System.out.println(ins.jugador.handicap)]

		val handicapsOrdenados = partido.inscripciones.map[inscripcion | inscripcion.jugador.handicap]
		val esperado = #[1,2,3,4,5,6,7,8,9,10]
		Assert.assertEquals(esperado, handicapsOrdenados)
		//(0..9).forEach[i | Assert.assertEquals(i+1 , partido.inscripciones.get(i).jugador.handicap)]
	}
	
	@Test
	def void verificarOrdenamientoxPromedio() {

		partido.agregarCriterioOrdenamiento(new PromedioCalificaciones())
		partido.ordenarListaJugadores
		partido.inscripciones.forEach[ins | System.out.println(ins.promedioCalificaciones)]

		(0..9).forEach[i | Assert.assertEquals(i+1 , partido.inscripciones.get(i).promedioCalificaciones)]
	}

	@Test
	def void verificarOrdenamientoxPromedioNPartidos() {

		partido.agregarCriterioOrdenamiento(new PromedioUltimosPartidos(partidos, 2))
		partido.ordenarListaJugadores
		partido.inscripciones.forEach[ins | System.out.println(ins.promedioCalificaciones)]

		(0..9).forEach[i | Assert.assertEquals(i+1 , partido.inscripciones.get(i).promedioCalificaciones)]
	}


	@Test
	def void verificarOrdenamientoCombinado() {
		
		partido.agregarCriterioOrdenamiento(new Handicap())
		partido.agregarCriterioOrdenamiento(new PromedioCalificaciones)
		partido.ordenarListaJugadores
		partido.inscripciones.forEach[ins | System.out.println(ins.jugador.nombre)]

		// TODO cambiar esto para chequear orden!!
		Assert.assertEquals("B", partido.inscripciones.get(0).jugador.nombre)
		Assert.assertEquals("C", partido.inscripciones.get(1).jugador.nombre)
		Assert.assertEquals("D", partido.inscripciones.get(2).jugador.nombre)
		Assert.assertEquals("E", partido.inscripciones.get(3).jugador.nombre)
		Assert.assertEquals("F", partido.inscripciones.get(4).jugador.nombre)
		Assert.assertEquals("G", partido.inscripciones.get(5).jugador.nombre)
		Assert.assertEquals("H", partido.inscripciones.get(6).jugador.nombre)
		Assert.assertEquals("I", partido.inscripciones.get(7).jugador.nombre)
		Assert.assertEquals("J", partido.inscripciones.get(8).jugador.nombre)
		Assert.assertEquals("A", partido.inscripciones.get(9).jugador.nombre)

	}

	
//	@Test
//	def void verificarOrdenamientoCriterioVacio() {
//		partido.ordenarListaJugadores
//	}

}
