package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Jugador;

@SuppressWarnings("all")
public class Denegacion {
  private Jugador _interesado;
  
  public Jugador getInteresado() {
    return this._interesado;
  }
  
  public void setInteresado(final Jugador interesado) {
    this._interesado = interesado;
  }
  
  private /* LocalDateTime */Object _fecha;
  
  public /* LocalDateTime */Object getFecha() {
    return this._fecha;
  }
  
  public void setFecha(final /* LocalDateTime */Object fecha) {
    this._fecha = fecha;
  }
  
  private String _motivo;
  
  public String getMotivo() {
    return this._motivo;
  }
  
  public void setMotivo(final String motivo) {
    this._motivo = motivo;
  }
  
  public Denegacion(final Jugador interesado, final /* LocalDateTime */Object fecha, final String motivo) {
    this.setInteresado(interesado);
    this.setFecha(fecha);
    this.setMotivo(motivo);
  }
}
