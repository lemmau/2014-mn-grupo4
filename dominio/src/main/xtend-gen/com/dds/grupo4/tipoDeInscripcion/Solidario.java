package com.dds.grupo4.tipoDeInscripcion;

import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;

@SuppressWarnings("all")
public class Solidario extends TipoDeInscripcion {
  private final Integer PRIORIDAD_SOLIDARIO = Integer.valueOf(2);
  
  public Integer getPrioridad() {
    return this.PRIORIDAD_SOLIDARIO;
  }
}
