package com.dds.grupo4.runnable

import org.uqbar.arena.Application
import com.dds.grupo4.ui.CrearSeguidorDeCarreraWindow
import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel
import com.dds.grupo4.domain.Materia

class SeguidorDeCarreraApp extends Application {
	
	override createMainWindow(){
		var appModel = new SeguidorDeCarreraAppModel
		appModel.agregarMateria(new Materia("Ingenieria y Soc.","1er nivel",2010,"Nuñez",true))
		appModel.agregarMateria(new Materia("In y Soc.","1er nivel",2010,"Nuñez",true))
		appModel.agregarMateria(new Materia("ieria y Soc.","1er nivel",2010,"Nuñez",true))
		
		new CrearSeguidorDeCarreraWindow(this, appModel)
	}
		
	def static main(String[] args) {
		new SeguidorDeCarreraApp().start
	}
}
