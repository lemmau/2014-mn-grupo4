package com.dds.grupo4;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.excepciones.FaltaDefinirCriterioDeOrdenException;
import com.dds.grupo4.ordenamiento.Handicap;
import com.dds.grupo4.ordenamiento.PromedioCalificaciones;
import com.dds.grupo4.ordenamiento.PromedioUltimosPartidos;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class OrdenamientoTest {
  private List<Partido> partidos = new Function0<List<Partido>>() {
    public List<Partido> apply() {
      ArrayList<Partido> _arrayList = new ArrayList<Partido>();
      return _arrayList;
    }
  }.apply();
  
  private Partido partido;
  
  private Partido partido2;
  
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
      + "\nThe method or field LocalDateTime is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDateTime is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
      + "\nThe method or field LocalDate is undefined for the type OrdenamientoTest"
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
      + "\nof cannot be resolved"
      + "\nof cannot be resolved");
  }
  
  @Test
  public void verificarOrdenamientoxHandicap() {
    Handicap _handicap = new Handicap();
    this.partido.agregarCriterioOrdenamiento(_handicap);
    final List<Inscripcion> ordenados = this.partido.ordenarJugadoresFinales();
    final List<Integer> esperado = Collections.<Integer>unmodifiableList(Lists.<Integer>newArrayList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
    final Function1<Inscripcion,Integer> _function = new Function1<Inscripcion,Integer>() {
        public Integer apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          Integer _handicap = _jugador.getHandicap();
          return _handicap;
        }
      };
    final List<Integer> handicapsOrdenados = ListExtensions.<Inscripcion, Integer>map(ordenados, _function);
    Assert.assertEquals(esperado, handicapsOrdenados);
  }
  
  @Test
  public void verificarOrdenamientoxPromedio() {
    PromedioCalificaciones _promedioCalificaciones = new PromedioCalificaciones();
    this.partido.agregarCriterioOrdenamiento(_promedioCalificaciones);
    final List<Inscripcion> ordenados = this.partido.ordenarJugadoresFinales();
    final List<String> esperado = Collections.<String>unmodifiableList(Lists.<String>newArrayList("A", "J", "I", "G", "F", "E", "D", "C", "B", "K"));
    final Function1<Inscripcion,String> _function = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    final List<String> nombresOrdenados = ListExtensions.<Inscripcion, String>map(ordenados, _function);
    Assert.assertEquals(esperado, nombresOrdenados);
  }
  
  @Test
  public void verificarOrdenamientoxPromedioNPartidos() {
    PromedioUltimosPartidos _promedioUltimosPartidos = new PromedioUltimosPartidos(this.partidos, Integer.valueOf(2));
    this.partido.agregarCriterioOrdenamiento(_promedioUltimosPartidos);
    final List<Inscripcion> ordenados = this.partido.ordenarJugadoresFinales();
    final List<String> esperado = Collections.<String>unmodifiableList(Lists.<String>newArrayList("A", "J", "G", "E", "F", "I", "B", "C", "D", "K"));
    final Function1<Inscripcion,String> _function = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    final List<String> nombresOrdenados = ListExtensions.<Inscripcion, String>map(ordenados, _function);
    Assert.assertEquals(esperado, nombresOrdenados);
  }
  
  @Test
  public void verificarOrdenamientoCombinado() {
    Handicap _handicap = new Handicap();
    this.partido.agregarCriterioOrdenamiento(_handicap);
    PromedioCalificaciones _promedioCalificaciones = new PromedioCalificaciones();
    this.partido.agregarCriterioOrdenamiento(_promedioCalificaciones);
    final List<Inscripcion> ordenados = this.partido.ordenarJugadoresFinales();
    final List<String> esperado = Collections.<String>unmodifiableList(Lists.<String>newArrayList("B", "J", "C", "D", "G", "E", "F", "I", "A", "K"));
    final Function1<Inscripcion,String> _function = new Function1<Inscripcion,String>() {
        public String apply(final Inscripcion inscripcion) {
          Jugador _jugador = inscripcion.getJugador();
          String _nombre = _jugador.getNombre();
          return _nombre;
        }
      };
    final List<String> nombresOrdenados = ListExtensions.<Inscripcion, String>map(ordenados, _function);
    Assert.assertEquals(esperado, nombresOrdenados);
  }
  
  @Test(expected = FaltaDefinirCriterioDeOrdenException.class)
  public void verificarOrdenamientoCriterioVacio() {
    this.partido.ordenarJugadoresFinales();
  }
}
