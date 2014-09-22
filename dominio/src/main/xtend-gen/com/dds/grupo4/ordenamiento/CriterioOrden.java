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
    final Function1<Inscripcion,Double> _function = new Function1<Inscripcion,Double>() {
        public Double apply(final Inscripcion inscripcion) {
          List<CriterioOrden> _criteriosOrden = partido.getCriteriosOrden();
          double _obtenerPromedioPorInscripcion = CriterioOrden.this.obtenerPromedioPorInscripcion(inscripcion, _criteriosOrden);
          return Double.valueOf(_obtenerPromedioPorInscripcion);
        }
      };
    List<Inscripcion> _sortBy = IterableExtensions.<Inscripcion, Double>sortBy(_jugadoresFinales, _function);
    return _sortBy;
  }
  
  public Double obtenerValorPorInscripcion(final Inscripcion inscripcion, final List<CriterioOrden> criteriosOrden) {
    final Function2<Double,CriterioOrden,Double> _function = new Function2<Double,CriterioOrden,Double>() {
        public Double apply(final Double result, final CriterioOrden criterio) {
          Double _obtenerValor = criterio.obtenerValor(inscripcion);
          double _plus = DoubleExtensions.operator_plus(result, _obtenerValor);
          return Double.valueOf(_plus);
        }
      };
    Double _fold = IterableExtensions.<CriterioOrden, Double>fold(criteriosOrden, Double.valueOf(0D), _function);
    return _fold;
  }
  
  public double obtenerPromedioPorInscripcion(final Inscripcion inscripcion, final List<CriterioOrden> criteriosOrden) {
    Double _obtenerValorPorInscripcion = this.obtenerValorPorInscripcion(inscripcion, criteriosOrden);
    int _size = criteriosOrden.size();
    double _divide = ((_obtenerValorPorInscripcion).doubleValue() / _size);
    return _divide;
  }
  
  public abstract Double obtenerValor(final Inscripcion inscripcion);
}
