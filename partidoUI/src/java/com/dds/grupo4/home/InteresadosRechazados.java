package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Denegacion;
import com.dds.grupo4.dominio.Jugador;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class InteresadosRechazados {
  private List<Denegacion> interesadosRechazados = new ArrayList<Denegacion>();
  
  public boolean esUnInteresadoRechazado(final Jugador interesado) {
    final Function1<Denegacion, Boolean> _function = new Function1<Denegacion, Boolean>() {
      public Boolean apply(final Denegacion rechazado) {
        Jugador _interesado = rechazado.getInteresado();
        return Boolean.valueOf(_interesado.equals(interesado));
      }
    };
    return IterableExtensions.<Denegacion>exists(this.interesadosRechazados, _function);
  }
  
  public Denegacion[] getInteresadosRechazados() {
    return ((Denegacion[])Conversions.unwrapArray(this.interesadosRechazados, Denegacion.class)).clone();
  }
  
  public Integer getCantInteresadosRechazados() {
    return Integer.valueOf(this.interesadosRechazados.size());
  }
  
  public void agregarRechazado(final Jugador interesado, final String motivo) {
    LocalDate _now = LocalDate.now();
    Denegacion _denegacion = new Denegacion(interesado, _now, motivo);
    this.interesadosRechazados.add(_denegacion);
  }
}
