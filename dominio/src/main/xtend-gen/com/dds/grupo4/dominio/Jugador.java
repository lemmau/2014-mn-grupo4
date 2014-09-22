package com.dds.grupo4.dominio;

import com.dds.grupo4.dominio.Infraccion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.excepciones.HandicapFueraDeRangoException;
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Jugador {
  private Long _id;
  
  public Long getId() {
    return this._id;
  }
  
  public void setId(final Long id) {
    this._id = id;
  }
  
  private String _nombre;
  
  public String getNombre() {
    return this._nombre;
  }
  
  public void setNombre(final String nombre) {
    this._nombre = nombre;
  }
  
  private String _apellido;
  
  public String getApellido() {
    return this._apellido;
  }
  
  public void setApellido(final String apellido) {
    this._apellido = apellido;
  }
  
  private String _apodo;
  
  public String getApodo() {
    return this._apodo;
  }
  
  public void setApodo(final String apodo) {
    this._apodo = apodo;
  }
  
  private /* LocalDate */Object _fechaNacimiento;
  
  public /* LocalDate */Object getFechaNacimiento() {
    return this._fechaNacimiento;
  }
  
  public void setFechaNacimiento(final /* LocalDate */Object fechaNacimiento) {
    this._fechaNacimiento = fechaNacimiento;
  }
  
  private Integer _handicap;
  
  public Integer getHandicap() {
    return this._handicap;
  }
  
  private String _mail;
  
  public String getMail() {
    return this._mail;
  }
  
  public void setMail(final String mail) {
    this._mail = mail;
  }
  
  private List<Jugador> _amigos = new Function0<List<Jugador>>() {
    public List<Jugador> apply() {
      ArrayList<Jugador> _arrayList = new ArrayList<Jugador>();
      return _arrayList;
    }
  }.apply();
  
  public List<Jugador> getAmigos() {
    return this._amigos;
  }
  
  public void setAmigos(final List<Jugador> amigos) {
    this._amigos = amigos;
  }
  
  private TipoDeInscripcion _tipoDeInscripcion;
  
  public TipoDeInscripcion getTipoDeInscripcion() {
    return this._tipoDeInscripcion;
  }
  
  public void setTipoDeInscripcion(final TipoDeInscripcion tipoDeInscripcion) {
    this._tipoDeInscripcion = tipoDeInscripcion;
  }
  
  private List<Infraccion> _infracciones = new Function0<List<Infraccion>>() {
    public List<Infraccion> apply() {
      ArrayList<Infraccion> _arrayList = new ArrayList<Infraccion>();
      return _arrayList;
    }
  }.apply();
  
  public List<Infraccion> getInfracciones() {
    return this._infracciones;
  }
  
  public void setInfracciones(final List<Infraccion> infracciones) {
    this._infracciones = infracciones;
  }
  
  public Jugador(final String nombre, final String apellido, final /* LocalDate */Object nacimiento, final TipoDeInscripcion tipoDeInscripcion) {
    this(nombre, apellido, nacimiento, tipoDeInscripcion, Integer.valueOf(1));
  }
  
  public Jugador(final String nombre, final String apellido, final /* LocalDate */Object nacimiento, final TipoDeInscripcion tipoDeInscripcion, final Integer handicap) {
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setFechaNacimiento(nacimiento);
    this.setTipoDeInscripcion(tipoDeInscripcion);
    this.setHandicap(handicap);
  }
  
  public void setHandicap(final Integer h) {
    boolean _and = false;
    boolean _lessThan = (0 < (h).intValue());
    if (!_lessThan) {
      _and = false;
    } else {
      boolean _greaterEqualsThan = (10 >= (h).intValue());
      _and = (_lessThan && _greaterEqualsThan);
    }
    boolean _not = (!_and);
    if (_not) {
      HandicapFueraDeRangoException _handicapFueraDeRangoException = new HandicapFueraDeRangoException("Solo se acepta handicap entre 1 y 10");
      throw _handicapFueraDeRangoException;
    }
    this._handicap = h;
  }
  
  public Integer edad() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDate is undefined for the type Jugador"
      + "\nnow cannot be resolved"
      + "\nyear cannot be resolved"
      + "\n- cannot be resolved"
      + "\nyear cannot be resolved");
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
    final Function1<Jugador,String> _function = new Function1<Jugador,String>() {
        public String apply(final Jugador amigo) {
          String _mail = amigo.getMail();
          return _mail;
        }
      };
    List<String> _map = ListExtensions.<Jugador, String>map(_amigos, _function);
    return _map;
  }
  
  public Boolean estasConfirmado(final Partido partido) {
    TipoDeInscripcion _tipoDeInscripcion = this.getTipoDeInscripcion();
    Boolean _estasConfirmado = _tipoDeInscripcion.estasConfirmado(partido);
    return _estasConfirmado;
  }
  
  public Integer getPrioridad() {
    TipoDeInscripcion _tipoDeInscripcion = this.getTipoDeInscripcion();
    Integer _prioridad = _tipoDeInscripcion.getPrioridad();
    return _prioridad;
  }
  
  public boolean agregarInfraccion(final String motivo) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDateTime is undefined for the type Jugador"
      + "\nnow cannot be resolved");
  }
  
  public Integer cantidadInfracciones() {
    List<Infraccion> _infracciones = this.getInfracciones();
    int _size = _infracciones.size();
    return Integer.valueOf(_size);
  }
  
  public boolean equals(final Jugador i) {
    throw new Error("Unresolved compilation problems:"
      + "\nequals cannot be resolved");
  }
}
