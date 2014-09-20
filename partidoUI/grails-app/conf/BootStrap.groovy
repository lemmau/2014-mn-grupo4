import com.dds.grupo4.dominio.Admin
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.tipoDeInscripcion.Estandar
import org.joda.time.LocalDate
import com.dds.grupo4.home.Partidos

class BootStrap {

	def init = { servletContext ->
				
		println "Generamos juego de datos de partidos"
		
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
		
		partido = new Partido(new Admin("MarioNeta@gmail.com"))
		partido.setFechaInicio(new LocalDate(2014, 06, 12))
		
		jugadorEstandar0 = new Jugador("Aquiles", "Brinco", new LocalDate(1979, 12, 14), new Estandar(), 10)
		jugadorEstandar1 = new Jugador("Armando", "Casas", new LocalDate(1979, 12, 14), new Estandar(), 1)
		jugadorEstandar2 = new Jugador("Débora", "Melo", new LocalDate(1979, 12, 14), new Estandar(), 2)
		jugadorEstandar3 = new Jugador("Elsa", "Pato", new LocalDate(1979, 12, 14), new Estandar(), 3)
		jugadorEstandar4 = new Jugador("Marcia", "Ana", new LocalDate(1979, 12, 14), new Estandar(), 4)
		jugadorEstandar5 = new Jugador("Rosamel", "Fierro", new LocalDate(1979, 12, 14), new Estandar(), 5)
		jugadorEstandar6 = new Jugador("Susana", "Oria", new LocalDate(1979, 12, 14), new Estandar(), 6)
		jugadorEstandar7 = new Jugador("Keca", "Galindo", new LocalDate(1979, 12, 14), new Estandar(), 7)
		jugadorEstandar8 = new Jugador("Elvis", "Tek", new LocalDate(1979, 12, 14), new Estandar(), 8)
		jugadorEstandar9 = new Jugador("Aquiles", "Bailo", new LocalDate(1979, 12, 14), new Estandar(), 9)
		jugadorEstandar10 = new Jugador("Elsa", "Pallo",new LocalDate(1979, 12, 15), new Estandar(), 9)
		
		jugadores = [jugadorEstandar0, jugadorEstandar1, jugadorEstandar2, jugadorEstandar3, jugadorEstandar4
			, jugadorEstandar5, jugadorEstandar6, jugadorEstandar7, jugadorEstandar8, jugadorEstandar9]
	 
		partido.inscribirTodos(jugadores)
		
		Partidos.instance.agregarPartido(partido)

		}

	def destroy = {
	}
}
