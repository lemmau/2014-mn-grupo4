package com.dds.grupo4;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.NoExisteJugadorPendienteException;
import com.dds.grupo4.home.TodosLosJugadores;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class JugadoresTest {
  private TodosLosJugadores todosLosJugadores = new Function0<TodosLosJugadores>() {
    public TodosLosJugadores apply() {
      TodosLosJugadores _todosLosJugadores = new TodosLosJugadores();
      return _todosLosJugadores;
    }
  }.apply();
  
  private Jugador diegoEstandar;
  
  private Jugador maqiEstandar;
  
  private Jugador osvaEstandar;
  
  private Jugador leanEstandar;
  
  private Jugador gonzaEstandar;
  
  private Jugador lioEstandar;
  
  @Before
  public void setUp() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDate is undefined for the type JugadoresTest"
      + "\nThe method or field LocalDate is undefined for the type JugadoresTest"
      + "\nThe method or field LocalDate is undefined for the type JugadoresTest"
      + "\nThe method or field LocalDate is undefined for the type JugadoresTest"
      + "\nThe method or field LocalDate is undefined for the type JugadoresTest"
      + "\nThe method or field LocalDate is undefined for the type JugadoresTest"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved");
  }
  
  @Test
  public void verificoCantInteresadosPendientes() {
    Integer _cantInteresadosPendientes = this.todosLosJugadores.cantInteresadosPendientes();
    Assert.assertEquals(5, (_cantInteresadosPendientes).intValue());
  }
  
  @Test
  public void aceptoTodosLosCandidatos() {
    Jugador[] _interesadosDelSistema = this.todosLosJugadores.getInteresadosDelSistema();
    final Procedure1<Jugador> _function = new Procedure1<Jugador>() {
        public void apply(final Jugador interesado) {
          JugadoresTest.this.todosLosJugadores.aceptarInteresado(interesado);
        }
      };
    IterableExtensions.<Jugador>forEach(((Iterable<Jugador>)Conversions.doWrapArray(_interesadosDelSistema)), _function);
    Integer _cantInteresadosAceptados = this.todosLosJugadores.cantInteresadosAceptados();
    Assert.assertEquals(5, (_cantInteresadosAceptados).intValue());
  }
  
  @Test
  public void rechazoTodosLosCandidatos() {
    Jugador[] _interesadosDelSistema = this.todosLosJugadores.getInteresadosDelSistema();
    final Procedure1<Jugador> _function = new Procedure1<Jugador>() {
        public void apply(final Jugador interesado) {
          JugadoresTest.this.todosLosJugadores.rechazarInteresado(interesado, "Cupo completo");
        }
      };
    IterableExtensions.<Jugador>forEach(((Iterable<Jugador>)Conversions.doWrapArray(_interesadosDelSistema)), _function);
    Integer _cantInteresadosRechazados = this.todosLosJugadores.cantInteresadosRechazados();
    Assert.assertEquals(5, (_cantInteresadosRechazados).intValue());
  }
  
  @Test
  public void aceptoUnCandidato() {
    this.todosLosJugadores.aceptarInteresado(this.diegoEstandar);
    boolean _esUnInteresadoAceptado = this.todosLosJugadores.esUnInteresadoAceptado(this.diegoEstandar);
    Assert.assertTrue(_esUnInteresadoAceptado);
  }
  
  @Test
  public void rechazoUnCandidato() {
    this.todosLosJugadores.rechazarInteresado(this.maqiEstandar, "Cupo completo");
    boolean _esUnInteresadoRechazado = this.todosLosJugadores.esUnInteresadoRechazado(this.maqiEstandar);
    Assert.assertTrue(_esUnInteresadoRechazado);
  }
  
  @Test(expected = NoExisteJugadorPendienteException.class)
  public void aceptoCandidatoInexistente() {
    this.todosLosJugadores.aceptarInteresado(this.lioEstandar);
  }
  
  @Test(expected = NoExisteJugadorPendienteException.class)
  public void rechazoCandidatoInexistente() {
    this.todosLosJugadores.rechazarInteresado(this.lioEstandar, "demasiado bueno");
  }
}
