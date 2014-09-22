package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Infraccion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;

@SuppressWarnings("all")
public class Jugador {
  /* @Property
   */private /* Long */Object id;
  
  /* @Property
   */private /* String */Object nombre;
  
  /* @Property
   */private /* String */Object apellido;
  
  /* @Property
   */private /* String */Object apodo;
  
  /* @Property
   */private /* LocalDate */Object fechaNacimiento;
  
  /* @Property
   */private /* Integer */Object handicap;
  
  /* @Property
   */private /* String */Object mail;
  
  /* @Property
   */private TipoDeInscripcion tipoDeInscripcion;
  
  /* @Property
   */private /* List<Jugador> */Object amigos /* Skipped initializer because of errors */;
  
  /* @Property
   */private /* List<Infraccion> */Object infracciones /* Skipped initializer because of errors */;
  
  public Jugador() {
  }
  
  public Jugador(final /* String */Object nombre, final /* String */Object apellido, final /* String */Object apodo, final /* LocalDate */Object nacimiento, final TipoDeInscripcion tipoDeInscripcion) {
    this(nombre, apellido, apodo, nacimiento, tipoDeInscripcion, int.valueOf(1));
  }
  
  public Jugador(final /* String */Object nombre, final /* String */Object apellido, final /* String */Object apodo, final /* LocalDate */Object nacimiento, final TipoDeInscripcion tipoDeInscripcion, final /* Integer */Object handicap) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.apodo = apodo;
    this.fechaNacimiento = nacimiento;
    this.tipoDeInscripcion = tipoDeInscripcion;
    this.setHandicap(handicap);
  }
  
  public void setHandicap(final /* Integer */Object h) {
    throw new Error("Unresolved compilation problems:"
      + "\n< cannot be resolved."
      + "\n>= cannot be resolved."
      + "\nThe method or field _handicap is undefined for the type Jugador"
      + "\n&& cannot be resolved"
      + "\n! cannot be resolved");
  }
  
  public /* Integer */Object edad() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDate is undefined for the type Jugador"
      + "\nnow cannot be resolved"
      + "\ngetYear cannot be resolved"
      + "\n- cannot be resolved"
      + "\ngetYear cannot be resolved");
  }
  
  public void inscribite(final Partido partido) {
    partido.inscribirA(this);
  }
  
  public void cambiarTipoDeInscripcion(final TipoDeInscripcion inscripcion) {
    this.tipoDeInscripcion = inscripcion;
  }
  
  public void agregarAmigo(final Jugador interesado) {
    throw new Error("Unresolved compilation problems:"
      + "\nadd cannot be resolved");
  }
  
  public /* List<String> */Object mailsAmigos() {
    throw new Error("Unresolved compilation problems:"
      + "\nmap cannot be resolved"
      + "\nmail cannot be resolved");
  }
  
  public Boolean estasConfirmado(final Partido partido) {
    return this.tipoDeInscripcion.estasConfirmado(partido);
  }
  
  public /* Integer */Object getPrioridad() {
    return this.tipoDeInscripcion.getPrioridad();
  }
  
  public Object agregarInfraccion(final /* String */Object motivo) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDate is undefined for the type Jugador"
      + "\nadd cannot be resolved"
      + "\nnow cannot be resolved");
  }
  
  public /* Integer */Object cantidadInfracciones() {
    throw new Error("Unresolved compilation problems:"
      + "\nsize cannot be resolved");
  }
  
  public Object equals(final Jugador i) {
    throw new Error("Unresolved compilation problems:"
      + "\nequalsIgnoreCase cannot be resolved"
      + "\n&& cannot be resolved"
      + "\nequalsIgnoreCase cannot be resolved"
      + "\n&& cannot be resolved"
      + "\nequals cannot be resolved");
  }
}
