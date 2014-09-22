package com.dds.grupo4.divisorequipos;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;

@SuppressWarnings("all")
public abstract class DivisorDeEquipos {
  private Partido partido;
  
  public DivisorDeEquipos(final Partido partido) {
    this.partido = partido;
  }
  
  public void dividirEnEquipos(final /* List<Inscripcion> */Object jugadores) {
    throw new Error("Unresolved compilation problems:"
      + "\nforEach cannot be resolved");
  }
  
  public abstract /* Boolean */Object debeIrAlEquipoUno(final Inscripcion jugador, final /* List<Inscripcion> */Object interesados);
}
