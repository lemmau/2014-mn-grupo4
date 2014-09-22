package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;

@SuppressWarnings("all")
public abstract class CriterioOrden {
  public Object ordenarJugadoresFinales(final Partido partido) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field criteriosOrden is not visible"
      + "\nsortBy cannot be resolved");
  }
  
  public /* Double */Object obtenerValorPorInscripcion(final Inscripcion inscripcion, final /* List<CriterioOrden> */Object criteriosOrden) {
    throw new Error("Unresolved compilation problems:"
      + "\nfold cannot be resolved"
      + "\n+ cannot be resolved"
      + "\nobtenerValor cannot be resolved");
  }
  
  public Object obtenerPromedioPorInscripcion(final Inscripcion inscripcion, final /* List<CriterioOrden> */Object criteriosOrden) {
    throw new Error("Unresolved compilation problems:"
      + "\n/ cannot be resolved"
      + "\nsize cannot be resolved");
  }
  
  public abstract /* Double */Object obtenerValor(final Inscripcion inscripcion);
}
