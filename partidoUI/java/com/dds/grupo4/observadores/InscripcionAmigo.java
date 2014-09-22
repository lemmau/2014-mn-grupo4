package com.dds.grupo4.observadores;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.mail.MailSender;
import com.dds.grupo4.observadores.InscripcionObserver;

@SuppressWarnings("all")
public class InscripcionAmigo extends InscripcionObserver {
  public InscripcionAmigo(final Partido partido, final MailSender mailSender) {
    super(partido, mailSender);
  }
  
  public void notificarNuevaInscripcion(final Inscripcion inscripcion) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field jugador is not visible"
      + "\nThe field jugador is not visible"
      + "\nThe field mail is not visible"
      + "\nThe field jugador is not visible"
      + "\nThe field nombre is not visible"
      + "\nforEach cannot be resolved"
      + "\n+ cannot be resolved"
      + "\n+ cannot be resolved");
  }
  
  public void notificarBajaInscripcion() {
  }
}
