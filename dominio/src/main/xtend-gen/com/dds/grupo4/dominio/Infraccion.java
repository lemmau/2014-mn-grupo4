package com.dds.grupo4.dominio;

@SuppressWarnings("all")
public class Infraccion {
  private String _motivo;
  
  public String getMotivo() {
    return this._motivo;
  }
  
  public void setMotivo(final String motivo) {
    this._motivo = motivo;
  }
  
  private /* LocalDateTime */Object _fecha;
  
  public /* LocalDateTime */Object getFecha() {
    return this._fecha;
  }
  
  public void setFecha(final /* LocalDateTime */Object fecha) {
    this._fecha = fecha;
  }
  
  public Infraccion(final String motivo, final /* LocalDateTime */Object fecha) {
    this._motivo = motivo;
    this._fecha = fecha;
  }
}
