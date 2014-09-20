package com.dds.grupo4.dominio;

import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Calificacion {
  @Property
  private int _nota;
  
  @Property
  private String _critica;
  
  public Calificacion(final int nota, final String critica) {
    this.setNota(nota);
    this.setCritica(critica);
  }
  
  @Pure
  public int getNota() {
    return this._nota;
  }
  
  public void setNota(final int nota) {
    this._nota = nota;
  }
  
  @Pure
  public String getCritica() {
    return this._critica;
  }
  
  public void setCritica(final String critica) {
    this._critica = critica;
  }
}
