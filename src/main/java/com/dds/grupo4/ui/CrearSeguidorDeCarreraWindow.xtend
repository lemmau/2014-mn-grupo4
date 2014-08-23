package com.dds.grupo4.ui

import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel
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
import com.dds.grupo4.domain.Materia

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

		val titulo = new Label(editorPanel).setText("Seguidor De Carrera")
		titulo.setFontSize(25)

		new Label(editorPanel).setText("")

		new Label(editorPanel).setText("Materias")

		val editorPanel2 = new Panel(mainPanel)
		editorPanel2.setLayout(new ColumnLayout(2))

		new List(editorPanel2) => [
			allowNull(false)
			//val binding = bindItemsToProperty("materiasPosibles")
			bindItemsToProperty("materias")
		//			binding.setAdapter(new PropertyAdapter(typeof(ContenidoMaterias), "nombre"))
			bindValueToProperty("materiaSeleccionada")
		]

		new Label(editorPanel).setText("[Nombre de materia aca]")

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

		this.addActions(mainPanel)

		// tabla
		this.createResultsGrid(mainPanel);
		this.createGridActions(mainPanel);
	}

	def protected createResultsGrid(Panel mainPanel) {

		var Table<Nota> tablaNotas = new Table<Nota>(mainPanel, typeof(Nota))
		tablaNotas.bindItemsToProperty("notas")
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
		new Column<Nota>(tableNotas).setTitle("Fecha").setFixedSize(50).bindContentsToProperty("fecha")

		new Column<Nota>(tableNotas).setTitle("Descripcion").setFixedSize(50).bindContentsToProperty("descripcion")

		new Column<Nota>(tableNotas)
				.setTitle("Aprobado")
				.setFixedSize(50)
				.bindContentsToTransformer([ nota | if (nota.aprobado) "SI" else "NO"])
	}

	def createGridActions(Panel mainPanel) {

		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		var edit = new Button(actionsPanel)
						.setCaption("Editar")
						.onClick[|this.openDialog(new EditarNotaWindow(this, new Nota))]

		var add = new Button(actionsPanel).setCaption("+").onClick[| ]

		var remove = new Button(actionsPanel).setCaption("-").onClick[| ]

		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		var elementSelected = new NotNullObservable("notaSeleccionada")
		remove.bindEnabled(elementSelected)
		add.bindEnabled(elementSelected)
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
				.onClick[|this.openDialog(new AgregarNuevaMateriaWindow(this, new Materia))]
	}

	def void agregarNuevaMateria() {
		this.openDialog(new AgregarNuevaMateriaWindow(this, new Materia))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
