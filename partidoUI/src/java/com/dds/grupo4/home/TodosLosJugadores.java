package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException;
import com.dds.grupo4.home.InteresadosRechazados;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class TodosLosJugadores {
  private List<Jugador> interesadosPendientes = new ArrayList<Jugador>();
  
  private List<Jugador> interesadosAceptados = new ArrayList<Jugador>();
  
  private InteresadosRechazados rechazados = new InteresadosRechazados();
  
  /**
   * singleton
   */
  private static TodosLosJugadores instance;
  
  private TodosLosJugadores() {
    ArrayList<Jugador> _arrayList = new ArrayList<Jugador>();
    this.interesadosAceptados = _arrayList;
    ArrayList<Jugador> _arrayList_1 = new ArrayList<Jugador>();
    this.interesadosPendientes = _arrayList_1;
  }
  
  public static TodosLosJugadores getInstance() {
    TodosLosJugadores _xblockexpression = null;
    {
      boolean _equals = Objects.equal(TodosLosJugadores.instance, null);
      if (_equals) {
        TodosLosJugadores _todosLosJugadores = new TodosLosJugadores();
        TodosLosJugadores.instance = _todosLosJugadores;
      }
      _xblockexpression = TodosLosJugadores.instance;
    }
    return _xblockexpression;
  }
  
  /**
   * fin singleton
   */
  public boolean esUnInteresadoDelSistema(final Jugador interesado) {
    return this.interesadosPendientes.contains(interesado);
  }
  
  public boolean esUnInteresadoAceptado(final Jugador interesado) {
    return this.interesadosAceptados.contains(interesado);
  }
  
  public boolean esUnInteresadoRechazado(final Jugador interesado) {
    return this.rechazados.esUnInteresadoRechazado(interesado);
  }
  
  public void eliminarInteresado(final Jugador interesado) {
    boolean _remove = this.interesadosPendientes.remove(interesado);
    boolean _not = (!_remove);
    if (_not) {
      throw new NoExisteJugadorPendienteException("El jugador no existe entre los pendientes de aprobacion");
    }
  }
  
  public Jugador[] getInteresadosDelSistema() {
    return ((Jugador[])Conversions.unwrapArray(this.interesadosPendientes, Jugador.class)).clone();
  }
  
  public Jugador[] getInteresadosAceptados() {
    return ((Jugador[])Conversions.unwrapArray(this.interesadosAceptados, Jugador.class)).clone();
  }
  
  public Integer cantInteresadosPendientes() {
    return Integer.valueOf(this.interesadosPendientes.size());
  }
  
  public Integer cantInteresadosAceptados() {
    return Integer.valueOf(this.interesadosAceptados.size());
  }
  
  public Integer cantInteresadosRechazados() {
    return this.rechazados.getCantInteresadosRechazados();
  }
  
  public boolean proponerJugador(final Jugador interesado) {
    return this.interesadosPendientes.add(interesado);
  }
  
  public boolean aceptarInteresado(final Jugador interesado) {
    boolean _xblockexpression = false;
    {
      this.eliminarInteresado(interesado);
      int _ultimoIdUtilizado = this.ultimoIdUtilizado();
      long _longValue = Integer.valueOf(_ultimoIdUtilizado).longValue();
      long _plus = (_longValue + 1);
      Long _long = new Long(_plus);
      interesado.setId(_long);
      _xblockexpression = this.interesadosAceptados.add(interesado);
    }
    return _xblockexpression;
  }
  
  public int ultimoIdUtilizado() {
    boolean _isEmpty = this.interesadosAceptados.isEmpty();
    if (_isEmpty) {
      return 1;
    }
    final Function1<Jugador, Long> _function = new Function1<Jugador, Long>() {
      public Long apply(final Jugador it) {
        Long _id = it.getId();
        return Long.valueOf((-(_id).longValue()));
      }
    };
    List<Jugador> _sortBy = IterableExtensions.<Jugador, Long>sortBy(this.interesadosAceptados, _function);
    List<Jugador> _list = IterableExtensions.<Jugador>toList(_sortBy);
    Jugador _get = _list.get(0);
    Long _id = _get.getId();
    return _id.intValue();
  }
  
  public void rechazarInteresado(final Jugador interesado, final String motivo) {
    this.eliminarInteresado(interesado);
    this.rechazados.agregarRechazado(interesado, motivo);
  }
  
  public Jugador getJugador(final Long id) {
    final Function1<Jugador, Boolean> _function = new Function1<Jugador, Boolean>() {
      public Boolean apply(final Jugador jugador) {
        Long _id = jugador.getId();
        return Boolean.valueOf(_id.equals(id));
      }
    };
    return IterableExtensions.<Jugador>findFirst(this.interesadosAceptados, _function);
  }
  
  public List<Jugador> getJugadores() {
    return this.interesadosAceptados;
  }
  
  public Iterable<Jugador> getJugadores(final Jugador jugadorBusqueda) {
    final Function1<Jugador, Boolean> _function = new Function1<Jugador, Boolean>() {
      public Boolean apply(final Jugador jugador) {
        boolean _and = false;
        boolean _and_1 = false;
        String _nombre = jugador.getNombre();
        String _nombre_1 = jugadorBusqueda.getNombre();
        boolean _startsWith = _nombre.startsWith(_nombre_1);
        if (!_startsWith) {
          _and_1 = false;
        } else {
          String _apodo = jugador.getApodo();
          String _apodo_1 = jugadorBusqueda.getApodo();
          boolean _contains = _apodo.contains(_apodo_1);
          _and_1 = _contains;
        }
        if (!_and_1) {
          _and = false;
        } else {
          String _apellido = jugador.getApellido();
          String _apellido_1 = jugadorBusqueda.getApellido();
          boolean _startsWith_1 = _apellido.startsWith(_apellido_1);
          _and = _startsWith_1;
        }
        return Boolean.valueOf(_and);
      }
    };
    return IterableExtensions.<Jugador>filter(this.interesadosAceptados, _function);
  }
}
