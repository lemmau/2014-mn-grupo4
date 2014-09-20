package com.dds.grupo4.tipoDeInscripcion;

import com.dds.grupo4.dominio.Partido;

@SuppressWarnings("all")
public abstract class TipoDeInscripcion {
  public Boolean estasConfirmado(final Partido partido) {
    return Boolean.TRUE;
  }
  
  public abstract Integer getPrioridad();
}
