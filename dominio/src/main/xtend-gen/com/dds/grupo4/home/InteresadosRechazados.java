package com.dds.grupo4.home;

import com.dds.grupo4.dominio.Denegacion;
import com.dds.grupo4.dominio.Jugador;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class InteresadosRechazados {
  private List<Denegacion> interesadosRechazados = new Function0<List<Denegacion>>() {
    public List<Denegacion> apply() {
      ArrayList<Denegacion> _arrayList = new ArrayList<Denegacion>();
      return _arrayList;
    }
  }.apply();
  
  public boolean esUnInteresadoRechazado(final Jugador interesado) {
    final Function1<Denegacion,Boolean> _function = new Function1<Denegacion,Boolean>() {
        public Boolean apply(final Denegacion rechazado) {
          Jugador _interesado = rechazado.getInteresado();
          boolean _equals = _interesado.equals(interesado);
          return Boolean.valueOf(_equals);
        }
      };
    boolean _exists = IterableExtensions.<Denegacion>exists(this.interesadosRechazados, _function);
    return _exists;
  }
  
  public Denegacion[] getInteresadosRechazados() {
    Denegacion[] _clone = ((Denegacion[])Conversions.unwrapArray(this.interesadosRechazados, Denegacion.class)).clone();
    return _clone;
  }
  
  public Integer getCantInteresadosRechazados() {
    int _size = this.interesadosRechazados.size();
    return Integer.valueOf(_size);
  }
  
  public void agregarRechazado(final Jugador interesado, final String motivo) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field LocalDateTime is undefined for the type InteresadosRechazados"
      + "\nnow cannot be resolved");
  }
}
