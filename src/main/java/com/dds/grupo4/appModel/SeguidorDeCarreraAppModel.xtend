package com.dds.grupo4.appModel

import java.util.List
import java.util.ArrayList

import com.dds.grupo4.domain.Materia
import com.dds.grupo4.domain.Nota
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
	List<Nota> notas
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	new() {
		materias = new ArrayList<Materia>
		notas = new ArrayList<Nota>	
	}
		 
	 def List<Materia> getMaterias(){
	 	materias
	 }
	 
	 def List<Nota> getNotas(){
	 	notas
	 }	 
	 
	 def agregarMateria(Materia materia){
	 	materias.add(materia)
	 }
	 
	 def agregarNota(Nota nota){
	 	notas.add(nota)
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
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void search() { 
		// WORKAROUND para que refresque la grilla en las actualizaciones
		notas = new ArrayList<Nota>

		// FIN WORKAROUND
//		resultados = getHomeCelulares().search(numero, nombre)
		// también se puede llamar homeCelulares.search(numero, nombre) 
	}


	
}