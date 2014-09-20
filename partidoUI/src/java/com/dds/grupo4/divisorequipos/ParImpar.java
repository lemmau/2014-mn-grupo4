package com.dds.grupo4.divisorequipos;

import com.dds.grupo4.divisorequipos.DivisorDeEquipos;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import java.util.List;

@SuppressWarnings("all")
public class ParImpar extends DivisorDeEquipos {
  public ParImpar(final Partido partido) {
    super(partido);
  }
  
  public Boolean isEven(final Integer number) {
    return Boolean.valueOf((((number).intValue() % 2) == 0));
  }
  
  public Boolean debeIrAlEquipoUno(final Inscripcion interesado, final List<Inscripcion> interesados) {
    int _indexOf = interesados.indexOf(interesado);
    return this.isEven(Integer.valueOf(_indexOf));
  }
}
