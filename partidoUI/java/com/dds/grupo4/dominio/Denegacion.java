package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Jugador;

@SuppressWarnings("all")
public class Denegacion {
  /* @Property
   */private Jugador interesado;
  
  /* @Property
   */private /* LocalDate */Object fecha;
  
  /* @Property
   */private /* String */Object motivo;
  
  public Denegacion(final Jugador interesado, final /* LocalDate */Object fecha, final /* String */Object motivo) {
    this.interesado = interesado;
    this.fecha = fecha;
    this.motivo = motivo;
  }
}
