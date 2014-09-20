package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import java.util.List;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public abstract class CriterioOrden {
  public List<Inscripcion> ordenarJugadoresFinales(final Partido partido) {
    List<Inscripcion> _jugadoresFinales = partido.jugadoresFinales();
    final Function1<Inscripcion, Double> _function = new Function1<Inscripcion, Double>() {
      public Double apply(final Inscripcion inscripcion) {
        List<CriterioOrden> _criteriosOrden = partido.getCriteriosOrden();
        return Double.valueOf(CriterioOrden.this.obtenerPromedioPorInscripcion(inscripcion, _criteriosOrden));
      }
    };
    return IterableExtensions.<Inscripcion, Double>sortBy(_jugadoresFinales, _function);
  }
  
  public Double obtenerValorPorInscripcion(final Inscripcion inscripcion, final List<CriterioOrden> criteriosOrden) {
    final Function2<Double, CriterioOrden, Double> _function = new Function2<Double, CriterioOrden, Double>() {
      public Double apply(final Double result, final CriterioOrden criterio) {
        Double _obtenerValor = criterio.obtenerValor(inscripcion);
        return Double.valueOf(DoubleExtensions.operator_plus(result, _obtenerValor));
      }
    };
    return IterableExtensions.<CriterioOrden, Double>fold(criteriosOrden, Double.valueOf(0D), _function);
  }
  
  public double obtenerPromedioPorInscripcion(final Inscripcion inscripcion, final List<CriterioOrden> criteriosOrden) {
    Double _obtenerValorPorInscripcion = this.obtenerValorPorInscripcion(inscripcion, criteriosOrden);
    int _size = criteriosOrden.size();
    return ((_obtenerValorPorInscripcion).doubleValue() / _size);
  }
  
  public abstract Double obtenerValor(final Inscripcion inscripcion);
}
