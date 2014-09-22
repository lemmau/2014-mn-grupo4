package com.dds.grupo4;

import com.dds.grupo4.dominio.Calificacion;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException;
import java.util.List;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class InscripcionTest {
  private Jugador jugadorEstandar;
  
  private Inscripcion inscripcion;
  
  @Before
  public void setUp() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDate is undefined for the type InscripcionTest"
      + "\nof cannot be resolved");
  }
  
  @Test(expected = SuperaMaximoCalificacionesException.class)
  public void unJugadorNoPuedeTenerMasDeNueveCalificaciones() {
    this.inscripcion.calificar(Integer.valueOf(1), "No existis");
  }
  
  @Test
  public void verificarSumaCalificaciones() {
    List<Calificacion> _calificaciones = this.inscripcion.getCalificaciones();
    Integer _sumaCalificaciones = this.inscripcion.sumaCalificaciones(_calificaciones);
    Assert.assertEquals(54, (_sumaCalificaciones).intValue());
  }
  
  @Test
  public void verificarPromedio() {
    Double _promedioCalificaciones = this.inscripcion.promedioCalificaciones();
    Assert.assertEquals(6, (_promedioCalificaciones).doubleValue(), 0);
  }
  
  @Test
  public void verificarPromedioUltimas4Calificaciones() {
    Double _promedioUltimasCalificaciones = this.inscripcion.promedioUltimasCalificaciones(Integer.valueOf(4));
    Assert.assertEquals(3.5, (_promedioUltimasCalificaciones).doubleValue(), 0);
  }
  
  @Test(expected = SuperaMaximoCalificacionesException.class)
  public void verificarPromedioUltimas10Error() {
    this.inscripcion.promedioUltimasCalificaciones(Integer.valueOf(10));
  }
}
