package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.ordenamiento.CriterioOrden;

@SuppressWarnings("all")
public class PromedioUltimasCalificaciones extends CriterioOrden {
  private Integer numeroCalificaciones = Integer.valueOf(5);
  
  public PromedioUltimasCalificaciones(final Integer numeroCalificaciones) {
    this.numeroCalificaciones = numeroCalificaciones;
  }
  
  public Double obtenerValor(final Inscripcion inscripcion) {
    Double _promedioUltimasCalificaciones = inscripcion.promedioUltimasCalificaciones(this.numeroCalificaciones);
    return _promedioUltimasCalificaciones;
  }
}
