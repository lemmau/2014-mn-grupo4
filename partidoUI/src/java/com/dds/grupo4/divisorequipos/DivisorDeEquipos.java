package com.dds.grupo4.divisorequipos;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import java.util.List;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@SuppressWarnings("all")
public abstract class DivisorDeEquipos {
  private Partido partido;
  
  public DivisorDeEquipos(final Partido partido) {
    this.partido = partido;
  }
  
  public void dividirEnEquipos(final List<Inscripcion> jugadores) {
    final Procedure1<Inscripcion> _function = new Procedure1<Inscripcion>() {
      public void apply(final Inscripcion interesado) {
        Boolean _debeIrAlEquipoUno = DivisorDeEquipos.this.debeIrAlEquipoUno(interesado, jugadores);
        if ((_debeIrAlEquipoUno).booleanValue()) {
          DivisorDeEquipos.this.partido.agregarJugadorEquipoA(interesado);
        } else {
          DivisorDeEquipos.this.partido.agregarJugadorEquipoB(interesado);
        }
      }
    };
    IterableExtensions.<Inscripcion>forEach(jugadores, _function);
  }
  
  public abstract Boolean debeIrAlEquipoUno(final Inscripcion jugador, final List<Inscripcion> interesados);
}
