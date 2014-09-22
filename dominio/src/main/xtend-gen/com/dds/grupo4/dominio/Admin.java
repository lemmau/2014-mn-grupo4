package com.dds.grupo4.dominio;

import com.dds.grupo4.excepciones.BusinessException;
import java.util.HashMap;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;

@SuppressWarnings("all")
public class Admin {
  private String _nombre;
  
  public String getNombre() {
    return this._nombre;
  }
  
  public void setNombre(final String nombre) {
    this._nombre = nombre;
  }
  
  private String _apellido;
  
  public String getApellido() {
    return this._apellido;
  }
  
  public void setApellido(final String apellido) {
    this._apellido = apellido;
  }
  
  private String _mail;
  
  public String getMail() {
    return this._mail;
  }
  
  public void setMail(final String mail) {
    this._mail = mail;
  }
  
  private Map<String,Integer> _mailsRecibidos = new Function0<Map<String,Integer>>() {
    public Map<String,Integer> apply() {
      HashMap<String,Integer> _hashMap = new HashMap<String,Integer>();
      return _hashMap;
    }
  }.apply();
  
  public Map<String,Integer> getMailsRecibidos() {
    return this._mailsRecibidos;
  }
  
  public void setMailsRecibidos(final Map<String,Integer> mailsRecibidos) {
    this._mailsRecibidos = mailsRecibidos;
  }
  
  public Admin(final String mail) {
    this.setMail(mail);
  }
  
  public void recibirMail(final String mail) {
    try {
      Map<String,Integer> _mailsRecibidos = this.getMailsRecibidos();
      Map<String,Integer> _mailsRecibidos_1 = this.getMailsRecibidos();
      Integer _get = _mailsRecibidos_1.get(mail);
      int _plus = ((_get).intValue() + 1);
      _mailsRecibidos.put(mail, Integer.valueOf(_plus));
    } catch (final Throwable _t) {
      if (_t instanceof BusinessException) {
        final BusinessException ex = (BusinessException)_t;
        Map<String,Integer> _mailsRecibidos_2 = this.getMailsRecibidos();
        _mailsRecibidos_2.put(mail, Integer.valueOf(1));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
}
