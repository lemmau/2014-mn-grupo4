package com.dds.grupo4.appModel

import java.util.List
import java.util.ArrayList

import com.dds.grupo4.domain.Materia
import com.dds.grupo4.home.HomeMaterias

//import java.util.Date
import java.util.Calendar

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class SeguidorDeCarreraAppModel {

//	Calendar c = Calendar.getInstance();
//	val anioActual = Integer.toString(c.get(Calendar.YEAR));
	
	List<Materia> materias
	//@Property Materia materiaSeleccionada
	
	new() {
		materias = new ArrayList<Materia>	
	}
		 
	 def List<Materia> getMaterias(){
	 	materias
	 }
	 
	 def agregarMateria(Materia materia){
	 	materias.add(materia)
	 }
	
	def getMateriasPosibles() {
		#[ "Matematica Discreta", "Ingenieria y Sociedad", "Sistemas y Organizaciones", "Algoritmos y Estructura de Datos", "Ingles I"	]
	}

//	def getMateriasPosibles() {
//		#[	new MatematicaDiscreta, 
//			new Algoritmos, 
//			new Ingenieria y Sociedad, 
//		]
	
	def getTiposDeUbicacion() {
	#["1er Cuatrimestre 1° Nivel", "2do Cuatrimestre 1° Nivel", "..."]
	}
	
}