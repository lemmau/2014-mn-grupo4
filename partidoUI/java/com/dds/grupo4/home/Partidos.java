package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;

@SuppressWarnings("all")
public class Partidos {
  private /* List<Partido> */Object partidos /* Skipped initializer because of errors */;
  
  /**
   * singleton
   */
  private static Partidos instance;
  
  private Partidos() {
    throw new Error("Unresolved compilation problems:"
      + "\nArrayList cannot be resolved.");
  }
  
  public static Partidos getInstance() {
    throw new Error("Unresolved compilation problems:"
      + "\n== cannot be resolved.");
  }
  
  /**
   * fin singleton
   */
  public Object agregarPartido(final Partido partido) {
    throw new Error("Unresolved compilation problems:"
      + "\nLong cannot be resolved."
      + "\nThe method longValue is undefined for the type Partidos"
      + "\nThe field id is not visible"
      + "\n+ cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public int ultimoIdUtilizado() {
    throw new Error("Unresolved compilation problems:"
      + "\nisEmpty cannot be resolved"
      + "\nsortBy cannot be resolved"
      + "\nid cannot be resolved"
      + "\n- cannot be resolved"
      + "\ntoList cannot be resolved"
      + "\nget cannot be resolved"
      + "\nid cannot be resolved"
      + "\nintValue cannot be resolved");
  }
  
  public Object quitarPartido(final Partido partido) {
    throw new Error("Unresolved compilation problems:"
      + "\nremove cannot be resolved");
  }
  
  public Object partidosxJugador(final Jugador jugador) {
    throw new Error("Unresolved compilation problems:"
      + "\nfilter cannot be resolved"
      + "\nesUnJugadorFinal cannot be resolved");
  }
  
  public Object getPartido(final /* Long */Object id) {
    throw new Error("Unresolved compilation problems:"
      + "\nfindFirst cannot be resolved"
      + "\nid cannot be resolved"
      + "\nequals cannot be resolved");
  }
  
  public List getPartidos() {
    return this.partidos;
  }
}
