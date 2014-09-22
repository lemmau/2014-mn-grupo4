package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException;
import com.dds.grupo4.home.InteresadosRechazados;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;

@SuppressWarnings("all")
public class TodosLosJugadores {
  private List<Jugador> interesadosPendientes = new Function0<List<Jugador>>() {
    public List<Jugador> apply() {
      ArrayList<Jugador> _arrayList = new ArrayList<Jugador>();
      return _arrayList;
    }
  }.apply();
  
  private List<Jugador> interesadosAceptados = new Function0<List<Jugador>>() {
    public List<Jugador> apply() {
      ArrayList<Jugador> _arrayList = new ArrayList<Jugador>();
      return _arrayList;
    }
  }.apply();
  
  private InteresadosRechazados rechazados = new Function0<InteresadosRechazados>() {
    public InteresadosRechazados apply() {
      InteresadosRechazados _interesadosRechazados = new InteresadosRechazados();
      return _interesadosRechazados;
    }
  }.apply();
  
  public boolean esUnInteresadoDelSistema(final Jugador interesado) {
    boolean _contains = this.interesadosPendientes.contains(interesado);
    return _contains;
  }
  
  public boolean esUnInteresadoAceptado(final Jugador interesado) {
    boolean _contains = this.interesadosAceptados.contains(interesado);
    return _contains;
  }
  
  public boolean esUnInteresadoRechazado(final Jugador interesado) {
    boolean _esUnInteresadoRechazado = this.rechazados.esUnInteresadoRechazado(interesado);
    return _esUnInteresadoRechazado;
  }
  
  public void eliminarInteresado(final Jugador interesado) {
    boolean _remove = this.interesadosPendientes.remove(interesado);
    boolean _not = (!_remove);
    if (_not) {
      NoExisteJugadorPendienteException _noExisteJugadorPendienteException = new NoExisteJugadorPendienteException("El jugador no existe entre los pendientes de aprobacion");
      throw _noExisteJugadorPendienteException;
    }
  }
  
  public Jugador[] getInteresadosDelSistema() {
    Jugador[] _clone = ((Jugador[])Conversions.unwrapArray(this.interesadosPendientes, Jugador.class)).clone();
    return _clone;
  }
  
  public Jugador[] getInteresadosAceptados() {
    Jugador[] _clone = ((Jugador[])Conversions.unwrapArray(this.interesadosAceptados, Jugador.class)).clone();
    return _clone;
  }
  
  public Integer cantInteresadosPendientes() {
    int _size = this.interesadosPendientes.size();
    return Integer.valueOf(_size);
  }
  
  public Integer cantInteresadosAceptados() {
    int _size = this.interesadosAceptados.size();
    return Integer.valueOf(_size);
  }
  
  public Integer cantInteresadosRechazados() {
    Integer _cantInteresadosRechazados = this.rechazados.getCantInteresadosRechazados();
    return _cantInteresadosRechazados;
  }
  
  public boolean proponerJugador(final Jugador interesado) {
    boolean _add = this.interesadosPendientes.add(interesado);
    return _add;
  }
  
  public boolean aceptarInteresado(final Jugador interesado) {
    boolean _xblockexpression = false;
    {
      this.eliminarInteresado(interesado);
      boolean _add = this.interesadosAceptados.add(interesado);
      _xblockexpression = (_add);
    }
    return _xblockexpression;
  }
  
  public void rechazarInteresado(final Jugador interesado, final String motivo) {
    this.eliminarInteresado(interesado);
    this.rechazados.agregarRechazado(interesado, motivo);
  }
}
