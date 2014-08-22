package com.dds.grupo4.domain;

import java.util.Date;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Nota {
  private Date _fecha;
  
  public Date getFecha() {
    return this._fecha;
  }
  
  public void setFecha(final Date fecha) {
    this._fecha = fecha;
  }
  
  private String _descripcion;
  
  public String getDescripcion() {
    return this._descripcion;
  }
  
  public void setDescripcion(final String descripcion) {
    this._descripcion = descripcion;
  }
  
  private Boolean _Aprobado;
  
  public Boolean getAprobado() {
    return this._Aprobado;
  }
  
  public void setAprobado(final Boolean Aprobado) {
    this._Aprobado = Aprobado;
  }
}
