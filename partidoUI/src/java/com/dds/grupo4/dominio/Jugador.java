package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Infraccion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.excepciones.HandicapFueraDeRangoException;
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class Jugador {
  @Property
  private Long _id;
  
  @Property
  private String _nombre;
  
  @Property
  private String _apellido;
  
  @Property
  private String _apodo;
  
  @Property
  private LocalDate _fechaNacimiento;
  
  @Property
  private Integer _handicap;
  
  @Property
  private String _mail;
  
  @Property
  private TipoDeInscripcion _tipoDeInscripcion;
  
  @Property
  private List<Jugador> _amigos = new ArrayList<Jugador>();
  
  @Property
  private List<Infraccion> _infracciones = new ArrayList<Infraccion>();
  
  public Jugador() {
  }
  
  public Jugador(final String nombre, final String apellido, final String apodo, final LocalDate nacimiento, final TipoDeInscripcion tipoDeInscripcion) {
    this(nombre, apellido, apodo, nacimiento, tipoDeInscripcion, Integer.valueOf(1));
  }
  
  public Jugador(final String nombre, final String apellido, final String apodo, final LocalDate nacimiento, final TipoDeInscripcion tipoDeInscripcion, final Integer handicap) {
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setApodo(apodo);
    this.setFechaNacimiento(nacimiento);
    this.setTipoDeInscripcion(tipoDeInscripcion);
    this.setHandicap(handicap);
  }
  
  public void setHandicap(final Integer h) {
    if ((!((0 < (h).intValue()) && (10 >= (h).intValue())))) {
      throw new HandicapFueraDeRangoException("Solo se acepta handicap entre 1 y 10");
    }
    this._handicap = h;
  }
  
  public Integer edad() {
    LocalDate _now = LocalDate.now();
    int _year = _now.getYear();
    LocalDate _fechaNacimiento = this.getFechaNacimiento();
    int _year_1 = _fechaNacimiento.getYear();
    return Integer.valueOf((_year - _year_1));
  }
  
  public void inscribite(final Partido partido) {
    partido.inscribirA(this);
  }
  
  public void cambiarTipoDeInscripcion(final TipoDeInscripcion inscripcion) {
    this.setTipoDeInscripcion(inscripcion);
  }
  
  public void agregarAmigo(final Jugador interesado) {
    List<Jugador> _amigos = this.getAmigos();
    _amigos.add(interesado);
  }
  
  public List<String> mailsAmigos() {
    List<Jugador> _amigos = this.getAmigos();
    final Function1<Jugador, String> _function = new Function1<Jugador, String>() {
      public String apply(final Jugador amigo) {
        return amigo.getMail();
      }
    };
    return ListExtensions.<Jugador, String>map(_amigos, _function);
  }
  
  public Boolean estasConfirmado(final Partido partido) {
    TipoDeInscripcion _tipoDeInscripcion = this.getTipoDeInscripcion();
    return _tipoDeInscripcion.estasConfirmado(partido);
  }
  
  public Integer getPrioridad() {
    TipoDeInscripcion _tipoDeInscripcion = this.getTipoDeInscripcion();
    return _tipoDeInscripcion.getPrioridad();
  }
  
  public boolean agregarInfraccion(final String motivo) {
    List<Infraccion> _infracciones = this.getInfracciones();
    LocalDate _now = LocalDate.now();
    Infraccion _infraccion = new Infraccion(motivo, _now);
    return _infracciones.add(_infraccion);
  }
  
  public Integer cantidadInfracciones() {
    List<Infraccion> _infracciones = this.getInfracciones();
    return Integer.valueOf(_infracciones.size());
  }
  
  public boolean equals(final Jugador i) {
    boolean _and = false;
    boolean _and_1 = false;
    String _nombre = this.getNombre();
    String _nombre_1 = i.getNombre();
    boolean _equalsIgnoreCase = _nombre.equalsIgnoreCase(_nombre_1);
    if (!_equalsIgnoreCase) {
      _and_1 = false;
    } else {
      String _apellido = this.getApellido();
      String _apellido_1 = i.getApellido();
      boolean _equalsIgnoreCase_1 = _apellido.equalsIgnoreCase(_apellido_1);
      _and_1 = _equalsIgnoreCase_1;
    }
    if (!_and_1) {
      _and = false;
    } else {
      LocalDate _fechaNacimiento = this.getFechaNacimiento();
      LocalDate _fechaNacimiento_1 = i.getFechaNacimiento();
      boolean _equals = _fechaNacimiento.equals(_fechaNacimiento_1);
      _and = _equals;
    }
    return _and;
  }
  
  @Pure
  public Long getId() {
    return this._id;
  }
  
  public void setId(final Long id) {
    this._id = id;
  }
  
  @Pure
  public String getNombre() {
    return this._nombre;
  }
  
  public void setNombre(final String nombre) {
    this._nombre = nombre;
  }
  
  @Pure
  public String getApellido() {
    return this._apellido;
  }
  
  public void setApellido(final String apellido) {
    this._apellido = apellido;
  }
  
  @Pure
  public String getApodo() {
    return this._apodo;
  }
  
  public void setApodo(final String apodo) {
    this._apodo = apodo;
  }
  
  @Pure
  public LocalDate getFechaNacimiento() {
    return this._fechaNacimiento;
  }
  
  public void setFechaNacimiento(final LocalDate fechaNacimiento) {
    this._fechaNacimiento = fechaNacimiento;
  }
  
  @Pure
  public Integer getHandicap() {
    return this._handicap;
  }
  
  @Pure
  public String getMail() {
    return this._mail;
  }
  
  public void setMail(final String mail) {
    this._mail = mail;
  }
  
  @Pure
  public TipoDeInscripcion getTipoDeInscripcion() {
    return this._tipoDeInscripcion;
  }
  
  public void setTipoDeInscripcion(final TipoDeInscripcion tipoDeInscripcion) {
    this._tipoDeInscripcion = tipoDeInscripcion;
  }
  
  @Pure
  public List<Jugador> getAmigos() {
    return this._amigos;
  }
  
  public void setAmigos(final List<Jugador> amigos) {
    this._amigos = amigos;
  }
  
  @Pure
  public List<Infraccion> getInfracciones() {
    return this._infracciones;
  }
  
  public void setInfracciones(final List<Infraccion> infracciones) {
    this._infracciones = infracciones;
  }
}
