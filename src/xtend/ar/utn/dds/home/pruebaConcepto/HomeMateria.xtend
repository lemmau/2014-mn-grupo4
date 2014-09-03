package ar.utn.dds.home.pruebaConcepto

import java.util.List
import java.util.ArrayList
import ar.utn.dds.pruebaConcepto.Materia

class HomeMateria {

	List<Materia> materias

	/** singleton **/
	static HomeMateria instance

	private new() {
		materias = new ArrayList<Materia>
	}

	static def getInstance() {
		if (instance == null) {
			instance = new HomeMateria()
		}
		instance
	}

	/** fin singleton **/
	def agregarMateria(Materia materia) {
		materia.id = new Long(this.ultimoIdUtilizado.longValue + 1)
		materias.add(materia)
	}

	def int getUltimoIdUtilizado() {
		if (materias.isEmpty) {
			return 1
		}
	
		return materias.sortBy[-it.id].toList.get(0).id.intValue
	}

	def getMaterias(Materia materia) {
		materias.filter [ m |
			m.nombre.toLowerCase.startsWith(materia.nombre.toLowerCase, 0) &&
				m.profesor.toLowerCase.startsWith(materia.profesor.toLowerCase)]
	}

	def getMateria(Long id) {
		materias.findFirst[materia|materia.id.equals(id)]
	}
	
	def actualizarMateria(Materia materiaActualizada) {
		materiaActualizada.validar
		if (materiaActualizada.id == null) {
			this.agregarMateria(materiaActualizada)
		} else {
			this.doActualizarMateria(materiaActualizada)
		}
	}
	
	def doActualizarMateria(Materia materiaActualizada) {
		val unaMateria = this.getMateria(materiaActualizada.id).copy
		unaMateria.actualizarCon(materiaActualizada)
	}

}
