package com.dds.grupo4.runnable

import org.uqbar.arena.Application
import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel
import com.dds.grupo4.domain.Nota
import com.dds.grupo4.ui.SeguidorDeCarreraWindow

class SeguidorDeCarreraApp extends Application {
	
	override createMainWindow(){
		var appModel = new SeguidorDeCarreraAppModel
		appModel.agregarNota(new Nota("02/05/2014","TP",true))
		appModel.agregarNota(new Nota("12/05/2014","Parcial 1",true))
		appModel.agregarNota(new Nota("14/07/2014","Parcial 2",true))
		
		new SeguidorDeCarreraWindow(this, appModel)
	}
		
	def static main(String[] args) {
		new SeguidorDeCarreraApp().start
	}
}
