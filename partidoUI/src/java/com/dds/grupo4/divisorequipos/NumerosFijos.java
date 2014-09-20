package com.dds.grupo4.divisorequipos;

import com.dds.grupo4.divisorequipos.DivisorDeEquipos;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class NumerosFijos extends DivisorDeEquipos {
  private final List<Integer> NUMEROS_FIJOS = IterableExtensions.<Integer>toList(Collections.<Integer>unmodifiableList(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(1), Integer.valueOf(4), Integer.valueOf(5), Integer.valueOf(8), Integer.valueOf(9))));
  
  public NumerosFijos(final Partido partido) {
    super(partido);
  }
  
  public Boolean debeIrAlEquipoUno(final Inscripcion jugador, final List<Inscripcion> interesados) {
    int _indexOf = interesados.indexOf(jugador);
    return Boolean.valueOf(this.NUMEROS_FIJOS.contains(Integer.valueOf(_indexOf)));
  }
}
