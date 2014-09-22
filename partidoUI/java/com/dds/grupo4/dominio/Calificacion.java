package com.dds.grupo4.dominio;

@SuppressWarnings("all")
public class Calificacion {
  /* @Property
   */private int nota;
  
  /* @Property
   */private /* String */Object critica;
  
  public Calificacion(final int nota, final /* String */Object critica) {
    this.nota = nota;
    this.critica = critica;
  }
}
