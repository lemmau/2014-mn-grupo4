package com.dds.grupo4;

import com.dds.grupo4.divisorequipos.DivisorDeEquipos;
import com.dds.grupo4.divisorequipos.NumerosFijos;
import com.dds.grupo4.divisorequipos.ParImpar;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import com.google.common.collect.Lists;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class DivisorEquiposTest {
  private Partido partido;
  
  private List<Jugador> jugadores;
  
  private Jugador jugadorEstandar0;
  
  private Jugador jugadorEstandar1;
  
  private Jugador jugadorEstandar2;
  
  private Jugador jugadorEstandar3;
  
  private Jugador jugadorEstandar4;
  
  private Jugador jugadorEstandar5;
  
  private Jugador jugadorEstandar6;
  
  private Jugador jugadorEstandar7;
  
  private Jugador jugadorEstandar8;
  
  private Jugador jugadorEstandar9;
  
  private Jugador jugadorEstandar10;
  
  @Before
  public void setUp() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDateTime is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nThe method or field LocalDate is undefined for the type DivisorEquiposTest"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved");
  }
  
  @Test
  public void dividirEquiposxNumerosFijos() {
    NumerosFijos _numerosFijos = new NumerosFijos(this.partido);
    final DivisorDeEquipos divisor = _numerosFijos;
    List<Inscripcion> _inscripciones = this.partido.getInscripciones();
    divisor.dividirEnEquipos(_inscripciones);
    final List<String> esperadoA = Collections.<String>unmodifiableList(Lists.<String>newArrayList("B", "E", "F", "J", "K"));
    final List<String> esperadoB = Collections.<String>unmodifiableList(Lists.<String>newArrayList("A", "C", "D", "G", "I"));
    List<Inscripcion> _equipoA = this.partido.getEquipoA();
    final Function1<Inscripcion,String> _function = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    List<String> _map = ListExtensions.<Inscripcion, String>map(_equipoA, _function);
    Assert.assertEquals(esperadoA, _map);
    List<Inscripcion> _equipoB = this.partido.getEquipoB();
    final Function1<Inscripcion,String> _function_1 = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    List<String> _map_1 = ListExtensions.<Inscripcion, String>map(_equipoB, _function_1);
    Assert.assertEquals(esperadoB, _map_1);
  }
  
  @Test
  public void dividirEquiposxParImpar() {
    ParImpar _parImpar = new ParImpar(this.partido);
    final DivisorDeEquipos divisor = _parImpar;
    List<Inscripcion> _inscripciones = this.partido.getInscripciones();
    divisor.dividirEnEquipos(_inscripciones);
    final List<String> esperadoA = Collections.<String>unmodifiableList(Lists.<String>newArrayList("A", "C", "E", "G", "J"));
    final List<String> esperadoB = Collections.<String>unmodifiableList(Lists.<String>newArrayList("B", "D", "F", "I", "K"));
    List<Inscripcion> _equipoA = this.partido.getEquipoA();
    final Function1<Inscripcion,String> _function = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    List<String> _map = ListExtensions.<Inscripcion, String>map(_equipoA, _function);
    Assert.assertEquals(esperadoA, _map);
    List<Inscripcion> _equipoB = this.partido.getEquipoB();
    final Function1<Inscripcion,String> _function_1 = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    List<String> _map_1 = ListExtensions.<Inscripcion, String>map(_equipoB, _function_1);
    Assert.assertEquals(esperadoB, _map_1);
  }
}
