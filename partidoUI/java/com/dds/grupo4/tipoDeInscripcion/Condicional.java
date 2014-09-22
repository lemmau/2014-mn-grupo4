package com.dds.grupo4.tipoDeInscripcion;

import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;

@SuppressWarnings("all")
public class Condicional extends TipoDeInscripcion {
  private final /* Integer */Object PRIORIDAD_CONDICIONAL = int.valueOf(3);
  
  private /*  */Object condicionDelPartido;
  
  public Condicional(final /*  */Object predicate) {
    this.condicionDelPartido = predicate;
  }
  
  public Boolean estasConfirmado(final Partido partido) {
    throw new Error("Unresolved compilation problems:"
      + "\napply cannot be resolved");
  }
  
  public /* Integer */Object getPrioridad() {
    return this.PRIORIDAD_CONDICIONAL;
  }
}
