package com.dds.grupo4.ui

import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel
import com.dds.grupo4.domain.Materia
import com.dds.grupo4.domain.Nota
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.Observable
import com.dds.grupo4.home.HomeMaterias
import org.uqbar.arena.bindings.ObservableProperty

@Observable
class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarreraAppModel> {

	new(WindowOwner owner, SeguidorDeCarreraAppModel appModel) {
		super(owner, appModel)
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de carrera"
		taskDescription = "Complete el avance de su carrera"
		mainPanel.setWidth(1024)

		super.createMainTemplate(mainPanel)

		this.createResultsGrid(mainPanel)
		this.createGridActions(mainPanel)
	}


	override createFormPanel(Panel mainPanel) {

		val panelPrincipal = new Panel(mainPanel)
		panelPrincipal.setLayout(new ColumnLayout(1))
		panelPrincipal.setWidth(800)
		
		val titulo = new Label(panelPrincipal).setText("Seguidor De Carrera")
		titulo.setFontSize(20)

		val subPanel = new Panel(panelPrincipal)
		subPanel.setLayout(new ColumnLayout(2))

		val panelIzq = new Panel(subPanel)
		val panelDer = new Panel(subPanel)
		panelDer.setLayout(new ColumnLayout(2))

		new Label(panelIzq).setText("Materias")

		new List(panelIzq) => [
			allowNull(false)
			//val binding = bindItemsToProperty("materiasPosibles")
			//bindItemsToProperty("materias")
			//binding.setAdapter(new PropertyAdapter(typeof(ContenidoMaterias), "nombre"))
			bindItems(new ObservableProperty(homeMaterias, "materias"))
			bindValueToProperty("materiaSeleccionada")
		]

		new TextBox(panelDer).setWidth(200).bindValueToProperty("materiaSeleccionada")
		new Label(panelDer).setText("")

		new Label(panelDer).setText("Año cursada:")

		new TextBox(panelDer).setWidth(50)
			.bindValueToProperty("materiaSeleccionada.anioCursada")

		new Label(panelDer).setText("Final Aprobado")
		new CheckBox(panelDer).bindValueToProperty("materiaSeleccionada.finalAprobado")

		new Label(panelDer).setText("Ubicacion Materia")
		new Selector(panelDer) => [
			allowNull = false
			bindItemsToProperty("tiposDeUbicacion")
		//			bindValueToProperty("ubicacion")
		//			bindValue(new ObservableProperty(this.modelObject, "ubicacion"))
		]

	}

	def protected createResultsGrid(Panel mainPanel) {

		var Table<Nota> tablaNotas = new Table<Nota>(mainPanel, typeof(Nota))
		var elementSelected = new NotNullObservable("materiaSeleccionada")
		tablaNotas.bindEnabled(elementSelected)

		tablaNotas.bindItemsToProperty("materiaSeleccionada.notas")
		tablaNotas.bindValueToProperty("notaSeleccionada")
		tablaNotas.setHeigth(200)
		tablaNotas.setWidth(450)

		this.describeResultsGrid(tablaNotas)
	}

	/**
	 * Define las columnas de la grilla 
	 * Cada columna se puede bindear 
	 * 1) contra una propiedad del model
	 * 2) contra un transformer que recibe el model y devuelve un tipo
	 * (generalmente String)
	 **/
	def void describeResultsGrid(Table<Nota> tableNotas) {
		new Column<Nota>(tableNotas)
			.setTitle("Fecha")
			.setFixedSize(150)
			.bindContentsToProperty("fecha")

		new Column<Nota>(tableNotas)
			.setTitle("Descripcion")
			.setFixedSize(150)
			.bindContentsToProperty("descripcion")

		new Column<Nota>(tableNotas)
			.setTitle("Aprobado")
			.setFixedSize(50).
			bindContentsToTransformer([nota|if(nota.aprobado) "SI" else "NO"])
	}

	def createGridActions(Panel mainPanel) {

		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		var edit = new Button(actionsPanel)
				.setCaption("Editar")
				.onClick[|this.openDialog(new EditarNotaWindow(this, modelObject.notaSeleccionada))]

		new Button(actionsPanel)
				.setCaption("+")
				.onClick[|this.openDialog(new EditarNotaWindow(this, new Nota))]

		var remove = new Button(actionsPanel)
				.setCaption("-")
				.onClick[| ]

		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		var elementSelected = new NotNullObservable("notaSeleccionada")
		remove.bindEnabled(elementSelected)
		//add.bindEnabled(elementSelected)
		edit.bindEnabled(elementSelected)
	}

	// ********************************************************
	// ** Acciones
	// ********************************************************
	override protected addActions(Panel mainPanel) {

		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		new Button(actionsPanel).setCaption("Nueva Materia")
//				.onClick [ | this.modelObject.AgregarNuevaMateria ]
		.onClick[|this.agregarNuevaMateria]
	}

	def void agregarNuevaMateria() {
		this.openDialog(new AgregarNuevaMateriaWindow(this, new Materia))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.buscar]
		dialog.open
	}
	
	def getHomeMaterias() {
		HomeMaterias.instance
	}

}
