package com.dds.grupo4.dominio;

import com.dds.grupo4.divisorequipos.DivisorDeEquipos;
import com.dds.grupo4.dominio.Admin;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.BusinessException;
import com.dds.grupo4.excepciones.FaltaDefinirCriterioDeOrdenException;
import com.dds.grupo4.excepciones.InscripcionCerradaException;
import com.dds.grupo4.excepciones.NoEsJugadorDelPartidoException;
import com.dds.grupo4.observadores.InscripcionObserver;
import com.dds.grupo4.ordenamiento.CriterioOrden;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@SuppressWarnings("all")
public class Partido {
  private final static int MIN_CANTIDAD_JUGADORES = 0;
  
  private final static int MAX_CANTIDAD_JUGADORES = 10;
  
  private static boolean INSCRIPCION_CERRADA = false;
  
  private Long _id;
  
  public Long getId() {
    return this._id;
  }
  
  public void setId(final Long id) {
    this._id = id;
  }
  
  private /* LocalDateTime */Object _fechaInicio;
  
  public /* LocalDateTime */Object getFechaInicio() {
    return this._fechaInicio;
  }
  
  public void setFechaInicio(final /* LocalDateTime */Object fechaInicio) {
    this._fechaInicio = fechaInicio;
  }
  
  private List<Inscripcion> _inscripciones = new Function0<List<Inscripcion>>() {
    public List<Inscripcion> apply() {
      ArrayList<Inscripcion> _arrayList = new ArrayList<Inscripcion>();
      return _arrayList;
    }
  }.apply();
  
  public List<Inscripcion> getInscripciones() {
    return this._inscripciones;
  }
  
  public void setInscripciones(final List<Inscripcion> inscripciones) {
    this._inscripciones = inscripciones;
  }
  
  private Admin _admin;
  
  public Admin getAdmin() {
    return this._admin;
  }
  
  public void setAdmin(final Admin admin) {
    this._admin = admin;
  }
  
  private List<Jugador> _jugadoresDelPartido = new Function0<List<Jugador>>() {
    public List<Jugador> apply() {
      ArrayList<Jugador> _arrayList = new ArrayList<Jugador>();
      return _arrayList;
    }
  }.apply();
  
  public List<Jugador> getJugadoresDelPartido() {
    return this._jugadoresDelPartido;
  }
  
  public void setJugadoresDelPartido(final List<Jugador> jugadoresDelPartido) {
    this._jugadoresDelPartido = jugadoresDelPartido;
  }
  
  private List<Inscripcion> _equipoA = new Function0<List<Inscripcion>>() {
    public List<Inscripcion> apply() {
      ArrayList<Inscripcion> _arrayList = new ArrayList<Inscripcion>();
      return _arrayList;
    }
  }.apply();
  
  public List<Inscripcion> getEquipoA() {
    return this._equipoA;
  }
  
  public void setEquipoA(final List<Inscripcion> equipoA) {
    this._equipoA = equipoA;
  }
  
  private List<Inscripcion> _equipoB = new Function0<List<Inscripcion>>() {
    public List<Inscripcion> apply() {
      ArrayList<Inscripcion> _arrayList = new ArrayList<Inscripcion>();
      return _arrayList;
    }
  }.apply();
  
  public List<Inscripcion> getEquipoB() {
    return this._equipoB;
  }
  
  public void setEquipoB(final List<Inscripcion> equipoB) {
    this._equipoB = equipoB;
  }
  
  private List<CriterioOrden> _criteriosOrden = new Function0<List<CriterioOrden>>() {
    public List<CriterioOrden> apply() {
      ArrayList<CriterioOrden> _arrayList = new ArrayList<CriterioOrden>();
      return _arrayList;
    }
  }.apply();
  
  public List<CriterioOrden> getCriteriosOrden() {
    return this._criteriosOrden;
  }
  
  public void setCriteriosOrden(final List<CriterioOrden> criteriosOrden) {
    this._criteriosOrden = criteriosOrden;
  }
  
  private List<InscripcionObserver> _observadores = new Function0<List<InscripcionObserver>>() {
    public List<InscripcionObserver> apply() {
      ArrayList<InscripcionObserver> _arrayList = new ArrayList<InscripcionObserver>();
      return _arrayList;
    }
  }.apply();
  
  public List<InscripcionObserver> getObservadores() {
    return this._observadores;
  }
  
  public void setObservadores(final List<InscripcionObserver> observadores) {
    this._observadores = observadores;
  }
  
  public Partido(final Admin admin) {
    this.setAdmin(admin);
  }
  
  public void inscribirA(final Jugador nuevoInteresado) {
    if (Partido.INSCRIPCION_CERRADA) {
      InscripcionCerradaException _inscripcionCerradaException = new InscripcionCerradaException("La inscripcion a este partido esta cerrada");
      throw _inscripcionCerradaException;
    }
    Inscripcion _inscripcion = new Inscripcion(nuevoInteresado);
    final Inscripcion nuevaInscripcion = _inscripcion;
    List<Inscripcion> _inscripciones = this.getInscripciones();
    _inscripciones.add(nuevaInscripcion);
    List<Inscripcion> _inscripciones_1 = this.getInscripciones();
    final Function1<Inscripcion,Integer> _function = new Function1<Inscripcion,Integer>() {
        public Integer apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          Integer _prioridad = _jugador.getPrioridad();
          return _prioridad;
        }
      };
    List<Inscripcion> _sortBy = IterableExtensions.<Inscripcion, Integer>sortBy(_inscripciones_1, _function);
    this.setInscripciones(_sortBy);
    this.notificarInscripcion(nuevaInscripcion);
  }
  
  public void notificarInscripcion(final Inscripcion inscripcion) {
    List<InscripcionObserver> _observadores = this.getObservadores();
    final Procedure1<InscripcionObserver> _function = new Procedure1<InscripcionObserver>() {
        public void apply(final InscripcionObserver obs) {
          obs.notificarNuevaInscripcion(inscripcion);
        }
      };
    IterableExtensions.<InscripcionObserver>forEach(_observadores, _function);
  }
  
  public void notificarBajaInscripcion() {
    List<InscripcionObserver> _observadores = this.getObservadores();
    final Procedure1<InscripcionObserver> _function = new Procedure1<InscripcionObserver>() {
        public void apply(final InscripcionObserver obs) {
          obs.notificarBajaInscripcion();
        }
      };
    IterableExtensions.<InscripcionObserver>forEach(_observadores, _function);
  }
  
  public void inscribirTodos(final List<Jugador> nuevosInteresados) {
    final Procedure1<Jugador> _function = new Procedure1<Jugador>() {
        public void apply(final Jugador interesado) {
          Partido.this.inscribirA(interesado);
        }
      };
    IterableExtensions.<Jugador>forEach(nuevosInteresados, _function);
  }
  
  public List<Inscripcion> jugadoresFinales() {
    try {
      List<Inscripcion> _inscripciones = this.getInscripciones();
      final Function1<Inscripcion,Boolean> _function = new Function1<Inscripcion,Boolean>() {
          public Boolean apply(final Inscripcion inscripcion) {
            Jugador _jugador = inscripcion.getJugador();
            Boolean _estasConfirmado = _jugador.estasConfirmado(Partido.this);
            return _estasConfirmado;
          }
        };
      Iterable<Inscripcion> _filter = IterableExtensions.<Inscripcion>filter(_inscripciones, _function);
      List<Inscripcion> _list = IterableExtensions.<Inscripcion>toList(_filter);
      return _list.subList(Partido.MIN_CANTIDAD_JUGADORES, Partido.MAX_CANTIDAD_JUGADORES);
    } catch (final Throwable _t) {
      if (_t instanceof IndexOutOfBoundsException) {
        final IndexOutOfBoundsException ex = (IndexOutOfBoundsException)_t;
        BusinessException _businessException = new BusinessException("No hay diez jugadores para realizar un partido");
        throw _businessException;
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  public boolean cerrarInscripcion() {
    boolean _INSCRIPCION_CERRADA = Partido.INSCRIPCION_CERRADA = true;
    return _INSCRIPCION_CERRADA;
  }
  
  public int cantidadInteresados() {
    List<Inscripcion> _inscripciones = this.getInscripciones();
    int _size = _inscripciones.size();
    return _size;
  }
  
  public Boolean esUnInteresado(final Jugador interesado) {
    List<Inscripcion> _inscripciones = this.getInscripciones();
    final Function1<Inscripcion,Boolean> _function = new Function1<Inscripcion,Boolean>() {
        public Boolean apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          boolean _equals = _jugador.equals(interesado);
          return Boolean.valueOf(_equals);
        }
      };
    Iterable<Inscripcion> _filter = IterableExtensions.<Inscripcion>filter(_inscripciones, _function);
    int _size = IterableExtensions.size(_filter);
    return Boolean.valueOf((_size != 0));
  }
  
  public Boolean esUnJugadorFinal(final Jugador interesado) {
    List<Inscripcion> _jugadoresFinales = this.jugadoresFinales();
    final Function1<Inscripcion,Boolean> _function = new Function1<Inscripcion,Boolean>() {
        public Boolean apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          boolean _equals = _jugador.equals(interesado);
          return Boolean.valueOf(_equals);
        }
      };
    Iterable<Inscripcion> _filter = IterableExtensions.<Inscripcion>filter(_jugadoresFinales, _function);
    int _size = IterableExtensions.size(_filter);
    return Boolean.valueOf((_size != 0));
  }
  
  public Inscripcion obtenerInscripcion(final Jugador jugador) {
    List<Inscripcion> _inscripciones = this.getInscripciones();
    Inscripcion _obtenerInscripcion = this.obtenerInscripcion(jugador, _inscripciones);
    return _obtenerInscripcion;
  }
  
  public Inscripcion obtenerInscripcion(final Jugador interesado, final List<Inscripcion> lista) {
    final Function1<Inscripcion,Boolean> _function = new Function1<Inscripcion,Boolean>() {
        public Boolean apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          boolean _equals = _jugador.equals(interesado);
          return Boolean.valueOf(_equals);
        }
      };
    final Inscripcion encontrado = IterableExtensions.<Inscripcion>findFirst(lista, _function);
    boolean _equals = Objects.equal(null, encontrado);
    if (_equals) {
      NoEsJugadorDelPartidoException _noEsJugadorDelPartidoException = new NoEsJugadorDelPartidoException("El jugador no existe entre los inscriptos al partido");
      throw _noEsJugadorDelPartidoException;
    }
    return encontrado;
  }
  
  public boolean quitarJugador(final Jugador jugador) {
    List<Inscripcion> _inscripciones = this.getInscripciones();
    Inscripcion _obtenerInscripcion = this.obtenerInscripcion(jugador);
    boolean _remove = _inscripciones.remove(_obtenerInscripcion);
    return _remove;
  }
  
  public void darDeBajaA(final Jugador interesado) {
    this.quitarJugador(interesado);
    interesado.agregarInfraccion("NO tiene reemplazante");
    this.notificarBajaInscripcion();
  }
  
  public void darDeBajaA(final Jugador resagado, final Jugador reemplazante) {
    this.quitarJugador(resagado);
    this.inscribirA(reemplazante);
    this.notificarBajaInscripcion();
  }
  
  public Inscripcion obtenerJugadorFinal(final Jugador jugador) {
    List<Inscripcion> _jugadoresFinales = this.jugadoresFinales();
    Inscripcion _obtenerInscripcion = this.obtenerInscripcion(jugador, _jugadoresFinales);
    return _obtenerInscripcion;
  }
  
  public void calificarA(final Jugador jugador, final Integer puntaje, final String critica) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    _obtenerJugadorFinal.calificar(puntaje, critica);
  }
  
  public Integer cantidadCalificaciones(final Jugador jugador) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    Integer _cantidadCalificaciones = _obtenerJugadorFinal.cantidadCalificaciones();
    return _cantidadCalificaciones;
  }
  
  public Double promedioCalificaciones(final Jugador jugador) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    Double _promedioCalificaciones = _obtenerJugadorFinal.promedioCalificaciones();
    return _promedioCalificaciones;
  }
  
  public Double promedioNCalificaciones(final Jugador jugador, final Integer ultimasN) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    Double _promedioUltimasCalificaciones = _obtenerJugadorFinal.promedioUltimasCalificaciones(ultimasN);
    return _promedioUltimasCalificaciones;
  }
  
  public boolean agregarCriterioOrdenamiento(final CriterioOrden criterio) {
    List<CriterioOrden> _criteriosOrden = this.getCriteriosOrden();
    boolean _add = _criteriosOrden.add(criterio);
    return _add;
  }
  
  public boolean quitarCriterioOrdenamiento(final CriterioOrden criterio) {
    List<CriterioOrden> _criteriosOrden = this.getCriteriosOrden();
    boolean _remove = _criteriosOrden.remove(criterio);
    return _remove;
  }
  
  public void eliminarCriteriosOrdenamiento() {
    List<CriterioOrden> _criteriosOrden = this.getCriteriosOrden();
    _criteriosOrden.clear();
  }
  
  public boolean agregarObservador(final InscripcionObserver observador) {
    List<InscripcionObserver> _observadores = this.getObservadores();
    boolean _add = _observadores.add(observador);
    return _add;
  }
  
  public boolean quitarObservador(final InscripcionObserver observador) {
    List<InscripcionObserver> _observadores = this.getObservadores();
    boolean _remove = _observadores.remove(observador);
    return _remove;
  }
  
  public void eliminarObservadores() {
    List<InscripcionObserver> _observadores = this.getObservadores();
    _observadores.clear();
  }
  
  public List<Inscripcion> ordenarJugadoresFinales() {
    List<Inscripcion> _xblockexpression = null;
    {
      List<CriterioOrden> _criteriosOrden = this.getCriteriosOrden();
      boolean _isEmpty = _criteriosOrden.isEmpty();
      if (_isEmpty) {
        FaltaDefinirCriterioDeOrdenException _faltaDefinirCriterioDeOrdenException = new FaltaDefinirCriterioDeOrdenException("Se debe agregar un criterio de orden antes de ordenar");
        throw _faltaDefinirCriterioDeOrdenException;
      }
      List<Inscripcion> _jugadoresFinales = this.jugadoresFinales();
      final Function1<Inscripcion,Double> _function = new Function1<Inscripcion,Double>() {
          public Double apply(final Inscripcion inscripcion) {
            List<CriterioOrden> _criteriosOrden = Partido.this.getCriteriosOrden();
            final Function1<CriterioOrden,Double> _function = new Function1<CriterioOrden,Double>() {
                public Double apply(final CriterioOrden c) {
                  Double _obtenerValor = c.obtenerValor(inscripcion);
                  return _obtenerValor;
                }
              };
            List<Double> _map = ListExtensions.<CriterioOrden, Double>map(_criteriosOrden, _function);
            final Function2<Double,Double,Double> _function_1 = new Function2<Double,Double,Double>() {
                public Double apply(final Double p1, final Double p2) {
                  double _plus = DoubleExtensions.operator_plus(p1, p2);
                  return Double.valueOf(_plus);
                }
              };
            Double _reduce = IterableExtensions.<Double>reduce(_map, _function_1);
            return _reduce;
          }
        };
      List<Inscripcion> _sortBy = IterableExtensions.<Inscripcion, Double>sortBy(_jugadoresFinales, _function);
      _xblockexpression = (_sortBy);
    }
    return _xblockexpression;
  }
  
  public void generarEquiposTentativos(final DivisorDeEquipos criterio) {
    this.validarInscripcion();
    List<Inscripcion> _ordenarJugadoresFinales = this.ordenarJugadoresFinales();
    criterio.dividirEnEquipos(_ordenarJugadoresFinales);
  }
  
  public void validarInscripcion() {
    boolean _or = false;
    boolean _not = (!Partido.INSCRIPCION_CERRADA);
    if (_not) {
      _or = true;
    } else {
      List<Inscripcion> _jugadoresFinales = this.jugadoresFinales();
      int _size = _jugadoresFinales.size();
      boolean _lessThan = (_size < 10);
      _or = (_not || _lessThan);
    }
    if (_or) {
      InscripcionCerradaException _inscripcionCerradaException = new InscripcionCerradaException("La inscripcion No esta cerrada");
      throw _inscripcionCerradaException;
    }
  }
  
  public boolean agregarJugadorEquipoA(final Inscripcion inscripcion) {
    List<Inscripcion> _equipoA = this.getEquipoA();
    boolean _add = _equipoA.add(inscripcion);
    return _add;
  }
  
  public boolean agregarJugadorEquipoB(final Inscripcion inscripcion) {
    List<Inscripcion> _equipoB = this.getEquipoB();
    boolean _add = _equipoB.add(inscripcion);
    return _add;
  }
}
