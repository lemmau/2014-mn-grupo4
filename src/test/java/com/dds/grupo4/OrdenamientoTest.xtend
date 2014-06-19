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
import com.dds.grupo4.excepciones.FaltaDefinirCriterioDeOrdenException

class OrdenamientoTest {

	List<Partido> partidos = new ArrayList
	Partido partido
	Partido partido2

	List<Interesado> jugadores
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
	Interesado jugadorEstandar10
	

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
		jugadorEstandar10 = new Interesado("K", "Mulder", LocalDate.of(1979, 12, 15), new Estandar, 9)

		jugadores = #[jugadorEstandar1, jugadorEstandar0, jugadorEstandar9, jugadorEstandar8, jugadorEstandar2
			, jugadorEstandar3, jugadorEstandar6, jugadorEstandar4, jugadorEstandar5, jugadorEstandar7]

		partido.inscribirTodos(jugadores)


		partido.calificarA(jugadorEstandar0, 1, "a")
		partido.calificarA(jugadorEstandar1, 9, "a")
		partido.calificarA(jugadorEstandar2, 8, "a")
		partido.calificarA(jugadorEstandar3, 7, "a")
		partido.calificarA(jugadorEstandar4, 6, "a")
		partido.calificarA(jugadorEstandar5, 5, "a")
		partido.calificarA(jugadorEstandar6, 4, "a")
		partido.calificarA(jugadorEstandar7, 3, "a")
		partido.calificarA(jugadorEstandar8, 2, "a")
		partido.calificarA(jugadorEstandar9, 10, "a")

		jugadores = #[jugadorEstandar10, jugadorEstandar9, jugadorEstandar1, jugadorEstandar8, jugadorEstandar2
			, jugadorEstandar3, jugadorEstandar6, jugadorEstandar4, jugadorEstandar5, jugadorEstandar7]

		partido2.inscribirTodos(jugadores)

		partido2.calificarA(jugadorEstandar10, 10, "a")
		partido2.calificarA(jugadorEstandar1, 4, "a")
		partido2.calificarA(jugadorEstandar2, 6, "a")
		partido2.calificarA(jugadorEstandar3, 8, "a")
		partido2.calificarA(jugadorEstandar4, 1, "a")
		partido2.calificarA(jugadorEstandar5, 7, "a")
		partido2.calificarA(jugadorEstandar6, 3, "a")
		partido2.calificarA(jugadorEstandar7, 9, "a")
		partido2.calificarA(jugadorEstandar8, 5, "a")
		partido2.calificarA(jugadorEstandar9, 7, "a")
		
		partidos.add(partido)
		partidos.add(partido2)
	}

	@Test
	def void verificarOrdenamientoxHandicap() {

		partido.agregarCriterioOrdenamiento(new Handicap())
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxh: " + ins.jugador.handicap)]

		val esperado = #[1,2,3,4,5,6,7,8,9,10]
		val handicapsOrdenados = ordenados.map[inscripcion | inscripcion.jugador.handicap]

		Assert.assertEquals(esperado, handicapsOrdenados)
	}
	
	@Test
	def void verificarOrdenamientoxPromedio() {

		partido.agregarCriterioOrdenamiento(new PromedioCalificaciones())
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxp: " + ins.jugador.handicap)]

		val esperado = #["A","I","H","G","F","E","D","C","B","J"]
		val nombresOrdenados = ordenados.map[inscripcion | inscripcion.jugador.nombre]

		Assert.assertEquals(esperado, nombresOrdenados)
	}

	@Test
	def void verificarOrdenamientoxPromedioNPartidos() {

		partido.agregarCriterioOrdenamiento(new PromedioUltimosPartidos(partidos, 2))
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxpnp: " + ins.jugador.nombre)]

		val esperado = #["A","I","G","E","F","H","B","C","D","J"]
		val nombresOrdenados = ordenados.map[inscripcion | inscripcion.jugador.nombre]

		Assert.assertEquals(esperado, nombresOrdenados)
	}


	@Test
	def void verificarOrdenamientoCombinado() {
		
		partido.agregarCriterioOrdenamiento(new Handicap())
		partido.agregarCriterioOrdenamiento(new PromedioCalificaciones)
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxcomb: " + ins.jugador.nombre)]
		
		val esperado = #["B","I","C","D","G","E","F","H","A","J"]
		val nombresOrdenados = ordenados.map[inscripcion | inscripcion.jugador.nombre]
		Assert.assertEquals(esperado, nombresOrdenados)

	}

	
	@Test(expected=typeof(FaltaDefinirCriterioDeOrdenException))
	def void verificarOrdenamientoCriterioVacio() {
		partido.ordenarJugadoresFinales
	}

}
