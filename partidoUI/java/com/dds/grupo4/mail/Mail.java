package com.dds.grupo4.mail;

@SuppressWarnings("all")
public class Mail {
  /* @Property
   */private /* String */Object from;
  
  /* @Property
   */private /* String */Object to;
  
  /* @Property
   */private /* String */Object subject;
  
  /* @Property
   */private /* String */Object message;
  
  public Mail(final /* String */Object remitente, final /* String */Object receptor, final /* String */Object asunto, final /* String */Object mensaje) {
    this.from = remitente;
    this.to = receptor;
    this.subject = asunto;
    this.message = mensaje;
  }
}
