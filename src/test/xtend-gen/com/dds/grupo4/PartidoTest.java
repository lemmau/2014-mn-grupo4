package com.dds.grupo4;

import com.dds.grupo4.Interesado;
import com.dds.grupo4.Partido;
import com.dds.grupo4.tipoDeInscripcion.Condicional;
import com.dds.grupo4.tipoDeInscripcion.Estandar;
import com.dds.grupo4.tipoDeInscripcion.Solidaria;
import java.util.List;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class PartidoTest {
  private Partido partido;
  
  private Interesado diego;
  
  private Interesado maqi;
  
  private Interesado osva;
  
  private Interesado lean;
  
  @Before
  public void setUp() {
    Partido _partido = new Partido();
    this.partido = _partido;
    Estandar _estandar = new Estandar();
    Interesado _interesado = new Interesado("Diego", "Anazonian", Integer.valueOf(22), _estandar);
    this.diego = _interesado;
    Estandar _estandar_1 = new Estandar();
    Interesado _interesado_1 = new Interesado("Maximiliano", "Anazonian", Integer.valueOf(13), _estandar_1);
    this.maqi = _interesado_1;
    Condicional _condicional = new Condicional(null);
    Interesado _interesado_2 = new Interesado("Osva", "Cornelli", Integer.valueOf(32), _condicional);
    this.osva = _interesado_2;
    Solidaria _solidaria = new Solidaria();
    Interesado _interesado_3 = new Interesado("Leandro", "Mauro", Integer.valueOf(19), _solidaria);
    this.lean = _interesado_3;
  }
  
  @Test
  public void corroboroComoPrioridadDeJugadoresEnListaDeInt() {
    this.partido.inscribirA(this.diego);
    this.partido.inscribirA(this.osva);
    this.partido.inscribirA(this.maqi);
    this.partido.inscribirA(this.lean);
    List<Interesado> _interesados = this.partido.getInteresados();
    Interesado _get = _interesados.get(0);
    Assert.assertEquals(_get, this.maqi);
    List<Interesado> _interesados_1 = this.partido.getInteresados();
    Interesado _get_1 = _interesados_1.get(1);
    Assert.assertEquals(_get_1, this.diego);
    List<Interesado> _interesados_2 = this.partido.getInteresados();
    Interesado _get_2 = _interesados_2.get(2);
    Assert.assertEquals(_get_2, this.lean);
    List<Interesado> _interesados_3 = this.partido.getInteresados();
    Interesado _get_3 = _interesados_3.get(3);
    Assert.assertEquals(_get_3, this.osva);
  }
  
  @Test
  public void siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {
    final Partido partido = new Partido();
    Condicional _condicional = new Condicional(null);
    final Interesado osva = new Interesado("Osva", "Cornelli", Integer.valueOf(32), _condicional);
    Estandar _estandar = new Estandar();
    final Interesado diego = new Interesado("Diego", "Anazonian", Integer.valueOf(22), _estandar);
    partido.inscribirA(osva);
    List<Interesado> _interesados = partido.getInteresados();
    int _size = _interesados.size();
    boolean _lessEqualsThan = (_size <= 11);
    boolean _while = _lessEqualsThan;
    while (_while) {
      partido.inscribirA(diego);
      List<Interesado> _interesados_1 = partido.getInteresados();
      int _size_1 = _interesados_1.size();
      boolean _lessEqualsThan_1 = (_size_1 <= 11);
      _while = _lessEqualsThan_1;
    }
    List<Interesado> _jugadoresFinales = partido.jugadoresFinales();
    boolean _contains = _jugadoresFinales.contains(osva);
    boolean _not = (!_contains);
    Assert.assertTrue(_not);
  }
}
