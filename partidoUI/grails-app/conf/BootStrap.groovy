import com.dds.grupo4.dominio.Admin
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.tipoDeInscripcion.Estandar

import org.joda.time.LocalDate
import org.joda.time.LocalDateTime

import com.dds.grupo4.home.Partidos
import com.dds.grupo4.home.TodosLosJugadores;

class BootStrap {

	def init = { servletContext ->
				
		println "Generamos juego de datos de partidos"
		println "Generamos juego de datos de jugadores"
		
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
		
		partido = new Partido(new Admin("admin@ddsutn.com"))
		partido.setFechaInicio(LocalDateTime.now().plusDays(5))
		
		jugadorEstandar0 = new Jugador("Alan", "Mulder", "Al" , new LocalDate(1985, 12, 14), new Estandar(), 10)
		jugadorEstandar1 = new Jugador("Brian", "Sarto", "Brayus", new LocalDate(1979, 12, 14), new Estandar(), 1)
		jugadorEstandar2 = new Jugador("Cristian", "Mulder","Cris", new LocalDate(1991, 12, 14), new Estandar(), 2)
		jugadorEstandar3 = new Jugador("Daniel", "Mulderist","Dani", new LocalDate(1962, 12, 14), new Estandar(), 3)
		jugadorEstandar4 = new Jugador("Ezequiel", "Mente", "Equi", new LocalDate(1940, 12, 14), new Estandar(), 4)
		jugadorEstandar5 = new Jugador("Francisco", "Mulder","Pancho", new LocalDate(1999, 12, 14), new Estandar(), 5)
		jugadorEstandar6 = new Jugador("Gonzalo", "Mur", "Ganzo", new LocalDate(1968, 12, 14), new Estandar(), 6)
		jugadorEstandar7 = new Jugador("Ivan", "Muler", "Ivo",new LocalDate(1910, 12, 14), new Estandar(), 7)
		jugadorEstandar8 = new Jugador("Joaquin", "Restia", "Joaco", new LocalDate(1979, 12, 14), new Estandar(), 8)
		jugadorEstandar9 = new Jugador("Kevin", "Noir", "Tito", new LocalDate(1945, 12, 14), new Estandar(), 9)
		jugadorEstandar10 = new Jugador("Luis", "Mulder", "Lucho",new LocalDate(1918, 12, 15), new Estandar(), 9)
		
		jugadores = [jugadorEstandar0, jugadorEstandar1, jugadorEstandar2, jugadorEstandar3, jugadorEstandar4
			, jugadorEstandar5, jugadorEstandar6, jugadorEstandar7, jugadorEstandar8, jugadorEstandar9]
	 
		partido.inscribirTodos(jugadores)
		
		jugadorEstandar0.agregarAmigo(jugadorEstandar1)
		jugadorEstandar0.agregarAmigo(jugadorEstandar2)
		jugadorEstandar0.agregarAmigo(jugadorEstandar3)
		jugadorEstandar1.agregarAmigo(jugadorEstandar1)
		jugadorEstandar1.agregarAmigo(jugadorEstandar2)
		
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar0)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar1)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar2)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar3)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar4)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar5)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar6)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar7)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar8)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar9)
		TodosLosJugadores.instance.proponerJugador(jugadorEstandar10)
				
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar0)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar1)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar2)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar3)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar4)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar5)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar6)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar7)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar8)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar9)
		TodosLosJugadores.instance.aceptarInteresado(jugadorEstandar10)
		Partidos.instance.agregarPartido(partido)
		
		println "Juego de datos generado correctamente"

		}
	

	def destroy = {
	}
}
