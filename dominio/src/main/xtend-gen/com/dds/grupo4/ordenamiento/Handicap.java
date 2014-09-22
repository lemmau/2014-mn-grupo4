package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.ordenamiento.CriterioOrden;

@SuppressWarnings("all")
public class Handicap extends CriterioOrden {
  public Double obtenerValor(final Inscripcion inscripcion) {
    Jugador _jugador = inscripcion.getJugador();
    Integer _handicap = _jugador.getHandicap();
    Double _double = new Double((_handicap).intValue());
    return _double;
  }
}
