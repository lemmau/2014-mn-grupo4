package com.dds.grupo4.dominio;

@SuppressWarnings("all")
public class Calificacion {
  private int _nota;
  
  public int getNota() {
    return this._nota;
  }
  
  public void setNota(final int nota) {
    this._nota = nota;
  }
  
  private String _critica;
  
  public String getCritica() {
    return this._critica;
  }
  
  public void setCritica(final String critica) {
    this._critica = critica;
  }
  
  public Calificacion(final int nota, final String critica) {
    this.setNota(nota);
    this.setCritica(critica);
  }
}
