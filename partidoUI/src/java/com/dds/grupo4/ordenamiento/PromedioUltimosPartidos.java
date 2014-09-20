package com.dds.grupo4.ordenamiento;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.ordenamiento.CriterioOrden;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class PromedioUltimosPartidos extends CriterioOrden {
  private Integer numeroCalificaciones = Integer.valueOf(5);
  
  private List<Partido> partidos = new ArrayList<Partido>();
  
  public PromedioUltimosPartidos(final List<Partido> partidos, final Integer numeroPartidos) {
    this.partidos = partidos;
    this.numeroCalificaciones = numeroPartidos;
  }
  
  public Double obtenerValor(final Inscripcion inscripcion) {
    double _xblockexpression = (double) 0;
    {
      final Function1<Partido, Boolean> _function = new Function1<Partido, Boolean>() {
        public Boolean apply(final Partido p) {
          Jugador _jugador = inscripcion.getJugador();
          return p.esUnInteresado(_jugador);
        }
      };
      Iterable<Partido> _filter = IterableExtensions.<Partido>filter(this.partidos, _function);
      final Iterable<Partido> filtrado = IterableExtensions.<Partido>take(_filter, (this.numeroCalificaciones).intValue());
      final Function1<Partido, Inscripcion> _function_1 = new Function1<Partido, Inscripcion>() {
        public Inscripcion apply(final Partido partido) {
          Jugador _jugador = inscripcion.getJugador();
          return partido.obtenerInscripcion(_jugador);
        }
      };
      Iterable<Inscripcion> _map = IterableExtensions.<Partido, Inscripcion>map(filtrado, _function_1);
      final Function1<Inscripcion, Double> _function_2 = new Function1<Inscripcion, Double>() {
        public Double apply(final Inscripcion it) {
          return it.promedioCalificaciones();
        }
      };
      Iterable<Double> _map_1 = IterableExtensions.<Inscripcion, Double>map(_map, _function_2);
      final Function2<Double, Double, Double> _function_3 = new Function2<Double, Double, Double>() {
        public Double apply(final Double p1, final Double p2) {
          return Double.valueOf(DoubleExtensions.operator_plus(p1, p2));
        }
      };
      Double _reduce = IterableExtensions.<Double>reduce(_map_1, _function_3);
      int _size = IterableExtensions.size(filtrado);
      _xblockexpression = ((_reduce).doubleValue() / _size);
    }
    return Double.valueOf(_xblockexpression);
  }
}
