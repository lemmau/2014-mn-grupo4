package com.dds.grupo4.domain;

import org.eclipse.xtext.xbase.lib.Exceptions;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Materia {
  private String _nombre;
  
  public void setNombre(final String nombre) {
    this._nombre = nombre;
  }
  
  private String _ubicacion;
  
  public void setUbicacion(final String ubicacion) {
    this._ubicacion = ubicacion;
  }
  
  private Integer _anioCursada;
  
  public void setAnioCursada(final Integer anioCursada) {
    this._anioCursada = anioCursada;
  }
  
  private String _profesor;
  
  public void setProfesor(final String profesor) {
    this._profesor = profesor;
  }
  
  private Boolean _finalAprobado;
  
  public void setFinalAprobado(final Boolean finalAprobado) {
    this._finalAprobado = finalAprobado;
  }
  
  public Materia(final String nombre, final String ubicacion, final Integer anioCursada, final String profesor, final Boolean finalAprobado) {
    this.setNombre(nombre);
    this.setUbicacion(ubicacion);
    this.setAnioCursada(anioCursada);
    this.setProfesor(profesor);
    this.setFinalAprobado(finalAprobado);
  }
  
  public String getNombre() {
    return this.getNombre();
  }
  
  public String getUbicacion() {
    return this.getUbicacion();
  }
  
  public Integer getAnioCursada() {
    return this.getAnioCursada();
  }
  
  public String getProfesor() {
    return this.getProfesor();
  }
  
  public Boolean getFinalAprobado() {
    return this.getFinalAprobado();
  }
  
  public Materia copy() {
    try {
      Object _clone = super.clone();
      return ((Materia) _clone);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public void clear() {
    this.setNombre(null);
    this.setUbicacion(null);
    this.setAnioCursada(null);
    this.setProfesor(null);
    this.setFinalAprobado(null);
  }
}
