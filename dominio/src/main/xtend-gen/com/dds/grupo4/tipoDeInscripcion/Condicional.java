package com.dds.grupo4.tipoDeInscripcion;

import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;
import org.eclipse.xtext.xbase.lib.Functions.Function1;

@SuppressWarnings("all")
public class Condicional extends TipoDeInscripcion {
  private final Integer PRIORIDAD_CONDICIONAL = Integer.valueOf(3);
  
  private Function1<? super Partido,? extends Boolean> condicionDelPartido;
  
  public Condicional(final Function1<? super Partido,? extends Boolean> predicate) {
    this.condicionDelPartido = predicate;
  }
  
  public Boolean estasConfirmado(final Partido partido) {
    return this.condicionDelPartido.apply(partido);
  }
  
  public Integer getPrioridad() {
    return this.PRIORIDAD_CONDICIONAL;
  }
}
