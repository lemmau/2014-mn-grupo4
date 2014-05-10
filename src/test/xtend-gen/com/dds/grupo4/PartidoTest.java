package com.dds.grupo4;

import com.dds.grupo4.Interesado;
import com.dds.grupo4.Partido;
import com.dds.grupo4.tipoDeInscripcion.Condicional;
import com.dds.grupo4.tipoDeInscripcion.Estandar;
import com.dds.grupo4.tipoDeInscripcion.Solidaria;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
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
  
  private Function1<? super List<Interesado>,? extends Boolean> condicionInteresadoCondicional;
  
  @Before
  public void setUp() {
    Partido _partido = new Partido();
    this.partido = _partido;
    final Function1<List<Interesado>,Boolean> _function = new Function1<List<Interesado>,Boolean>() {
      public Boolean apply(final List<Interesado> interesados) {
        final Function1<Interesado,Boolean> _function = new Function1<Interesado,Boolean>() {
          public Boolean apply(final Interesado interesado) {
            Integer _edad = interesado.getEdad();
            return Boolean.valueOf(((_edad).intValue() > 22));
          }
        };
        Iterable<Interesado> _filter = IterableExtensions.<Interesado>filter(interesados, _function);
        int _size = IterableExtensions.size(_filter);
        return Boolean.valueOf((_size > 2));
      }
    };
    this.condicionInteresadoCondicional = _function;
    Estandar _estandar = new Estandar();
    Interesado _interesado = new Interesado("Diego", "Anazonian", Integer.valueOf(23), _estandar);
    this.diego = _interesado;
    Estandar _estandar_1 = new Estandar();
    Interesado _interesado_1 = new Interesado("Maximiliano", "Anazonian", Integer.valueOf(23), _estandar_1);
    this.maqi = _interesado_1;
    Condicional _condicional = new Condicional(this.condicionInteresadoCondicional);
    Interesado _interesado_2 = new Interesado("Osva", "Cornelli", Integer.valueOf(32), _condicional);
    this.osva = _interesado_2;
    Solidaria _solidaria = new Solidaria();
    Interesado _interesado_3 = new Interesado("Leandro", "Mauro", Integer.valueOf(25), _solidaria);
    this.lean = _interesado_3;
  }
  
  @Test
  public void corroboroComoPrioridadDeJugadoresEnListaDeInt() {
    this.partido.inscribirA(this.diego);
    this.partido.inscribirA(this.maqi);
    this.partido.inscribirA(this.lean);
    this.partido.inscribirA(this.osva);
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
  
  @Test(expected = RuntimeException.class)
  public void corroboroExceptionCuandoHayMenosDeDiezJugadores() {
    this.partido.inscribirA(this.diego);
    this.partido.inscribirA(this.osva);
    this.partido.inscribirA(this.maqi);
    this.partido.inscribirA(this.lean);
    this.partido.jugadoresFinales();
  }
  
  @Test
  public void siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {
    List<Interesado> _interesados = this.partido.getInteresados();
    int _size = _interesados.size();
    boolean _lessThan = (_size < 11);
    boolean _while = _lessThan;
    while (_while) {
      this.partido.inscribirA(this.diego);
      List<Interesado> _interesados_1 = this.partido.getInteresados();
      int _size_1 = _interesados_1.size();
      boolean _lessThan_1 = (_size_1 < 11);
      _while = _lessThan_1;
    }
    this.partido.inscribirA(this.osva);
    List<Interesado> _jugadoresFinales = this.partido.jugadoresFinales();
    boolean _contains = _jugadoresFinales.contains(this.osva);
    boolean _not = (!_contains);
    Assert.assertTrue(_not);
  }
}
