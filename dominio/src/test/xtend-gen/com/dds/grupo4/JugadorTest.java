package com.dds.grupo4;

import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.excepciones.HandicapFueraDeRangoException;
import com.dds.grupo4.tipoDeInscripcion.Estandar;
import com.dds.grupo4.tipoDeInscripcion.Solidario;
import com.dds.grupo4.tipoDeInscripcion.TipoDeInscripcion;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class JugadorTest {
  private Jugador diegoEstandar;
  
  private Jugador maqiEstandar;
  
  private Jugador osvaEstandar;
  
  private Jugador leanEstandar;
  
  private Jugador gonzaEstandar;
  
  @Before
  public void setUp() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDate is undefined for the type JugadorTest"
      + "\nThe method or field LocalDate is undefined for the type JugadorTest"
      + "\nThe method or field LocalDate is undefined for the type JugadorTest"
      + "\nThe method or field LocalDate is undefined for the type JugadorTest"
      + "\nThe method or field LocalDate is undefined for the type JugadorTest"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved"
      + "\nof cannot be resolved");
  }
  
  @Test
  public void verificarEdadDeJugadores() {
    Integer _edad = this.diegoEstandar.edad();
    Assert.assertEquals(22, (_edad).intValue());
    Integer _edad_1 = this.maqiEstandar.edad();
    Assert.assertEquals(22, (_edad_1).intValue());
    Integer _edad_2 = this.gonzaEstandar.edad();
    Assert.assertEquals(33, (_edad_2).intValue());
    Integer _edad_3 = this.osvaEstandar.edad();
    Assert.assertEquals(32, (_edad_3).intValue());
    Integer _edad_4 = this.leanEstandar.edad();
    Assert.assertEquals(25, (_edad_4).intValue());
  }
  
  @Test
  public void verificarTipoInscripcion() {
    TipoDeInscripcion _tipoDeInscripcion = this.diegoEstandar.getTipoDeInscripcion();
    Class<? extends TipoDeInscripcion> _class = _tipoDeInscripcion.getClass();
    Assert.assertEquals(Estandar.class, _class);
  }
  
  @Test
  public void modificarTipoInscripcion() {
    Solidario _solidario = new Solidario();
    this.diegoEstandar.cambiarTipoDeInscripcion(_solidario);
    TipoDeInscripcion _tipoDeInscripcion = this.diegoEstandar.getTipoDeInscripcion();
    Class<? extends TipoDeInscripcion> _class = _tipoDeInscripcion.getClass();
    Assert.assertEquals(Solidario.class, _class);
  }
  
  @Test
  public void verificarHandicap() {
    Integer _handicap = this.diegoEstandar.getHandicap();
    Assert.assertEquals(8, (_handicap).intValue());
  }
  
  @Test(expected = HandicapFueraDeRangoException.class)
  public void agregarHandicapFueraDeRango() {
    this.maqiEstandar.setHandicap(Integer.valueOf(11));
  }
}
