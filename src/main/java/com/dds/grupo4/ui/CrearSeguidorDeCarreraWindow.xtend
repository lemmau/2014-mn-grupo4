package com.dds.grupo4.ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.bindings.ObservableProperty

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

import org.uqbar.arena.windows.ErrorsPanel

import org.uqbar.arena.windows.Dialog

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.Observable

import com.dds.grupo4.domain.Nota
import com.dds.grupo4.domain.Materia
import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel
import com.dds.grupo4.domain.ContenidoMaterias

@Observable
class CrearSeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarreraAppModel> {

	new(WindowOwner owner, SeguidorDeCarreraAppModel appModel) {
		super(owner, appModel)
		title = "Seguidor de carrera"
		taskDescription = "Complete el avance de su carrera"
	}
	
	override createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.setLayout(new ColumnLayout(1))

		new Label(editorPanel).setText("Seguidor De Carrera")
		
		val editorPanel2 = new Panel(mainPanel)
		editorPanel2.setLayout(new ColumnLayout(2))
		
		new List(editorPanel2) => [
			allowNull(false)
			val binding = bindItemsToProperty("materiasPosibles")
//			binding.setAdapter(new PropertyAdapter(typeof(ContenidoMaterias), "nombre"))
//			bindValueToProperty("contenidomaterias")
		]
		
		new Label(editorPanel2).setText("[Nombre de materia aca]")
		
		new Label(editorPanel2).setText("Año cursada:")

		val textBoxAnio = new TextBox(editorPanel2)
		textBoxAnio.width = 25
//		val binding = textBoxAnio.bindValueToProperty("anioCursada")
//		binding.setTransformer(new DateAdapter)

		val checkFinalAprobado = new CheckBox(editorPanel2)
//		checkFinalAprobado.bindValueToProperty("")

		new Label(editorPanel2).setText("Final Aprobado")
	
		new Label(editorPanel).setText("Ubicacion Materia")
		new Selector(editorPanel2) => [
			allowNull = false
			bindItemsToProperty("tiposDeUbicacion")
//			bindValueToProperty("ubicacion")
//			bindValue(new ObservableProperty(this.modelObject, "ubicacion"))
		]

	// ********************************************************
	// ** TABLA
	// ********************************************************
		
		var tablaMaterias = new Table<Materia>(mainPanel, typeof(Materia))
		tablaMaterias.bindItemsToProperty("materias")
		tablaMaterias.setHeigth(200)

		new Column<Materia>(tablaMaterias)
			.setTitle("nombre")
			.setFixedSize(50)
			.bindContentsToProperty("nombre")

		new Column<Materia>(tablaMaterias)
			.setTitle("profesor")
			.setFixedSize(50)
			.bindContentsToProperty("profesor")
	}
		
	def void createGridActions(Panel mainPanel) {
		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		var edit = new Button(actionsPanel)
			.setCaption("Editar")
			.onClick [ | ]

		var add = new Button(actionsPanel)
			.setCaption("+")
			.onClick [ | ]

		var remove = new Button(actionsPanel)
			.setCaption("-")
			.onClick [ | ]
 
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
//		var elementSelected = new NotNullObservable("celularSeleccionado")
//		remove.bindEnabled(elementSelected)
//		add.bindEnabled(elementSelected)
//		edit.bindEnabled(elementSelected)
	}
	
//	/**
//	 * Define las columnas de la grilla 
//	 * Cada columna se puede bindear 
//	 * 1) contra una propiedad del model
//	 * 2) contra un transformer que recibe el model y devuelve un tipo
//	 * (generalmente String)
//	 **/
//	def void describeResultsGrid(Table<Materia> table) {
//		new Column<Materia>(table)
//			.setTitle("Fecha")
//			.setFixedSize(50)
//			.bindContentsToProperty("nombre")
//
//		new Column<Materia>(table) //
//			.setTitle("Descripcion")
//			.setFixedSize(50)
//			.bindContentsToProperty("profesor")
//
////		new Column<Materia>(table)
////			.setTitle("Aprobado")
////			.setFixedSize(50)
//// TODO VER proyecto de celulares-ui-arena PARA TOCAR ACA !!
////			.bindContentsToTransformer([celular | if (celular.recibeResumenCuenta) "SI" else "NO"])
//	}
//	
//	def protected createResultsGrid(Panel mainPanel) {
//	
//		var Table<Materia> tablaMaterias = new Table<Materia>(mainPanel, typeof(Materia))
//		tablaMaterias.bindItemsToProperty("materias")
////		tableMaterias.bindValueToProperty("")
//		tablaMaterias.setHeigth(200)
//		tablaMaterias.setWidth(450)
//		this.describeResultsGrid(tablaMaterias)
//	}

	// ********************************************************
	// ** Acciones
	// ********************************************************
	override addActions(Panel actionsPanel) {

//	new Button(actionsPanel) => [
//			caption = "Nueva Materia"
//		//	onClick [ | this.modelObject.AgregarNuevaMateria ]
////		onClick [ | this.openDialog(new AgregarNuevaMateriaWindow(this, new Materia)) ]
//		]
//
//	new Button(actionsPanel) => [
//			caption = "Editar"
//		]
//
//	new Button(actionsPanel) => [
//			caption = "+"
//		]
//
//	new Button(actionsPanel) => [
//			caption = "-"
//		]
	}
	
	
}