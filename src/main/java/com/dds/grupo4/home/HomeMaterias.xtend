package com.dds.grupo4.home

import com.dds.grupo4.domain.Materia

import java.util.ArrayList
import java.util.List

class HomeMaterias {

	List<Materia> materias
	
	private static HomeMaterias instance = null
	
	private new() {
		materias = new ArrayList<Materia>
	}
	
	static def getInstance() {
		if (instance == null) {
			instance = new HomeMaterias
		}
		instance
	}
	
	def doGetMateria(Materia materia) {
		materias.findFirst [ it.nombre.equalsIgnoreCase(materia.nombre)]
	}

	/** Genero una copia del objeto para no actualizar el que referencia el home **/
	def getAbonado(Materia materia) {
		doGetMateria(materia).copy 
	}

	/** Genero una copia de los objetos para no actualizar el que referencia el home **/
//	def List<Abonado> getAbonados(BusquedaAbonados busquedaAbonados) {
//		val copiaDeAbonados = abonados.map [ it.copy ]
//		println("Abonados:" + abonados)
//		println("Copia de abonados: " + copiaDeAbonados)
//		val abonadosFiltrados = copiaDeAbonados.filter [ busquedaAbonados.cumple(it) ]
//		println("Abonados filtrados: " + abonadosFiltrados)
//		abonadosFiltrados.toList
//	}

//	def actualizarAbonado(Abonado abonado) {
//		abonado.validar
//		if (abonado.id == null) {
//			// es un alta
//			abonado.id = abonados.fold(0l, [ max, unAbonado | Math.max(max, unAbonado.id) ]) + 1
//			abonados.add(abonado)
//		} else {
//			// es una modificación
//			var abonadoPosta = doGetAbonado(abonado)
//			abonadoPosta = abonado
//		}
//		println("Ahora abonados tiene:" + abonados)
//	}
	
	def eliminarMateria(Materia materia) {
		materias.remove(doGetMateria(materia))
	}

}
