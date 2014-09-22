package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.ordenamiento.CriterioOrden;

@SuppressWarnings("all")
public class PromedioUltimasCalificaciones extends CriterioOrden {
  private /* Integer */Object numeroCalificaciones = int.valueOf(5);
  
  public PromedioUltimasCalificaciones(final /* Integer */Object numeroCalificaciones) {
    this.numeroCalificaciones = numeroCalificaciones;
  }
  
  public Double obtenerValor(final Inscripcion inscripcion) {
    return inscripcion.promedioUltimasCalificaciones(this.numeroCalificaciones);
  }
}