package com.dds.grupo4.mail;

import org.eclipse.xtend.lib.Property;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Mail {
  @Property
  private String _from;
  
  @Property
  private String _to;
  
  @Property
  private String _subject;
  
  @Property
  private String _message;
  
  public Mail(final String remitente, final String receptor, final String asunto, final String mensaje) {
    this.setFrom(remitente);
    this.setTo(receptor);
    this.setSubject(asunto);
    this.setMessage(mensaje);
  }
  
  @Pure
  public String getFrom() {
    return this._from;
  }
  
  public void setFrom(final String from) {
    this._from = from;
  }
  
  @Pure
  public String getTo() {
    return this._to;
  }
  
  public void setTo(final String to) {
    this._to = to;
  }
  
  @Pure
  public String getSubject() {
    return this._subject;
  }
  
  public void setSubject(final String subject) {
    this._subject = subject;
  }
  
  @Pure
  public String getMessage() {
    return this._message;
  }
  
  public void setMessage(final String message) {
    this._message = message;
  }
}
