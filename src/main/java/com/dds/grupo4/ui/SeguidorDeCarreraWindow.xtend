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
import com.dds.grupo4.home.HomeMaterias
import org.uqbar.arena.bindings.ObservableProperty

@Observable
class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarreraAppModel> {

	new(WindowOwner owner, SeguidorDeCarreraAppModel appModel) {
		super(owner, appModel)
		modelObject.buscar()
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de carrera"
		taskDescription = "Complete el avance de su carrera"
		mainPanel.setWidth(1024)

		super.createMainTemplate(mainPanel)

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

		new Label(panelIzq).setText("Materias")

		new List(panelIzq) => [
			allowNull(false)
			setHeigth(400)
			bindItems(new ObservableProperty(modelObject, "materias"))
			bindValueToProperty("materiaSeleccionada")
		]

		new Label(panelDer).setWidth(200).bindValueToProperty("materiaSeleccionada")

		val subPanelDer = new Panel(panelDer)
		subPanelDer.setLayout(new ColumnLayout(2))

		new Label(subPanelDer).setText("Año cursada:")
		new TextBox(subPanelDer).setWidth(50)
			.bindValueToProperty("materiaSeleccionada.anioCursada")

		new Label(subPanelDer).setText("Final Aprobado")
		new CheckBox(subPanelDer).bindValueToProperty("materiaSeleccionada.finalAprobado")

		new Label(subPanelDer).setText("Ubicacion Materia")
		new Selector(subPanelDer) => [
			allowNull = false
			bindItemsToProperty("tiposDeUbicacion")
		//			bindValueToProperty("ubicacion")
		//			bindValue(new ObservableProperty(this.modelObject, "ubicacion"))
		]

		this.createResultsGrid(panelDer)
		this.createGridActions(panelDer)
	}

	def protected createResultsGrid(Panel mainPanel) {

		var Table<Nota> tablaNotas = new Table<Nota>(mainPanel, typeof(Nota))
		var elementSelected = new NotNullObservable("materiaSeleccionada")
		tablaNotas.bindEnabled(elementSelected)

		//tablaNotas.bindItemsToProperty("materiaSeleccionada.notas")
		tablaNotas.bindItems(new ObservableProperty(modelObject, "materiaSeleccionada.notas"))
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

		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		var elementSelected = new NotNullObservable("notaSeleccionada")

		new Button(actionsPanel)
				.setCaption("Editar")
				.onClick[|this.openDialog(new EditarNotaWindow(this, modelObject.notaSeleccionada))]
				.bindEnabled(elementSelected)

		new Button(actionsPanel)
				.setCaption("+")
				//.onClick[|this.openDialog(new EditarNotaWindow(this, new Nota))]
				.onClick[|this.agregarNuevaNota]
				.setWidth(50)
				//.bindEnabled(elementSelected)

		new Button(actionsPanel)
				.setCaption("-")
				.onClick[| modelObject.eliminarNota(modelObject.notaSeleccionada) ]
				.setWidth(50)
				.bindEnabled(elementSelected)

	}

	// ********************************************************
	// ** Acciones asociadas a la pantalla principal
	// ********************************************************
	override protected addActions(Panel mainPanel) {

		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		new Button(actionsPanel) //
			.setCaption("Nueva Materia")
			.onClick [ | this.agregarNuevaMateria ]
	}

	def void agregarNuevaMateria() {
		this.openDialog(new AgregarNuevaMateriaWindow(this))
	}

	def void agregarNuevaNota() {
		val nuevaNota = new Nota
		val dialog = new EditarNotaWindow(this, nuevaNota)
		dialog.onAccept(|modelObject.agregarNota(nuevaNota))
		dialog.open
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.buscar]
		dialog.open
	}
	
	def getHomeMaterias() {
		HomeMaterias.instance
	}

}
