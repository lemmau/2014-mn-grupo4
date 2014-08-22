package com.dds.grupo4.appModel;

import com.dds.grupo4.domain.Materia;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class SeguidorDeCarreraAppModel {
  private List<Materia> materias;
  
  public SeguidorDeCarreraAppModel() {
    ArrayList<Materia> _arrayList = new ArrayList<Materia>();
    this.materias = _arrayList;
  }
  
  public List<Materia> getMaterias() {
    return this.materias;
  }
  
  public boolean agregarMateria(final Materia materia) {
    return this.materias.add(materia);
  }
  
  public List<String> getMateriasPosibles() {
    return Collections.<String>unmodifiableList(Lists.<String>newArrayList("Matematica Discreta", "Ingenieria y Sociedad", "Sistemas y Organizaciones", "Algoritmos y Estructura de Datos", "Ingles I"));
  }
  
  public List<String> getTiposDeUbicacion() {
    return Collections.<String>unmodifiableList(Lists.<String>newArrayList("1er Cuatrimestre 1° Nivel", "2do Cuatrimestre 1° Nivel", "..."));
  }
}
