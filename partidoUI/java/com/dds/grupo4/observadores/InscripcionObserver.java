package com.dds.grupo4.observadores;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.mail.MailSender;

@SuppressWarnings("all")
public abstract class InscripcionObserver {
  protected Partido partido;
  
  protected MailSender mailSender;
  
  public InscripcionObserver(final Partido partido, final MailSender mailSender) {
    this.partido = partido;
    this.mailSender = mailSender;
  }
  
  public abstract void notificarNuevaInscripcion(final Inscripcion inscripcion);
  
  public abstract void notificarBajaInscripcion();
  
  public void enviarMail(final /* String */Object remitente, final /* String */Object receptor, final /* String */Object asunto, final /* String */Object mensaje) {
    throw new Error("Unresolved compilation problems:"
      + "\ncrearMail cannot be resolved");
  }
}
