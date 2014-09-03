import ar.utn.dds.home.pruebaConcepto.HomeMateria;
import ar.utn.dds.pruebaConcepto.Materia
import ar.utn.dds.pruebaConcepto.Nota

class BootStrap {

	def init = { servletContext ->
		println "Generamos juego de datos de materias"
		// Genero el juego de datos
		HomeMateria.instance.agregarMateria(new Materia("Algoritmos","", Integer.valueOf(2013), "Bruno", false))

	}

	def destroy = {
	}
}
