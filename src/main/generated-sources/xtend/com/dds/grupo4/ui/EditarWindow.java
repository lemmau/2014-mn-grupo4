package com.dds.grupo4.ui;

import com.dds.grupo4.domain.Nota;
import com.dds.grupo4.ui.EditarNotaWindow;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class EditarWindow extends EditarNotaWindow {
  public EditarWindow(final WindowOwner owner, final Nota model) {
    super(owner, model);
    this.setTitle("Editar Nota");
  }
  
  public void addFormPanel(final Panel panel) {
  }
}
