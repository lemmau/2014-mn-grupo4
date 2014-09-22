package com.dds.grupo4.observadores;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.mail.Mail;
import com.dds.grupo4.mail.MailAdapter;
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
  
  public void enviarMail(final String remitente, final String receptor, final String asunto, final String mensaje) {
    Mail _crearMail = MailAdapter.crearMail(remitente, receptor, asunto, mensaje);
    this.mailSender.sendMail(_crearMail);
  }
}
