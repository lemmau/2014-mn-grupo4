package com.dds.grupo4.runnable;

import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel;
import com.dds.grupo4.domain.Materia;
import com.dds.grupo4.ui.CrearSeguidorDeCarreraWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class SeguidorDeCarreraApp extends Application {
  public Window<?> createMainWindow() {
    CrearSeguidorDeCarreraWindow _xblockexpression = null;
    {
      SeguidorDeCarreraAppModel appModel = new SeguidorDeCarreraAppModel();
      Materia _materia = new Materia("Ingenieria y Soc.", "1er nivel", Integer.valueOf(2010), "Nuñez", Boolean.valueOf(true));
      appModel.agregarMateria(_materia);
      Materia _materia_1 = new Materia("In y Soc.", "1er nivel", Integer.valueOf(2010), "Nuñez", Boolean.valueOf(true));
      appModel.agregarMateria(_materia_1);
      Materia _materia_2 = new Materia("ieria y Soc.", "1er nivel", Integer.valueOf(2010), "Nuñez", Boolean.valueOf(true));
      appModel.agregarMateria(_materia_2);
      _xblockexpression = new CrearSeguidorDeCarreraWindow(this, appModel);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    SeguidorDeCarreraApp _seguidorDeCarreraApp = new SeguidorDeCarreraApp();
    _seguidorDeCarreraApp.start();
  }
}
