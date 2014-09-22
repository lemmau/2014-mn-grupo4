package com.dds.grupo4.divisorequipos;

import com.dds.grupo4.divisorequipos.DivisorDeEquipos;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import com.google.common.collect.Lists;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class NumerosFijos extends DivisorDeEquipos {
  private final List<Integer> NUMEROS_FIJOS = new Function0<List<Integer>>() {
    public List<Integer> apply() {
      List<Integer> _list = IterableExtensions.<Integer>toList(Collections.<Integer>unmodifiableList(Lists.<Integer>newArrayList(1, 4, 5, 8, 9)));
      return _list;
    }
  }.apply();
  
  public NumerosFijos(final Partido partido) {
    super(partido);
  }
  
  public Boolean debeIrAlEquipoUno(final Inscripcion jugador, final List<Inscripcion> interesados) {
    int _indexOf = interesados.indexOf(jugador);
    return Boolean.valueOf(this.NUMEROS_FIJOS.contains(Integer.valueOf(_indexOf)));
  }
}
