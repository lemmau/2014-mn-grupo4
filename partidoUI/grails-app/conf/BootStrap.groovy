import com.dds.grupo4.dominio.Admin
import com.dds.grupo4.dominio.Jugador
import com.dds.grupo4.dominio.Partido
import com.dds.grupo4.tipoDeInscripcion.Estandar

import org.joda.time.DateTime

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
		partido.setNombre("River - Boca")
		partido.fechaInicio = DateTime.now().plusDays(5)
		
		jugadorEstandar0 = new Jugador("Alan", "Mulder", "Al" , new DateTime(1985, 12, 14,0,0), new Estandar(), 10)
		jugadorEstandar1 = new Jugador("Brian", "Sarto", "Brayus", new DateTime(1979, 12, 14,0,0), new Estandar(), 1)
		jugadorEstandar2 = new Jugador("Cristian", "Mulder","Cris", new DateTime(1991, 12, 14,0,0), new Estandar(), 2)
		jugadorEstandar3 = new Jugador("Daniel", "Mulderist","Dani", new DateTime(1962, 12, 14,0,0), new Estandar(), 3)
		jugadorEstandar4 = new Jugador("Ezequiel", "Mente", "Equi", new DateTime(1940, 12, 14,0,0), new Estandar(), 4)
		jugadorEstandar5 = new Jugador("Francisco", "Mulder","Pancho", new DateTime(1999, 12, 14,0,0), new Estandar(), 5)
		jugadorEstandar6 = new Jugador("Gonzalo", "Mur", "Ganzo", new DateTime(1968, 12, 14,0,0), new Estandar(), 6)
		jugadorEstandar7 = new Jugador("Ivan", "Muler", "Ivo",new DateTime(1910, 12, 14,0,0), new Estandar(), 7)
		jugadorEstandar8 = new Jugador("Joaquin", "Restia", "Joaco", new DateTime(1979, 12, 14,0,0), new Estandar(), 8)
		jugadorEstandar9 = new Jugador("Kevin", "Noir", "Tito", new DateTime(1945, 12, 14,0,0), new Estandar(), 9)
		jugadorEstandar10 = new Jugador("Luis", "Mulder", "Lucho",new DateTime(1918, 12, 15,0,0), new Estandar(), 9)
		
		jugadorEstandar4.agregarInfraccion("Mal jugador")
		jugadorEstandar4.agregarInfraccion("Incompetente")
		jugadorEstandar4.agregarInfraccion("Agresivo")
		jugadorEstandar4.agregarInfraccion("Quiebre de mano")
		jugadorEstandar4.agregarInfraccion("Zapato roto")
		jugadorEstandar4.agregarInfraccion("No se baña")
		jugadorEstandar4.agregarInfraccion("Mal jugador")
		jugadorEstandar4.agregarInfraccion("Incompetente")
		jugadorEstandar6.agregarInfraccion("Agresivo")
		jugadorEstandar5.agregarInfraccion("Quiebre de mano")
		jugadorEstandar3.agregarInfraccion("Zapato roto")
		jugadorEstandar3.agregarInfraccion("No se baña")
		jugadorEstandar3.agregarInfraccion("Mal jugador")
		jugadorEstandar2.agregarInfraccion("Incompetente")
		jugadorEstandar1.agregarInfraccion("Agresivo")
		jugadorEstandar1.agregarInfraccion("Quiebre de mano")
		jugadorEstandar1.agregarInfraccion("Zapato roto")
		jugadorEstandar7.agregarInfraccion("No se baña")
		jugadorEstandar8.agregarInfraccion("Mal jugador")
		jugadorEstandar8.agregarInfraccion("Incompetente")
		jugadorEstandar8.agregarInfraccion("Agresivo")
		jugadorEstandar7.agregarInfraccion("Quiebre de mano")
		jugadorEstandar7.agregarInfraccion("Zapato roto")
		jugadorEstandar8.agregarInfraccion("No se baña")
		
		
		
		
		
		
		jugadores = [jugadorEstandar0, jugadorEstandar1, jugadorEstandar2, jugadorEstandar3, jugadorEstandar4
			, jugadorEstandar5, jugadorEstandar6, jugadorEstandar7, jugadorEstandar8, jugadorEstandar9]
	 
		partido.inscribirTodos(jugadores)
		
		partido.calificarA(jugadorEstandar0, 1, "a")
		partido.calificarA(jugadorEstandar1, 9, "a")
		partido.calificarA(jugadorEstandar2, 1, "a")
		partido.calificarA(jugadorEstandar3, 1, "a")
		partido.calificarA(jugadorEstandar4, 1, "a")
		partido.calificarA(jugadorEstandar5, 5, "a")
		partido.calificarA(jugadorEstandar6, 4, "a")
		partido.calificarA(jugadorEstandar7, 1, "a")
		partido.calificarA(jugadorEstandar8, 2, "a")
		partido.calificarA(jugadorEstandar9, 10, "a")

		
		jugadorEstandar0.agregarAmigo(jugadorEstandar1)
		jugadorEstandar0.agregarAmigo(jugadorEstandar2)
		jugadorEstandar0.agregarAmigo(jugadorEstandar3)
		jugadorEstandar1.agregarAmigo(jugadorEstandar7)
		jugadorEstandar1.agregarAmigo(jugadorEstandar2)
		jugadorEstandar1.agregarAmigo(jugadorEstandar6)
		jugadorEstandar1.agregarAmigo(jugadorEstandar8)
		jugadorEstandar1.agregarAmigo(jugadorEstandar9)
		jugadorEstandar2.agregarAmigo(jugadorEstandar9)
		jugadorEstandar3.agregarAmigo(jugadorEstandar5)
		jugadorEstandar4.agregarAmigo(jugadorEstandar2)
		jugadorEstandar5.agregarAmigo(jugadorEstandar9)
		jugadorEstandar5.agregarAmigo(jugadorEstandar4)
		jugadorEstandar6.agregarAmigo(jugadorEstandar3)
		jugadorEstandar7.agregarAmigo(jugadorEstandar4)
		jugadorEstandar8.agregarAmigo(jugadorEstandar1)
		jugadorEstandar9.agregarAmigo(jugadorEstandar4)
		jugadorEstandar10.agregarAmigo(jugadorEstandar9)
		
		
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
