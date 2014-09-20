package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Calificacion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.NoTieneCalificacionesException;
import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Inscripcion {
  private final static int MAX_CALIFICACIONES_XPARTIDO = 9;
  
  @Property
  private Jugador _jugador;
  
  @Property
  private List<Calificacion> _calificaciones = new ArrayList<Calificacion>();
  
  public Inscripcion(final Jugador interesado) {
    this.setJugador(interesado);
  }
  
  public void calificar(final Integer puntaje, final String critica) {
    Integer _cantidadCalificaciones = this.cantidadCalificaciones();
    boolean _greaterEqualsThan = ((_cantidadCalificaciones).intValue() >= Inscripcion.MAX_CALIFICACIONES_XPARTIDO);
    if (_greaterEqualsThan) {
      throw new SuperaMaximoCalificacionesException("El jugador ya tiene el maximo de calificaciones por partido");
    }
    List<Calificacion> _calificaciones = this.getCalificaciones();
    Calificacion _calificacion = new Calificacion((puntaje).intValue(), critica);
    _calificaciones.add(_calificacion);
  }
  
  public Integer sumaCalificaciones() {
    return this.sumaCalificaciones(this._calificaciones);
  }
  
  public Integer sumaCalificaciones(final List<Calificacion> calificaciones) {
    final Function1<Calificacion, Integer> _function = new Function1<Calificacion, Integer>() {
      public Integer apply(final Calificacion it) {
        return Integer.valueOf(it.getNota());
      }
    };
    List<Integer> _map = ListExtensions.<Calificacion, Integer>map(calificaciones, _function);
    final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer p1, final Integer p2) {
        return Integer.valueOf(((p1).intValue() + (p2).intValue()));
      }
    };
    return IterableExtensions.<Integer>reduce(_map, _function_1);
  }
  
  public Integer cantidadCalificaciones() {
    return this.cantidadCalificaciones(this._calificaciones);
  }
  
  public Integer cantidadCalificaciones(final List<Calificacion> calificaciones) {
    return Integer.valueOf(calificaciones.size());
  }
  
  private Double promedio(final List<Calificacion> calificaciones) {
    Double _xblockexpression = null;
    {
      Integer _cantidadCalificaciones = this.cantidadCalificaciones(calificaciones);
      boolean _equals = Integer.valueOf(0).equals(_cantidadCalificaciones);
      if (_equals) {
        throw new NoTieneCalificacionesException("El jugador no tiene calificaciones");
      }
      Integer _sumaCalificaciones = this.sumaCalificaciones(calificaciones);
      Integer _cantidadCalificaciones_1 = this.cantidadCalificaciones(calificaciones);
      double _divide = ((_sumaCalificaciones).intValue() / ((double) (_cantidadCalificaciones_1).intValue()));
      _xblockexpression = new Double(_divide);
    }
    return _xblockexpression;
  }
  
  public Double promedioCalificaciones() {
    List<Calificacion> _calificaciones = this.getCalificaciones();
    return this.promedio(_calificaciones);
  }
  
  public Double promedioUltimasCalificaciones(final Integer ultimasN) {
    Double _xtrycatchfinallyexpression = null;
    try {
      List<Calificacion> _calificaciones = this.getCalificaciones();
      Integer _cantidadCalificaciones = this.cantidadCalificaciones();
      int _minus = ((_cantidadCalificaciones).intValue() - (ultimasN).intValue());
      Integer _cantidadCalificaciones_1 = this.cantidadCalificaciones();
      List<Calificacion> _subList = _calificaciones.subList(_minus, (_cantidadCalificaciones_1).intValue());
      _xtrycatchfinallyexpression = this.promedio(_subList);
    } catch (final Throwable _t) {
      if (_t instanceof IndexOutOfBoundsException) {
        final IndexOutOfBoundsException e = (IndexOutOfBoundsException)_t;
        List<Calificacion> _calificaciones_1 = this.getCalificaciones();
        int _size = _calificaciones_1.size();
        String _plus = ("No se puede calcular el promedio. Cantidad calificaciones actual: " + Integer.valueOf(_size));
        throw new SuperaMaximoCalificacionesException(_plus);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    return _xtrycatchfinallyexpression;
  }
  
  @Pure
  public Jugador getJugador() {
    return this._jugador;
  }
  
  public void setJugador(final Jugador jugador) {
    this._jugador = jugador;
  }
  
  @Pure
  public List<Calificacion> getCalificaciones() {
    return this._calificaciones;
  }
  
  public void setCalificaciones(final List<Calificacion> calificaciones) {
    this._calificaciones = calificaciones;
  }
}
