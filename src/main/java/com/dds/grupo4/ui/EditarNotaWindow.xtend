package com.dds.grupo4.ui

import com.dds.grupo4.domain.Nota
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import com.dds.grupo4.home.HomeMaterias

class EditarNotaWindow extends Dialog<Nota> {

	new(WindowOwner owner, Nota model) {
		super(owner, model)
		this.delegate.setErrorViewer(this)
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "Fecha: "
		new TextBox(form).bindValueToProperty("fecha")

		new Label(form).text = "Descripción: "
		val txtDescripcion = new TextBox(form)
		txtDescripcion.width = 100
		txtDescripcion.bindValueToProperty("descripcion")

		//this.addFormPanel(form)
	}

	//abstract def void addFormPanel(Panel panel)

	override protected void addActions(Panel actions) {
		new Button(actions)
			.setCaption("Aceptar")
			.onClick [ | this.accept ].setAsDefault.disableOnError

		new Button(actions)
			.setCaption("Cancelar")
			.onClick[|this.cancel]
	}

	/** Importante overridear el accept para que dispare eventos al volver */
	override accept() {
		/** MUY IMPORTANTE, primero hay que actualizar el abonado y luego, hacer super.accept
		 * para que capture los errores y refresque la grilla
		 */
		//agregarNota(this.modelObject)
		super.accept
	}

}


