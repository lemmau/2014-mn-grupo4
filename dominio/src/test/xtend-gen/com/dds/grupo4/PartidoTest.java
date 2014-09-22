package com.dds.grupo4;

import com.dds.grupo4.StubMailSender;
import com.dds.grupo4.dominio.Admin;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.excepciones.BusinessException;
import com.dds.grupo4.excepciones.NoEsJugadorDelPartidoException;
import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class PartidoTest {
  private Partido partido;
  
  private Admin adminJuan;
  
  private Jugador lioEstandar;
  
  private Jugador diegoEstandar;
  
  private Jugador maqiEstandar;
  
  private Jugador osvaCondicional1;
  
  private Jugador osvaCondicional2;
  
  private Jugador leanSolidario;
  
  private Jugador pepeSolidario;
  
  private Jugador gonzaEstandar;
  
  private Function1<? super Partido,? extends Boolean> condicionInteresadoCondicional;
  
  private Function1<? super Partido,? extends Boolean> condicionPorFecha;
  
  private StubMailSender stubMailSender = new Function0<StubMailSender>() {
    public StubMailSender apply() {
      StubMailSender _instance = StubMailSender.getInstance();
      return _instance;
    }
  }.apply();
  
  @Before
  public void setUp() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDateTime is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nThe method or field LocalDate is undefined for the type PartidoTest"
      + "\nof cannot be resolved"
      + "\ngetDayOfMonth cannot be resolved"
      + "\nequals cannot be resolved"
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
  public void corroboroPosicionesDeJugadoresSegunOrdenDeInscripciones() {
    this.partido.inscribirA(this.diegoEstandar);
    this.partido.inscribirA(this.maqiEstandar);
    this.partido.inscribirA(this.leanSolidario);
    this.partido.inscribirA(this.osvaCondicional1);
    List<Inscripcion> _inscripciones = this.partido.getInscripciones();
    Inscripcion _get = _inscripciones.get(0);
    Jugador _jugador = _get.getJugador();
    Assert.assertEquals(_jugador, this.diegoEstandar);
    List<Inscripcion> _inscripciones_1 = this.partido.getInscripciones();
    Inscripcion _get_1 = _inscripciones_1.get(1);
    Jugador _jugador_1 = _get_1.getJugador();
    Assert.assertEquals(_jugador_1, this.maqiEstandar);
    List<Inscripcion> _inscripciones_2 = this.partido.getInscripciones();
    Inscripcion _get_2 = _inscripciones_2.get(2);
    Jugador _jugador_2 = _get_2.getJugador();
    Assert.assertEquals(_jugador_2, this.leanSolidario);
    List<Inscripcion> _inscripciones_3 = this.partido.getInscripciones();
    Inscripcion _get_3 = _inscripciones_3.get(3);
    Jugador _jugador_3 = _get_3.getJugador();
    Assert.assertEquals(_jugador_3, this.osvaCondicional1);
  }
  
  @Test(expected = BusinessException.class)
  public void corroboroExceptionCuandoHayMenosDeDiezJugadores() {
    this.partido.inscribirA(this.diegoEstandar);
    this.partido.inscribirA(this.osvaCondicional1);
    this.partido.inscribirA(this.maqiEstandar);
    this.partido.inscribirA(this.leanSolidario);
    this.partido.jugadoresFinales();
  }
  
  @Test
  public void siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _lessThan = (_cantidadInteresados < 10);
    boolean _while = _lessThan;
    while (_while) {
      this.partido.inscribirA(this.diegoEstandar);
      int _cantidadInteresados_1 = this.partido.cantidadInteresados();
      boolean _lessThan_1 = (_cantidadInteresados_1 < 10);
      _while = _lessThan_1;
    }
    this.partido.inscribirA(this.osvaCondicional1);
    Boolean _esUnJugadorFinal = this.partido.esUnJugadorFinal(this.osvaCondicional1);
    Assert.assertFalse((_esUnJugadorFinal).booleanValue());
  }
  
  @Test
  public void probarReemplazoDeJugadorCuandoSeLoDaDeBaja() {
    this.partido.inscribirA(this.diegoEstandar);
    this.partido.darDeBajaA(this.diegoEstandar, this.maqiEstandar);
    Boolean _esUnInteresado = this.partido.esUnInteresado(this.maqiEstandar);
    Assert.assertTrue((_esUnInteresado).booleanValue());
    Boolean _esUnInteresado_1 = this.partido.esUnInteresado(this.diegoEstandar);
    Assert.assertFalse((_esUnInteresado_1).booleanValue());
    Integer _cantidadInfracciones = this.diegoEstandar.cantidadInfracciones();
    Assert.assertEquals(0, (_cantidadInfracciones).intValue());
  }
  
  @Test
  public void multarConInfraccionSiNoTieneReemplazante() {
    this.partido.inscribirA(this.diegoEstandar);
    this.partido.darDeBajaA(this.diegoEstandar);
    Integer _cantidadInfracciones = this.diegoEstandar.cantidadInfracciones();
    Assert.assertEquals(1, (_cantidadInfracciones).intValue());
    Boolean _esUnInteresado = this.partido.esUnInteresado(this.diegoEstandar);
    Assert.assertFalse((_esUnInteresado).booleanValue());
  }
  
  @Test
  public void comprobarSiInteresadoCondicionalEsDeplazadoTresLugaresLuegoDeInscribirTresNuevos() {
    this.partido.inscribirA(this.diegoEstandar);
    this.partido.inscribirA(this.maqiEstandar);
    this.partido.inscribirA(this.leanSolidario);
    this.partido.inscribirA(this.osvaCondicional1);
    this.partido.inscribirA(this.leanSolidario);
    this.partido.inscribirA(this.pepeSolidario);
    List<Inscripcion> _inscripciones = this.partido.getInscripciones();
    Inscripcion _get = _inscripciones.get(5);
    Jugador _jugador = _get.getJugador();
    Assert.assertEquals(_jugador, this.osvaCondicional1);
  }
  
  @Test
  public void comprobarSiCondicionSeAplicaAlPartidoConExito() {
    this.partido.inscribirA(this.gonzaEstandar);
    this.partido.inscribirA(this.maqiEstandar);
    this.partido.inscribirA(this.leanSolidario);
    this.partido.inscribirA(this.osvaCondicional1);
    Boolean _estasConfirmado = this.osvaCondicional1.estasConfirmado(this.partido);
    Assert.assertEquals(_estasConfirmado, Boolean.valueOf(true));
  }
  
  @Test
  public void comprobarUmbralDe10Jugadores() {
    this.gonzaEstandar.inscribite(this.partido);
    this.maqiEstandar.inscribite(this.partido);
    this.leanSolidario.inscribite(this.partido);
    this.osvaCondicional1.inscribite(this.partido);
    this.gonzaEstandar.inscribite(this.partido);
    this.maqiEstandar.inscribite(this.partido);
    this.leanSolidario.inscribite(this.partido);
    this.osvaCondicional1.inscribite(this.partido);
    this.osvaCondicional1.inscribite(this.partido);
    this.gonzaEstandar.inscribite(this.partido);
    this.maqiEstandar.inscribite(this.partido);
    this.leanSolidario.inscribite(this.partido);
    this.osvaCondicional1.inscribite(this.partido);
    this.gonzaEstandar.inscribite(this.partido);
    this.maqiEstandar.inscribite(this.partido);
    this.leanSolidario.inscribite(this.partido);
    this.osvaCondicional1.inscribite(this.partido);
    List<Inscripcion> _jugadoresFinales = this.partido.jugadoresFinales();
    int _size = _jugadoresFinales.size();
    Assert.assertEquals(_size, 10);
  }
  
  @Test
  public void chequearEnvioDeMailsDeAmigos() {
    this.diegoEstandar.agregarAmigo(this.leanSolidario);
    this.diegoEstandar.setMail("diego.anazonian@gmail.com");
    this.leanSolidario.setMail("lean@ddsutn.com");
    this.diegoEstandar.inscribite(this.partido);
    String _mail = this.diegoEstandar.getMail();
    Set<String> _mailsDe = this.stubMailSender.mailsDe(_mail);
    int _size = _mailsDe.size();
    Assert.assertEquals(1, _size);
  }
  
  @Test
  public void validarQueUnInteresadoCondicionalAunqueEsteEnListaDeJugadoresNoJueguePorSucondicionImpuestaAlPartido() {
    this.leanSolidario.inscribite(this.partido);
    this.osvaCondicional2.inscribite(this.partido);
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _lessThan = (_cantidadInteresados < 10);
    boolean _while = _lessThan;
    while (_while) {
      this.leanSolidario.inscribite(this.partido);
      int _cantidadInteresados_1 = this.partido.cantidadInteresados();
      boolean _lessThan_1 = (_cantidadInteresados_1 < 10);
      _while = _lessThan_1;
    }
    this.osvaCondicional1.inscribite(this.partido);
    List<Inscripcion> _jugadoresFinales = this.partido.jugadoresFinales();
    boolean _contains = _jugadoresFinales.contains(this.osvaCondicional2);
    Assert.assertFalse(_contains);
  }
  
  @Test
  public void calificarJugadorQueJugoPartido() {
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _lessThan = (_cantidadInteresados < 10);
    boolean _while = _lessThan;
    while (_while) {
      this.diegoEstandar.inscribite(this.partido);
      int _cantidadInteresados_1 = this.partido.cantidadInteresados();
      boolean _lessThan_1 = (_cantidadInteresados_1 < 10);
      _while = _lessThan_1;
    }
    this.partido.calificarA(this.diegoEstandar, Integer.valueOf(8), "Muy bien");
    Inscripcion _obtenerJugadorFinal = this.partido.obtenerJugadorFinal(this.diegoEstandar);
    Integer _cantidadCalificaciones = _obtenerJugadorFinal.cantidadCalificaciones();
    Assert.assertEquals(1, (_cantidadCalificaciones).intValue());
  }
  
  @Test(expected = NoEsJugadorDelPartidoException.class)
  public void calificarJugadorQueNoJugoPartido() {
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _lessThan = (_cantidadInteresados < 10);
    boolean _while = _lessThan;
    while (_while) {
      this.leanSolidario.inscribite(this.partido);
      int _cantidadInteresados_1 = this.partido.cantidadInteresados();
      boolean _lessThan_1 = (_cantidadInteresados_1 < 10);
      _while = _lessThan_1;
    }
    this.partido.calificarA(this.lioEstandar, Integer.valueOf(10), "Sos un crack!!");
  }
  
  @Test(expected = SuperaMaximoCalificacionesException.class)
  public void calificarDeMas() {
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _lessThan = (_cantidadInteresados < 10);
    boolean _while = _lessThan;
    while (_while) {
      this.leanSolidario.inscribite(this.partido);
      int _cantidadInteresados_1 = this.partido.cantidadInteresados();
      boolean _lessThan_1 = (_cantidadInteresados_1 < 10);
      _while = _lessThan_1;
    }
    IntegerRange _upTo = new IntegerRange(0, 11);
    final Procedure1<Integer> _function = new Procedure1<Integer>() {
        public void apply(final Integer it) {
          PartidoTest.this.partido.calificarA(PartidoTest.this.leanSolidario, Integer.valueOf(8), "Muy bien");
        }
      };
    IterableExtensions.<Integer>forEach(_upTo, _function);
  }
}
