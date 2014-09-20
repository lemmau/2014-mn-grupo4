package com.dds.grupo4.dominio;

import com.dds.grupo4.excepciones.BusinessException;
import java.util.HashMap;
import java.util.Map;
import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Admin {
  @Property
  private String _nombre;
  
  @Property
  private String _apellido;
  
  @Property
  private String _mail;
  
  @Property
  private Map<String, Integer> _mailsRecibidos = new HashMap<String, Integer>();
  
  public Admin(final String mail) {
    this.setMail(mail);
  }
  
  public void recibirMail(final String mail) {
    try {
      Map<String, Integer> _mailsRecibidos = this.getMailsRecibidos();
      Map<String, Integer> _mailsRecibidos_1 = this.getMailsRecibidos();
      Integer _get = _mailsRecibidos_1.get(mail);
      int _plus = ((_get).intValue() + 1);
      _mailsRecibidos.put(mail, Integer.valueOf(_plus));
    } catch (final Throwable _t) {
      if (_t instanceof BusinessException) {
        final BusinessException ex = (BusinessException)_t;
        Map<String, Integer> _mailsRecibidos_2 = this.getMailsRecibidos();
        _mailsRecibidos_2.put(mail, Integer.valueOf(1));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Pure
  public String getNombre() {
    return this._nombre;
  }
  
  public void setNombre(final String nombre) {
    this._nombre = nombre;
  }
  
  @Pure
  public String getApellido() {
    return this._apellido;
  }
  
  public void setApellido(final String apellido) {
    this._apellido = apellido;
  }
  
  @Pure
  public String getMail() {
    return this._mail;
  }
  
  public void setMail(final String mail) {
    this._mail = mail;
  }
  
  @Pure
  public Map<String, Integer> getMailsRecibidos() {
    return this._mailsRecibidos;
  }
  
  public void setMailsRecibidos(final Map<String, Integer> mailsRecibidos) {
    this._mailsRecibidos = mailsRecibidos;
  }
}
