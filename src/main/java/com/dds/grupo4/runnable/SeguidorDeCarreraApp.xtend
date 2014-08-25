package com.dds.grupo4.runnable

import org.uqbar.arena.Application
import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel
import com.dds.grupo4.ui.SeguidorDeCarreraWindow

class SeguidorDeCarreraApp extends Application {
	
	override createMainWindow(){
		var appModel = new SeguidorDeCarreraAppModel
		new SeguidorDeCarreraWindow(this, appModel)
	}
		
	def static main(String[] args) {
		new SeguidorDeCarreraApp().start
	}
}
