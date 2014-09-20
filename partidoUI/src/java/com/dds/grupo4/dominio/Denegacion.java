package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Jugador;
import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class Denegacion {
  @Property
  private Jugador _interesado;
  
  @Property
  private LocalDate _fecha;
  
  @Property
  private String _motivo;
  
  public Denegacion(final Jugador interesado, final LocalDate fecha, final String motivo) {
    this.setInteresado(interesado);
    this.setFecha(fecha);
    this.setMotivo(motivo);
  }
  
  @Pure
  public Jugador getInteresado() {
    return this._interesado;
  }
  
  public void setInteresado(final Jugador interesado) {
    this._interesado = interesado;
  }
  
  @Pure
  public LocalDate getFecha() {
    return this._fecha;
  }
  
  public void setFecha(final LocalDate fecha) {
    this._fecha = fecha;
  }
  
  @Pure
  public String getMotivo() {
    return this._motivo;
  }
  
  public void setMotivo(final String motivo) {
    this._motivo = motivo;
  }
}
