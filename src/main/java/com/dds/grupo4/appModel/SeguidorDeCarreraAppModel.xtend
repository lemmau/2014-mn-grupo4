package com.dds.grupo4.appModel

import com.dds.grupo4.domain.Materia
import com.dds.grupo4.domain.Nota
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import com.dds.grupo4.home.HomeMaterias
import org.uqbar.commons.model.ObservableUtils

@Observable
class SeguidorDeCarreraAppModel {

	@Property List<Materia> materias
	@Property List<Nota> notas
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada

	new() {
		materias = new ArrayList<Materia>
		notas = new ArrayList<Nota>
	}

//	def List<Nota> getNotas() {
//		if (materiaSeleccionada != null)
//			notas = materiaSeleccionada.notas
//
//		notas
//	}


	def agregarMateria(Materia materia) {
		HomeMaterias.getInstance.agregarMateria(materia)
	}

	def agregarNota(Nota nota) {
		if (materiaSeleccionada != null) {
			materiaSeleccionada.agregarNota(nota)
			notas = materiaSeleccionada.notas
			//ObservableUtils.firePropertyChanged(this, "notas", notas)
		}
	}

	def eliminarNota(Nota nota) {
		if (materiaSeleccionada != null)
			materiaSeleccionada.eliminarNota(nota)
	}

	def getTiposDeUbicacion() {
		#["1er Cuatrimestre 1° Nivel", "2do Cuatrimestre 1° Nivel", "..."]
	}

	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void search() {
		// WORKAROUND para que refresque la grilla en las actualizaciones
		//notas = new ArrayList<Nota>
		// FIN WORKAROUND
		//		resultados = getHomeCelulares().search(numero, nombre)
		// también se puede llamar homeCelulares.search(numero, nombre)
		//buscar()
	}

	def void buscar() {
		materias = new ArrayList<Materia>
		notas = new ArrayList<Nota>

		materias = HomeMaterias.instance.materias

		if (materiaSeleccionada == null) {
			materiaSeleccionada=materias.get(materias.size-1)
			notas = materiaSeleccionada.notas
		}
	}

}
