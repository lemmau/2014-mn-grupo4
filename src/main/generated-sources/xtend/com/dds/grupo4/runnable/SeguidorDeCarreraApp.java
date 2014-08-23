package com.dds.grupo4.runnable;

import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel;
import com.dds.grupo4.domain.Nota;
import com.dds.grupo4.ui.CrearSeguidorDeCarreraWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class SeguidorDeCarreraApp extends Application {
  public Window<?> createMainWindow() {
    CrearSeguidorDeCarreraWindow _xblockexpression = null;
    {
      SeguidorDeCarreraAppModel appModel = new SeguidorDeCarreraAppModel();
      Nota _nota = new Nota("02/05/2014", "TP", Boolean.valueOf(true));
      appModel.agregarNota(_nota);
      Nota _nota_1 = new Nota("12/05/2014", "Parcial 1", Boolean.valueOf(true));
      appModel.agregarNota(_nota_1);
      Nota _nota_2 = new Nota("14/07/2014", "Parcial 2", Boolean.valueOf(true));
      appModel.agregarNota(_nota_2);
      _xblockexpression = new CrearSeguidorDeCarreraWindow(this, appModel);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    SeguidorDeCarreraApp _seguidorDeCarreraApp = new SeguidorDeCarreraApp();
    _seguidorDeCarreraApp.start();
  }
}
