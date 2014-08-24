package com.dds.grupo4.ui

import com.dds.grupo4.domain.Nota
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.CheckBox

class EditarNotaWindow extends Dialog<Nota> {

	new(WindowOwner owner, Nota model) {
		super(owner, model)
		this.delegate.setErrorViewer(this)
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)

		new Label(form).text = "Fecha: "
		new TextBox(form).setWidth(100).bindValueToProperty("fecha")

		new Label(form).text = "Descripción: "
		new TextBox(form)
			.setWidth(100)
			.bindValueToProperty("descripcion")

		new Label(form).text = "Aprobado: "
		new CheckBox(form).bindValueToProperty("aprobado")
	}

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



class CrearNotaWindow extends EditarNotaWindow {
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}

//	override def executeTask() {
//		homeCelulares.create(modelObject)
//		super.executeTask()
//	}

}

