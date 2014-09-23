package com.dds.grupo4

import com.dds.grupo4.dominio.Admin
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.excepciones.FaltaDefinirCriterioDeOrdenException
import com.dds.grupo4.ordenamiento.Handicap
import com.dds.grupo4.ordenamiento.PromedioCalificaciones
import com.dds.grupo4.ordenamiento.PromedioUltimosPartidos
import com.dds.grupo4.tipoDeInscripcion.Estandar

import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.joda.time.LocalDate
import org.joda.time.LocalDateTime

class OrdenamientoTest {

	List<Partido> partidos = new ArrayList
	Partido partido
	Partido partido2

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
		partido.setFechaInicio(new LocalDateTime(2014, 06, 12, 21, 00))

		partido2 = new Partido(new Admin("admin@ddsutn.com"))
		partido2.setFechaInicio(new LocalDateTime(2014, 06, 13, 21, 00))

		jugadorEstandar0 = new Jugador("A", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 10)
		jugadorEstandar1 = new Jugador("B", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 1)
		jugadorEstandar2 = new Jugador("C", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 2)
		jugadorEstandar3 = new Jugador("D", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 3)
		jugadorEstandar4 = new Jugador("E", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 4)
		jugadorEstandar5 = new Jugador("F", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 5)
		jugadorEstandar6 = new Jugador("G", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 6)
		jugadorEstandar7 = new Jugador("I", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 7)
		jugadorEstandar8 = new Jugador("J", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 8)
		jugadorEstandar9 = new Jugador("K", "Mulder", new LocalDate(1979, 12, 14), new Estandar, 9)
		jugadorEstandar10 = new Jugador("L", "Mulder", new LocalDate(1979, 12, 15), new Estandar, 9)

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
		//handicapsOrdenados.forEach[ins | System.out.println("oxh: " + ins)]
		
		Assert.assertEquals(esperado, handicapsOrdenados)
	}

	@Test
	def void verificarOrdenamientoxPromedio() {

		partido.agregarCriterioOrdenamiento(new PromedioCalificaciones())
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxp: " + ins.jugador.handicap)]

		//val esperado = #["A","I","H","G","F","E","D","C","B","J"]
		val esperado = #["A","J","I","G","F","E","D","C","B","K"]
		val nombresOrdenados = ordenados.map[inscripcion | inscripcion.jugador.nombre]
		//nombresOrdenados.forEach[ins | System.out.println("oxp: " + ins)]

		Assert.assertEquals(esperado, nombresOrdenados)
	}

	@Test
	def void verificarOrdenamientoxPromedioNPartidos() {

		partido.agregarCriterioOrdenamiento(new PromedioUltimosPartidos(partidos, 2))
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxpnp: " + ins.jugador.nombre)]

		//val esperado = #["A","I","G","E","F","H","B","C","D","J"]
		val esperado = #["A","J","G","E","F","I","B","C","D","K"]
		val nombresOrdenados = ordenados.map[inscripcion | inscripcion.jugador.nombre]
		//nombresOrdenados.forEach[ins | System.out.println("oxpnp: " + ins)]

		Assert.assertEquals(esperado, nombresOrdenados)
	}


	@Test
	def void verificarOrdenamientoCombinado() {
		
		partido.agregarCriterioOrdenamiento(new Handicap())
		partido.agregarCriterioOrdenamiento(new PromedioCalificaciones)
		val ordenados = partido.ordenarJugadoresFinales

		//ordenados.forEach[ins | System.out.println("oxcomb: " + ins.jugador.nombre)]
		
		//val esperado = #["B","I","C","D","G","E","F","H","A","J"]
		val esperado = #["B","J","C","D","G","E","F","I","A","K"]
		val nombresOrdenados = ordenados.map[inscripcion | inscripcion.jugador.nombre]
		//nombresOrdenados.forEach[ins | System.out.println("oxcomb: " + ins)]
		
		Assert.assertEquals(esperado, nombresOrdenados)

	}

	
	@Test(expected=typeof(FaltaDefinirCriterioDeOrdenException))
	def void verificarOrdenamientoCriterioVacio() {
		partido.ordenarJugadoresFinales
	}

}
