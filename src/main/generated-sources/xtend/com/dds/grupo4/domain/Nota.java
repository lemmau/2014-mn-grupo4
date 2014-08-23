package com.dds.grupo4.domain;

import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Nota {
  private String _fecha;
  
  public void setFecha(final String fecha) {
    this._fecha = fecha;
  }
  
  private String _descripcion;
  
  public void setDescripcion(final String descripcion) {
    this._descripcion = descripcion;
  }
  
  private Boolean _Aprobado;
  
  public void setAprobado(final Boolean Aprobado) {
    this._Aprobado = Aprobado;
  }
  
  public Nota(final String fecha, final String descripcion, final Boolean aprobado) {
    this.setFecha(fecha);
    this.setDescripcion(descripcion);
    this.setAprobado(aprobado);
  }
  
  public String getFecha() {
    return this.getFecha();
  }
  
  public String getDescripcion() {
    return this.getDescripcion();
  }
  
  public Boolean getAprobado() {
    return this.getAprobado();
  }
}
