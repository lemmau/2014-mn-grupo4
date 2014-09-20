package com.dds.grupo4.dominio;

import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class Infraccion {
  @Property
  private String _motivo;
  
  @Property
  private LocalDate _fecha;
  
  public Infraccion(final String motivo, final LocalDate fecha) {
    this._motivo = motivo;
    this._fecha = fecha;
  }
  
  @Pure
  public String getMotivo() {
    return this._motivo;
  }
  
  public void setMotivo(final String motivo) {
    this._motivo = motivo;
  }
  
  @Pure
  public LocalDate getFecha() {
    return this._fecha;
  }
  
  public void setFecha(final LocalDate fecha) {
    this._fecha = fecha;
  }
}
