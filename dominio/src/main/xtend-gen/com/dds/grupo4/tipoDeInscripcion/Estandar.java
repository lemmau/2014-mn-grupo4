package com.dds.grupo4.tipoDeInscripcion;

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;

@SuppressWarnings("all")
public class Estandar extends TipoDeInscripcion {
  private final Integer PRIORIDAD_ESTANDAR = Integer.valueOf(1);
  
  public Integer getPrioridad() {
    return this.PRIORIDAD_ESTANDAR;
  }
}
