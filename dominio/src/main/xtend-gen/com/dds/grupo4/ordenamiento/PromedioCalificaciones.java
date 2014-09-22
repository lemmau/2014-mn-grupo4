package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.ordenamiento.CriterioOrden;

@SuppressWarnings("all")
public class PromedioCalificaciones extends CriterioOrden {
  public Double obtenerValor(final Inscripcion inscripcion) {
    Double _promedioCalificaciones = inscripcion.promedioCalificaciones();
    return _promedioCalificaciones;
  }
}
