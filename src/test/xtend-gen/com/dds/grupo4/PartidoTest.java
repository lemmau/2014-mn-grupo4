package com.dds.grupo4;

import com.dds.grupo4.Interesado;
import com.dds.grupo4.Partido;
import com.dds.grupo4.tipoDeInscripcion.Condicional;
import com.dds.grupo4.tipoDeInscripcion.Estandar;
import com.dds.grupo4.tipoDeInscripcion.Solidaria;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class PartidoTest {
  @Test
  public void corroborarDesplazamientoEnLaListaFinalDeJugadores() {
    final Partido partido = new Partido();
    Estandar _estandar = new Estandar();
    final Interesado diego = new Interesado("Diego", "Anazonian", Integer.valueOf(22), _estandar);
    Estandar _estandar_1 = new Estandar();
    final Interesado maqi = new Interesado("Maximiliano", "Anazonian", Integer.valueOf(13), _estandar_1);
    Condicional _condicional = new Condicional();
    final Interesado osva = new Interesado("Osva", "Cornelli", Integer.valueOf(32), _condicional);
    Solidaria _solidaria = new Solidaria();
    final Interesado lean = new Interesado("Leandro", "Mauro", Integer.valueOf(19), _solidaria);
    partido.inscribirA(diego);
    partido.inscribirA(osva);
    partido.inscribirA(maqi);
    partido.inscribirA(lean);
    List<Interesado> _interesados = partido.getInteresados();
    Interesado _get = _interesados.get(0);
    Assert.assertEquals(_get, maqi);
    List<Interesado> _interesados_1 = partido.getInteresados();
    Interesado _get_1 = _interesados_1.get(1);
    Assert.assertEquals(_get_1, diego);
    List<Interesado> _interesados_2 = partido.getInteresados();
    Interesado _get_2 = _interesados_2.get(2);
    Assert.assertEquals(_get_2, lean);
    List<Interesado> _interesados_3 = partido.getInteresados();
    Interesado _get_3 = _interesados_3.get(3);
    Assert.assertEquals(_get_3, osva);
  }
  
  @Test
  public void siAgregoDiezEstandarALoUltimoEsosSonLosQueDebenQuedarComoJugadoresFinales() {
    final Partido partido = new Partido();
    Condicional _condicional = new Condicional();
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
    List<Interesado> _interesados_1 = partido.getInteresados();
    List<Interesado> _subList = _interesados_1.subList(0, 10);
    boolean _contains = _subList.contains(osva);
    boolean _not = (!_contains);
    Assert.assertTrue(_not);
  }
}
