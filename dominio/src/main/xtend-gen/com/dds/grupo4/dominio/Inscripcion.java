package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Calificacion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.NoTieneCalificacionesException;
import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Inscripcion {
  private final static int MAX_CALIFICACIONES_XPARTIDO = 9;
  
  private Jugador _jugador;
  
  public Jugador getJugador() {
    return this._jugador;
  }
  
  public void setJugador(final Jugador jugador) {
    this._jugador = jugador;
  }
  
  private List<Calificacion> _calificaciones = new Function0<List<Calificacion>>() {
    public List<Calificacion> apply() {
      ArrayList<Calificacion> _arrayList = new ArrayList<Calificacion>();
      return _arrayList;
    }
  }.apply();
  
  public List<Calificacion> getCalificaciones() {
    return this._calificaciones;
  }
  
  public void setCalificaciones(final List<Calificacion> calificaciones) {
    this._calificaciones = calificaciones;
  }
  
  public Inscripcion(final Jugador interesado) {
    this.setJugador(interesado);
  }
  
  public void calificar(final Integer puntaje, final String critica) {
    Integer _cantidadCalificaciones = this.cantidadCalificaciones();
    boolean _greaterEqualsThan = ((_cantidadCalificaciones).intValue() >= Inscripcion.MAX_CALIFICACIONES_XPARTIDO);
    if (_greaterEqualsThan) {
      SuperaMaximoCalificacionesException _superaMaximoCalificacionesException = new SuperaMaximoCalificacionesException("El jugador ya tiene el maximo de calificaciones por partido");
      throw _superaMaximoCalificacionesException;
    }
    List<Calificacion> _calificaciones = this.getCalificaciones();
    Calificacion _calificacion = new Calificacion((puntaje).intValue(), critica);
    _calificaciones.add(_calificacion);
  }
  
  public Integer sumaCalificaciones() {
    Integer _sumaCalificaciones = this.sumaCalificaciones(this._calificaciones);
    return _sumaCalificaciones;
  }
  
  public Integer sumaCalificaciones(final List<Calificacion> calificaciones) {
    final Function1<Calificacion,Integer> _function = new Function1<Calificacion,Integer>() {
        public Integer apply(final Calificacion it) {
          int _nota = it.getNota();
          return Integer.valueOf(_nota);
        }
      };
    List<Integer> _map = ListExtensions.<Calificacion, Integer>map(calificaciones, _function);
    final Function2<Integer,Integer,Integer> _function_1 = new Function2<Integer,Integer,Integer>() {
        public Integer apply(final Integer p1, final Integer p2) {
          int _plus = ((p1).intValue() + (p2).intValue());
          return Integer.valueOf(_plus);
        }
      };
    Integer _reduce = IterableExtensions.<Integer>reduce(_map, _function_1);
    return _reduce;
  }
  
  public Integer cantidadCalificaciones() {
    Integer _cantidadCalificaciones = this.cantidadCalificaciones(this._calificaciones);
    return _cantidadCalificaciones;
  }
  
  public Integer cantidadCalificaciones(final List<Calificacion> calificaciones) {
    int _size = calificaciones.size();
    return Integer.valueOf(_size);
  }
  
  private Double promedio(final List<Calificacion> calificaciones) {
    Double _xblockexpression = null;
    {
      Integer _cantidadCalificaciones = this.cantidadCalificaciones(calificaciones);
      boolean _equals = Integer.valueOf(0).equals(_cantidadCalificaciones);
      if (_equals) {
        NoTieneCalificacionesException _noTieneCalificacionesException = new NoTieneCalificacionesException("El jugador no tiene calificaciones");
        throw _noTieneCalificacionesException;
      }
      Integer _sumaCalificaciones = this.sumaCalificaciones(calificaciones);
      Integer _cantidadCalificaciones_1 = this.cantidadCalificaciones(calificaciones);
      double _divide = ((_sumaCalificaciones).intValue() / ((double) (_cantidadCalificaciones_1).intValue()));
      Double _double = new Double(_divide);
      _xblockexpression = (_double);
    }
    return _xblockexpression;
  }
  
  public Double promedioCalificaciones() {
    List<Calificacion> _calificaciones = this.getCalificaciones();
    Double _promedio = this.promedio(_calificaciones);
    return _promedio;
  }
  
  public Double promedioUltimasCalificaciones(final Integer ultimasN) {
    Double _xtrycatchfinallyexpression = null;
    try {
      List<Calificacion> _calificaciones = this.getCalificaciones();
      Integer _cantidadCalificaciones = this.cantidadCalificaciones();
      int _minus = ((_cantidadCalificaciones).intValue() - (ultimasN).intValue());
      Integer _cantidadCalificaciones_1 = this.cantidadCalificaciones();
      List<Calificacion> _subList = _calificaciones.subList(_minus, (_cantidadCalificaciones_1).intValue());
      Double _promedio = this.promedio(_subList);
      _xtrycatchfinallyexpression = _promedio;
    } catch (final Throwable _t) {
      if (_t instanceof IndexOutOfBoundsException) {
        final IndexOutOfBoundsException e = (IndexOutOfBoundsException)_t;
        List<Calificacion> _calificaciones_1 = this.getCalificaciones();
        int _size = _calificaciones_1.size();
        String _plus = ("No se puede calcular el promedio. Cantidad calificaciones actual: " + Integer.valueOf(_size));
        SuperaMaximoCalificacionesException _superaMaximoCalificacionesException = new SuperaMaximoCalificacionesException(_plus);
        throw _superaMaximoCalificacionesException;
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    return _xtrycatchfinallyexpression;
  }
}
