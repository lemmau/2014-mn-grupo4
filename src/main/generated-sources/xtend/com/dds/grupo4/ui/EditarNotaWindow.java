package com.dds.grupo4.ui;

import com.dds.grupo4.domain.Nota;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.WindowBuilder;

@SuppressWarnings("all")
public abstract class EditarNotaWindow extends Dialog<Nota> {
  public EditarNotaWindow(final WindowOwner owner, final Nota model) {
    super(owner, model);
    WindowBuilder _delegate = this.getDelegate();
    _delegate.setErrorViewer(this);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    final Panel form = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    form.setLayout(_columnLayout);
    Label _label = new Label(form);
    _label.setText("Fecha: ");
    TextBox _textBox = new TextBox(form);
    _textBox.<ControlBuilder>bindValueToProperty("fecha");
    Label _label_1 = new Label(form);
    _label_1.setText("Descripción: ");
    final TextBox txtDescripcion = new TextBox(form);
    txtDescripcion.setWidth(100);
    txtDescripcion.<ControlBuilder>bindValueToProperty("descripcion");
    this.addFormPanel(form);
  }
  
  public abstract void addFormPanel(final Panel panel);
  
  protected void addActions(final Panel actions) {
    Button _button = new Button(actions);
    Button _setCaption = _button.setCaption("Aceptar");
    final Action _function = new Action() {
      public void execute() {
        EditarNotaWindow.this.accept();
      }
    };
    Button _onClick = _setCaption.onClick(_function);
    Button _setAsDefault = _onClick.setAsDefault();
    _setAsDefault.disableOnError();
    Button _button_1 = new Button(actions);
    Button _setCaption_1 = _button_1.setCaption("Cancelar");
    final Action _function_1 = new Action() {
      public void execute() {
        EditarNotaWindow.this.cancel();
      }
    };
    _setCaption_1.onClick(_function_1);
  }
  
  /**
   * Importante overridear el accept para que dispare eventos al volver
   */
  public void accept() {
    super.accept();
  }
}
