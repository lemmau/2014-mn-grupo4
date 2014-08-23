package com.dds.grupo4.ui;

import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel;
import com.dds.grupo4.domain.Nota;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.NotNullObservable;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.Observable;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@Observable
@SuppressWarnings("all")
public class CrearSeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarreraAppModel> {
  public CrearSeguidorDeCarreraWindow(final WindowOwner owner, final SeguidorDeCarreraAppModel appModel) {
    super(owner, appModel);
    this.setTitle("Seguidor de carrera");
    this.setTaskDescription("Complete el avance de su carrera");
  }
  
  public void createFormPanel(final Panel mainPanel) {
    final Panel editorPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(1);
    editorPanel.setLayout(_columnLayout);
    Label _label = new Label(editorPanel);
    _label.setText("Seguidor De Carrera");
    final Panel editorPanel2 = new Panel(mainPanel);
    ColumnLayout _columnLayout_1 = new ColumnLayout(2);
    editorPanel2.setLayout(_columnLayout_1);
    List<Object> _list = new List<Object>(editorPanel2);
    final Procedure1<List<Object>> _function = new Procedure1<List<Object>>() {
      public void apply(final List<Object> it) {
        it.allowNull(false);
        final Binding<ListBuilder<Object>> binding = it.bindItemsToProperty("materiasPosibles");
      }
    };
    ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function);
    Label _label_1 = new Label(editorPanel2);
    _label_1.setText("[Nombre de materia aca]");
    Label _label_2 = new Label(editorPanel2);
    _label_2.setText("Año cursada:");
    final TextBox textBoxAnio = new TextBox(editorPanel2);
    textBoxAnio.setWidth(25);
    final CheckBox checkFinalAprobado = new CheckBox(editorPanel2);
    Label _label_3 = new Label(editorPanel2);
    _label_3.setText("Final Aprobado");
    Label _label_4 = new Label(editorPanel);
    _label_4.setText("Ubicacion Materia");
    Selector<Object> _selector = new Selector<Object>(editorPanel2);
    final Procedure1<Selector<Object>> _function_1 = new Procedure1<Selector<Object>>() {
      public void apply(final Selector<Object> it) {
        it.allowNull(false);
        it.bindItemsToProperty("tiposDeUbicacion");
      }
    };
    ObjectExtensions.<Selector<Object>>operator_doubleArrow(_selector, _function_1);
    this.addActions(mainPanel);
    this.createResultsGrid(mainPanel);
    this.createGridActions(mainPanel);
  }
  
  protected void createResultsGrid(final Panel mainPanel) {
    Table<Nota> tablaNotas = new Table<Nota>(mainPanel, Nota.class);
    tablaNotas.bindItemsToProperty("notas");
    tablaNotas.<ControlBuilder>bindValueToProperty("notaSeleccionada");
    tablaNotas.setHeigth(200);
    tablaNotas.setWidth(450);
    this.describeResultsGrid(tablaNotas);
  }
  
  /**
   * Define las columnas de la grilla
   * Cada columna se puede bindear
   * 1) contra una propiedad del model
   * 2) contra un transformer que recibe el model y devuelve un tipo
   * (generalmente String)
   */
  public void describeResultsGrid(final Table<Nota> tableNotas) {
    Column<Nota> _column = new Column<Nota>(tableNotas);
    Column<Nota> _setTitle = _column.setTitle("Fecha");
    Column<Nota> _setFixedSize = _setTitle.setFixedSize(50);
    _setFixedSize.bindContentsToProperty("fecha");
    Column<Nota> _column_1 = new Column<Nota>(tableNotas);
    Column<Nota> _setTitle_1 = _column_1.setTitle("Descripcion");
    Column<Nota> _setFixedSize_1 = _setTitle_1.setFixedSize(50);
    _setFixedSize_1.bindContentsToProperty("descripcion");
  }
  
  public Binding<ControlBuilder> createGridActions(final Panel mainPanel) {
    Binding<ControlBuilder> _xblockexpression = null;
    {
      Panel actionsPanel = new Panel(mainPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      actionsPanel.setLayout(_horizontalLayout);
      Button _button = new Button(actionsPanel);
      Button edit = _button.setCaption("Editar");
      Button _button_1 = new Button(actionsPanel);
      Button _setCaption = _button_1.setCaption("+");
      final Action _function = new Action() {
        public void execute() {
        }
      };
      Button add = _setCaption.onClick(_function);
      Button _button_2 = new Button(actionsPanel);
      Button _setCaption_1 = _button_2.setCaption("-");
      final Action _function_1 = new Action() {
        public void execute() {
        }
      };
      Button remove = _setCaption_1.onClick(_function_1);
      NotNullObservable elementSelected = new NotNullObservable("notaSeleccionada");
      remove.<ControlBuilder>bindEnabled(elementSelected);
      add.<ControlBuilder>bindEnabled(elementSelected);
      _xblockexpression = edit.<ControlBuilder>bindEnabled(elementSelected);
    }
    return _xblockexpression;
  }
  
  protected void addActions(final Panel mainPanel) {
    Panel actionsPanel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    actionsPanel.setLayout(_horizontalLayout);
    Button _button = new Button(actionsPanel);
    _button.setCaption("Nueva Materia");
  }
  
  public void agregarNuevaMateria() {
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = new Action() {
      public void execute() {
        SeguidorDeCarreraAppModel _modelObject = CrearSeguidorDeCarreraWindow.this.getModelObject();
        _modelObject.search();
      }
    };
    dialog.onAccept(_function);
    dialog.open();
  }
}
