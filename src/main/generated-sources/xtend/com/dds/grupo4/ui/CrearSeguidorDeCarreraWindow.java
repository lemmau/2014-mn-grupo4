package com.dds.grupo4.ui;

import com.dds.grupo4.appModel.SeguidorDeCarreraAppModel;
import com.dds.grupo4.domain.Materia;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
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
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.Observable;
import org.uqbar.lacar.ui.model.Action;
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
    Table<Materia> tablaMaterias = new Table<Materia>(mainPanel, Materia.class);
    tablaMaterias.bindItemsToProperty("materias");
    tablaMaterias.setHeigth(200);
    Column<Materia> _column = new Column<Materia>(tablaMaterias);
    Column<Materia> _setTitle = _column.setTitle("nombre");
    Column<Materia> _setFixedSize = _setTitle.setFixedSize(50);
    _setFixedSize.bindContentsToProperty("nombre");
    Column<Materia> _column_1 = new Column<Materia>(tablaMaterias);
    Column<Materia> _setTitle_1 = _column_1.setTitle("profesor");
    Column<Materia> _setFixedSize_1 = _setTitle_1.setFixedSize(50);
    _setFixedSize_1.bindContentsToProperty("profesor");
  }
  
  public void createGridActions(final Panel mainPanel) {
    Panel actionsPanel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    actionsPanel.setLayout(_horizontalLayout);
    Button _button = new Button(actionsPanel);
    Button _setCaption = _button.setCaption("Editar");
    final Action _function = new Action() {
      public void execute() {
      }
    };
    Button edit = _setCaption.onClick(_function);
    Button _button_1 = new Button(actionsPanel);
    Button _setCaption_1 = _button_1.setCaption("+");
    final Action _function_1 = new Action() {
      public void execute() {
      }
    };
    Button add = _setCaption_1.onClick(_function_1);
    Button _button_2 = new Button(actionsPanel);
    Button _setCaption_2 = _button_2.setCaption("-");
    final Action _function_2 = new Action() {
      public void execute() {
      }
    };
    Button remove = _setCaption_2.onClick(_function_2);
  }
  
  public void addActions(final Panel actionsPanel) {
  }
}
