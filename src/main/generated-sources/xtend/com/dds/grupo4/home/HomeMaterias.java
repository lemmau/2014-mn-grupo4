package com.dds.grupo4.home;

import com.dds.grupo4.domain.Materia;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class HomeMaterias {
  private List<Materia> materias;
  
  private static HomeMaterias instance = null;
  
  private HomeMaterias() {
    ArrayList<Materia> _arrayList = new ArrayList<Materia>();
    this.materias = _arrayList;
  }
  
  public static HomeMaterias getInstance() {
    HomeMaterias _xblockexpression = null;
    {
      boolean _equals = Objects.equal(HomeMaterias.instance, null);
      if (_equals) {
        HomeMaterias _homeMaterias = new HomeMaterias();
        HomeMaterias.instance = _homeMaterias;
      }
      _xblockexpression = HomeMaterias.instance;
    }
    return _xblockexpression;
  }
  
  public Materia doGetMateria(final Materia materia) {
    final Function1<Materia, Boolean> _function = new Function1<Materia, Boolean>() {
      public Boolean apply(final Materia it) {
        String _nombre = it.getNombre();
        String _nombre_1 = materia.getNombre();
        return Boolean.valueOf(_nombre.equalsIgnoreCase(_nombre_1));
      }
    };
    return IterableExtensions.<Materia>findFirst(this.materias, _function);
  }
  
  /**
   * Genero una copia del objeto para no actualizar el que referencia el home
   */
  public Materia getAbonado(final Materia materia) {
    Materia _doGetMateria = this.doGetMateria(materia);
    return _doGetMateria.copy();
  }
  
  /**
   * Genero una copia de los objetos para no actualizar el que referencia el home
   */
  public boolean eliminarMateria(final Materia materia) {
    Materia _doGetMateria = this.doGetMateria(materia);
    return this.materias.remove(_doGetMateria);
  }
}
