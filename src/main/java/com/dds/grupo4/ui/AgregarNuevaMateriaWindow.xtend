package com.dds.grupo4.ui

import com.dds.grupo4.domain.Materia
import com.dds.grupo4.home.HomeMaterias

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class AgregarNuevaMateriaWindow extends Dialog<Materia> {

	new(WindowOwner owner) {
		super(owner, new Materia)
		this.delegate.setErrorViewer(this)
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)

		new Label(form).text = "Nombre: "

		val txtDescripcion = new TextBox(form)
		txtDescripcion.width = 100
		txtDescripcion.bindValueToProperty("nombre")

	//this.addFormPanel(form)
	}

	override protected void addActions(Panel actions) {
		new Button(actions)
			.setCaption("Aceptar")
			.onClick[|this.accept].setAsDefault.disableOnError

		new Button(actions)
			.setCaption("Cancelar")
			.onClick[|this.cancel]
	}

	/** Importante overridear el accept para que dispare eventos al volver */
	override accept() {

		/** MUY IMPORTANTE, primero hay que actualizar el abonado y luego, hacer super.accept
		 * para que capture los errores y refresque la grilla
		 */
		//HomeMaterias.instance.agregarMateria(this.modelObject)
		homeMaterias.agregarMateria(this.modelObject)
		super.accept
	}

	def getHomeMaterias() {
		HomeMaterias.instance
	}

}
