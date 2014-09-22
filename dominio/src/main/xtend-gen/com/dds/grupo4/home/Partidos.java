package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Partidos {
  private List<Partido> _partidos = new Function0<List<Partido>>() {
    public List<Partido> apply() {
      ArrayList<Partido> _arrayList = new ArrayList<Partido>();
      return _arrayList;
    }
  }.apply();
  
  public List<Partido> getPartidos() {
    return this._partidos;
  }
  
  public void setPartidos(final List<Partido> partidos) {
    this._partidos = partidos;
  }
  
  public boolean agregarPartido(final Partido partido) {
    List<Partido> _partidos = this.getPartidos();
    boolean _add = _partidos.add(partido);
    return _add;
  }
  
  public boolean quitarPartido(final Partido partido) {
    List<Partido> _partidos = this.getPartidos();
    boolean _remove = _partidos.remove(partido);
    return _remove;
  }
  
  public Iterable<Partido> partidosxJugador(final Jugador jugador) {
    List<Partido> _partidos = this.getPartidos();
    final Function1<Partido,Boolean> _function = new Function1<Partido,Boolean>() {
        public Boolean apply(final Partido partido) {
          Boolean _esUnJugadorFinal = partido.esUnJugadorFinal(jugador);
          return _esUnJugadorFinal;
        }
      };
    Iterable<Partido> _filter = IterableExtensions.<Partido>filter(_partidos, _function);
    return _filter;
  }
}
