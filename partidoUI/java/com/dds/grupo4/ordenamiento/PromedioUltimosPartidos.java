package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.ordenamiento.CriterioOrden;

@SuppressWarnings("all")
public class PromedioUltimosPartidos extends CriterioOrden {
  private /* Integer */Object numeroCalificaciones = int.valueOf(5);
  
  private /* List<Partido> */Object partidos /* Skipped initializer because of errors */;
  
  public PromedioUltimosPartidos(final /* List<Partido> */Object partidos, final /* Integer */Object numeroPartidos) {
    this.partidos = partidos;
    this.numeroCalificaciones = numeroPartidos;
  }
  
  public Double obtenerValor(final Inscripcion inscripcion) {
    throw new Error("Unresolved compilation problems:"
      + "\nIterable cannot be resolved to a type."
      + "\nThe method or field promedioCalificaciones is undefined for the type PromedioUltimosPartidos"
      + "\nThe field jugador is not visible"
      + "\nThe field jugador is not visible"
      + "\nfilter cannot be resolved"
      + "\nesUnInteresado cannot be resolved"
      + "\ntake cannot be resolved"
      + "\nmap cannot be resolved"
      + "\nobtenerInscripcion cannot be resolved"
      + "\nmap cannot be resolved"
      + "\nreduce cannot be resolved"
      + "\n+ cannot be resolved"
      + "\n/ cannot be resolved"
      + "\nsize cannot be resolved");
  }
}
