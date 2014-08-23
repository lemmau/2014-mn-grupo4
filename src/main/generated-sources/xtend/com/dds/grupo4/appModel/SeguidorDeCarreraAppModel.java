package com.dds.grupo4.appModel;

import com.dds.grupo4.domain.Materia;
import com.dds.grupo4.domain.Nota;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class SeguidorDeCarreraAppModel {
  private List<Materia> materias;
  
  private List<Nota> notas;
  
  private Materia _materiaSeleccionada;
  
  public Materia getMateriaSeleccionada() {
    return this._materiaSeleccionada;
  }
  
  public void setMateriaSeleccionada(final Materia materiaSeleccionada) {
    this._materiaSeleccionada = materiaSeleccionada;
  }
  
  private Nota _notaSeleccionada;
  
  public Nota getNotaSeleccionada() {
    return this._notaSeleccionada;
  }
  
  public void setNotaSeleccionada(final Nota notaSeleccionada) {
    this._notaSeleccionada = notaSeleccionada;
  }
  
  public SeguidorDeCarreraAppModel() {
    ArrayList<Materia> _arrayList = new ArrayList<Materia>();
    this.materias = _arrayList;
    ArrayList<Nota> _arrayList_1 = new ArrayList<Nota>();
    this.notas = _arrayList_1;
  }
  
  public List<Materia> getMaterias() {
    return this.materias;
  }
  
  public List<Nota> getNotas() {
    return this.notas;
  }
  
  public boolean agregarMateria(final Materia materia) {
    return this.materias.add(materia);
  }
  
  public boolean agregarNota(final Nota nota) {
    return this.notas.add(nota);
  }
  
  public List<String> getMateriasPosibles() {
    return Collections.<String>unmodifiableList(Lists.<String>newArrayList("Matematica Discreta", "Ingenieria y Sociedad", "Sistemas y Organizaciones", "Algoritmos y Estructura de Datos", "Ingles I"));
  }
  
  public List<String> getTiposDeUbicacion() {
    return Collections.<String>unmodifiableList(Lists.<String>newArrayList("1er Cuatrimestre 1° Nivel", "2do Cuatrimestre 1° Nivel", "..."));
  }
  
  public void search() {
    ArrayList<Nota> _arrayList = new ArrayList<Nota>();
    this.notas = _arrayList;
  }
}
