package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.home.InteresadosRechazados;

@SuppressWarnings("all")
public class TodosLosJugadores {
  private /* List<Jugador> */Object interesadosPendientes /* Skipped initializer because of errors */;
  
  private /* List<Jugador> */Object interesadosAceptados /* Skipped initializer because of errors */;
  
  private InteresadosRechazados rechazados = new InteresadosRechazados();
  
  /**
   * singleton
   */
  private static TodosLosJugadores instance;
  
  private TodosLosJugadores() {
    throw new Error("Unresolved compilation problems:"
      + "\nArrayList cannot be resolved."
      + "\nArrayList cannot be resolved.");
  }
  
  public static TodosLosJugadores getInstance() {
    throw new Error("Unresolved compilation problems:"
      + "\n== cannot be resolved.");
  }
  
  /**
   * fin singleton
   */
  public Object esUnInteresadoDelSistema(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\ncontains cannot be resolved");
  }
  
  public Object esUnInteresadoAceptado(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\ncontains cannot be resolved");
  }
  
  public Object esUnInteresadoRechazado(final Jugador interesado) {
    return this.rechazados.esUnInteresadoRechazado(interesado);
  }
  
  public void eliminarInteresado(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\nremove cannot be resolved"
      + "\n! cannot be resolved");
  }
  
  public Object getInteresadosDelSistema() {
    throw new Error("Unresolved compilation problems:"
      + "\nclone cannot be resolved");
  }
  
  public Object getInteresadosAceptados() {
    throw new Error("Unresolved compilation problems:"
      + "\nclone cannot be resolved");
  }
  
  public /* Integer */Object cantInteresadosPendientes() {
    throw new Error("Unresolved compilation problems:"
      + "\nsize cannot be resolved");
  }
  
  public /* Integer */Object cantInteresadosAceptados() {
    throw new Error("Unresolved compilation problems:"
      + "\nsize cannot be resolved");
  }
  
  public /* Integer */Object cantInteresadosRechazados() {
    return this.rechazados.getCantInteresadosRechazados();
  }
  
  public Object proponerJugador(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved");
  }
  
  public Object aceptarInteresado(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\nLong cannot be resolved."
      + "\nThe method longValue is undefined for the type TodosLosJugadores"
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
  
  public void rechazarInteresado(final Jugador interesado, final /* String */Object motivo) {
    this.eliminarInteresado(interesado);
    this.rechazados.agregarRechazado(interesado, motivo);
  }
  
  public Object getJugador(final /* Long */Object id) {
    throw new Error("Unresolved compilation problems:"
      + "\nfindFirst cannot be resolved"
      + "\nid cannot be resolved"
      + "\nequals cannot be resolved");
  }
  
  public List getJugadores() {
    return this.interesadosAceptados;
  }
  
  public Object getJugadores(final Jugador jugadorBusqueda) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field nombre is not visible"
      + "\nThe field apodo is not visible"
      + "\nThe field apellido is not visible"
      + "\nfilter cannot be resolved"
      + "\nnombre cannot be resolved"
      + "\nstartsWith cannot be resolved"
      + "\n&& cannot be resolved"
      + "\napodo cannot be resolved"
      + "\ncontains cannot be resolved"
      + "\n&& cannot be resolved"
      + "\napellido cannot be resolved"
      + "\nstartsWith cannot be resolved");
  }
}
