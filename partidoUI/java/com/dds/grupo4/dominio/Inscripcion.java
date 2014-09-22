package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Calificacion;
import com.dds.grupo4.dominio.Jugador;

@SuppressWarnings("all")
public class Inscripcion {
  private final static int MAX_CALIFICACIONES_XPARTIDO = 9;
  
  /* @Property
   */private Jugador jugador;
  
  /* @Property
   */private /* List<Calificacion> */Object calificaciones /* Skipped initializer because of errors */;
  
  public Inscripcion(final Jugador interesado) {
    this.jugador = interesado;
  }
  
  public void calificar(final /* Integer */Object puntaje, final /* String */Object critica) {
    throw new Error("Unresolved compilation problems:"
      + "\n>= cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public /* Integer */Object sumaCalificaciones() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field _calificaciones is undefined for the type Inscripcion");
  }
  
  public /* Integer */Object sumaCalificaciones(final /* List<Calificacion> */Object calificaciones) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field nota is undefined for the type Inscripcion"
      + "\nmap cannot be resolved"
      + "\nreduce cannot be resolved"
      + "\n+ cannot be resolved");
  }
  
  public /* Integer */Object cantidadCalificaciones() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field _calificaciones is undefined for the type Inscripcion");
  }
  
  public /* Integer */Object cantidadCalificaciones(final /* List<Calificacion> */Object calificaciones) {
    throw new Error("Unresolved compilation problems:"
      + "\nsize cannot be resolved");
  }
  
  private /* Double */Object promedio(final /* List<Calificacion> */Object calificaciones) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method equals is undefined for the type Inscripcion"
      + "\nDouble cannot be resolved."
      + "\nCannot cast from Integer to double"
      + "\n/ cannot be resolved");
  }
  
  public /* Double */Object promedioCalificaciones() {
    return this.promedio(this.calificaciones);
  }
  
  public /* Double */Object promedioUltimasCalificaciones(final /* Integer */Object ultimasN) {
    throw new Error("Unresolved compilation problems:"
      + "\nIndexOutOfBoundsException cannot be resolved to a type."
      + "\nNo exception of type IndexOutOfBoundsException can be thrown; an exception type must be a subclass of Throwable"
      + "\nsubList cannot be resolved"
      + "\n- cannot be resolved"
      + "\n+ cannot be resolved"
      + "\nsize cannot be resolved");
  }
}
