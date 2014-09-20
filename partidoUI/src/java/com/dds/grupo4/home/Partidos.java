package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Partidos {
  private List<Partido> partidos = new ArrayList<Partido>();
  
  /**
   * singleton
   */
  private static Partidos instance;
  
  private Partidos() {
    ArrayList<Partido> _arrayList = new ArrayList<Partido>();
    this.partidos = _arrayList;
  }
  
  public static Partidos getInstance() {
    Partidos _xblockexpression = null;
    {
      boolean _equals = Objects.equal(Partidos.instance, null);
      if (_equals) {
        Partidos _partidos = new Partidos();
        Partidos.instance = _partidos;
      }
      _xblockexpression = Partidos.instance;
    }
    return _xblockexpression;
  }
  
  /**
   * fin singleton
   */
  public boolean agregarPartido(final Partido partido) {
    boolean _xblockexpression = false;
    {
      int _ultimoIdUtilizado = this.ultimoIdUtilizado();
      long _longValue = Integer.valueOf(_ultimoIdUtilizado).longValue();
      long _plus = (_longValue + 1);
      Long _long = new Long(_plus);
      partido.setId(_long);
      _xblockexpression = this.partidos.add(partido);
    }
    return _xblockexpression;
  }
  
  public int ultimoIdUtilizado() {
    boolean _isEmpty = this.partidos.isEmpty();
    if (_isEmpty) {
      return 1;
    }
    final Function1<Partido, Long> _function = new Function1<Partido, Long>() {
      public Long apply(final Partido it) {
        Long _id = it.getId();
        return Long.valueOf((-(_id).longValue()));
      }
    };
    List<Partido> _sortBy = IterableExtensions.<Partido, Long>sortBy(this.partidos, _function);
    List<Partido> _list = IterableExtensions.<Partido>toList(_sortBy);
    Partido _get = _list.get(0);
    Long _id = _get.getId();
    return _id.intValue();
  }
  
  public boolean quitarPartido(final Partido partido) {
    return this.partidos.remove(partido);
  }
  
  public Iterable<Partido> partidosxJugador(final Jugador jugador) {
    final Function1<Partido, Boolean> _function = new Function1<Partido, Boolean>() {
      public Boolean apply(final Partido partido) {
        return partido.esUnJugadorFinal(jugador);
      }
    };
    return IterableExtensions.<Partido>filter(this.partidos, _function);
  }
  
  public Partido getPartido(final Long id) {
    final Function1<Partido, Boolean> _function = new Function1<Partido, Boolean>() {
      public Boolean apply(final Partido partido) {
        Long _id = partido.getId();
        return Boolean.valueOf(_id.equals(id));
      }
    };
    return IterableExtensions.<Partido>findFirst(this.partidos, _function);
  }
  
  public List<Partido> getPartidos() {
    return this.partidos;
  }
}
