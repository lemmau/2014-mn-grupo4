package com.dds.grupo4.dominio;

import com.dds.grupo4.divisorequipos.DivisorDeEquipos;
import com.dds.grupo4.dominio.Admin;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.observadores.InscripcionObserver;
import com.dds.grupo4.ordenamiento.CriterioOrden;

@SuppressWarnings("all")
public class Partido {
  private final static int MIN_CANTIDAD_JUGADORES = 0;
  
  private final static int MAX_CANTIDAD_JUGADORES = 10;
  
  private static boolean INSCRIPCION_CERRADA = false;
  
  /* @Property
   */private /* Long */Object id;
  
  /* @Property
   */private /* LocalDate */Object fechaInicio;
  
  /* @Property
   */private /* List<Inscripcion> */Object inscripciones /* Skipped initializer because of errors */;
  
  /* @Property
   */private Admin admin;
  
  /* @Property
   */private /* List<Jugador> */Object jugadoresDelPartido /* Skipped initializer because of errors */;
  
  /* @Property
   */private /* List<Inscripcion> */Object equipoA /* Skipped initializer because of errors */;
  
  /* @Property
   */private /* List<Inscripcion> */Object equipoB /* Skipped initializer because of errors */;
  
  /* @Property
   */private /* List<CriterioOrden> */Object criteriosOrden /* Skipped initializer because of errors */;
  
  /* @Property
   */private /* List<InscripcionObserver> */Object observadores /* Skipped initializer because of errors */;
  
  public Partido(final Admin admin) {
    this.admin = admin;
  }
  
  public void inscribirA(final Jugador nuevoInteresado) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved"
      + "\nsortBy cannot be resolved"
      + "\njugador cannot be resolved"
      + "\ngetPrioridad cannot be resolved");
  }
  
  public Object notificarInscripcion(final Inscripcion inscripcion) {
    throw new Error("Unresolved compilation problems:"
      + "\nforEach cannot be resolved"
      + "\nnotificarNuevaInscripcion cannot be resolved");
  }
  
  public Object notificarBajaInscripcion() {
    throw new Error("Unresolved compilation problems:"
      + "\nforEach cannot be resolved"
      + "\nnotificarBajaInscripcion cannot be resolved");
  }
  
  public void inscribirTodos(final /* List<Jugador> */Object nuevosInteresados) {
    throw new Error("Unresolved compilation problems:"
      + "\nforEach cannot be resolved");
  }
  
  public /* List<Inscripcion> */Object jugadoresFinales() {
    throw new Error("Unresolved compilation problems:"
      + "\nIndexOutOfBoundsException cannot be resolved to a type."
      + "\nNo exception of type IndexOutOfBoundsException can be thrown; an exception type must be a subclass of Throwable"
      + "\nfilter cannot be resolved"
      + "\njugador cannot be resolved"
      + "\nestasConfirmado cannot be resolved"
      + "\ntoList cannot be resolved"
      + "\nsubList cannot be resolved");
  }
  
  public boolean cerrarInscripcion() {
    return Partido.INSCRIPCION_CERRADA = true;
  }
  
  public Object cantidadInteresados() {
    throw new Error("Unresolved compilation problems:"
      + "\nsize cannot be resolved");
  }
  
  public /* Boolean */Object esUnInteresado(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\nfilter cannot be resolved"
      + "\njugador cannot be resolved"
      + "\nequals cannot be resolved"
      + "\nsize cannot be resolved"
      + "\n!= cannot be resolved");
  }
  
  public /* Boolean */Object esUnJugadorFinal(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\nfilter cannot be resolved"
      + "\njugador cannot be resolved"
      + "\nequals cannot be resolved"
      + "\nsize cannot be resolved"
      + "\n!= cannot be resolved");
  }
  
  public Inscripcion obtenerInscripcion(final Jugador jugador) {
    return this.obtenerInscripcion(jugador, this.inscripciones);
  }
  
  public Inscripcion obtenerInscripcion(final Jugador interesado, final /* List<Inscripcion> */Object lista) {
    throw new Error("Unresolved compilation problems:"
      + "\n== cannot be resolved."
      + "\nfindFirst cannot be resolved"
      + "\njugador cannot be resolved"
      + "\nequals cannot be resolved");
  }
  
  public Object quitarJugador(final Jugador jugador) {
    throw new Error("Unresolved compilation problems:"
      + "\nremove cannot be resolved");
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
    List _jugadoresFinales = this.jugadoresFinales();
    return this.obtenerInscripcion(jugador, _jugadoresFinales);
  }
  
  public void calificarA(final Jugador jugador, final /* Integer */Object puntaje, final /* String */Object critica) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    _obtenerJugadorFinal.calificar(puntaje, critica);
  }
  
  public /* Integer */Object cantidadCalificaciones(final Jugador jugador) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    return _obtenerJugadorFinal.cantidadCalificaciones();
  }
  
  public /* Double */Object promedioCalificaciones(final Jugador jugador) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    return _obtenerJugadorFinal.promedioCalificaciones();
  }
  
  public /* Double */Object promedioNCalificaciones(final Jugador jugador, final /* Integer */Object ultimasN) {
    Inscripcion _obtenerJugadorFinal = this.obtenerJugadorFinal(jugador);
    return _obtenerJugadorFinal.promedioUltimasCalificaciones(ultimasN);
  }
  
  public Object agregarCriterioOrdenamiento(final CriterioOrden criterio) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved");
  }
  
  public Object quitarCriterioOrdenamiento(final CriterioOrden criterio) {
    throw new Error("Unresolved compilation problems:"
      + "\nremove cannot be resolved");
  }
  
  public Object eliminarCriteriosOrdenamiento() {
    throw new Error("Unresolved compilation problems:"
      + "\nclear cannot be resolved");
  }
  
  public Object agregarObservador(final InscripcionObserver observador) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved");
  }
  
  public Object quitarObservador(final InscripcionObserver observador) {
    throw new Error("Unresolved compilation problems:"
      + "\nremove cannot be resolved");
  }
  
  public Object eliminarObservadores() {
    throw new Error("Unresolved compilation problems:"
      + "\nclear cannot be resolved");
  }
  
  public Object ordenarJugadoresFinales() {
    throw new Error("Unresolved compilation problems:"
      + "\nempty cannot be resolved"
      + "\nsortBy cannot be resolved"
      + "\nmap cannot be resolved"
      + "\nobtenerValor cannot be resolved"
      + "\nreduce cannot be resolved"
      + "\n+ cannot be resolved");
  }
  
  public void generarEquiposTentativos(final DivisorDeEquipos criterio) {
    this.validarInscripcion();
    Object _ordenarJugadoresFinales = this.ordenarJugadoresFinales();
    criterio.dividirEnEquipos(_ordenarJugadoresFinales);
  }
  
  public void validarInscripcion() {
    throw new Error("Unresolved compilation problems:"
      + "\n! cannot be resolved."
      + "\n|| cannot be resolved"
      + "\nsize cannot be resolved"
      + "\n< cannot be resolved");
  }
  
  public Object agregarJugadorEquipoA(final Inscripcion inscripcion) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved");
  }
  
  public Object agregarJugadorEquipoB(final Inscripcion inscripcion) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved");
  }
}
