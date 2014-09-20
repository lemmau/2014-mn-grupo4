package com.dds.grupo4.observadores;

import com.dds.grupo4.dominio.Admin;
import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.mail.MailSender;
import com.dds.grupo4.observadores.InscripcionObserver;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class PartidoConfirmado extends InscripcionObserver {
  public PartidoConfirmado(final Partido partido, final MailSender mailSender) {
    super(partido, mailSender);
  }
  
  public void notificarNuevaInscripcion(final Inscripcion inscripcion) {
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _equals = (_cantidadInteresados == 10);
    if (_equals) {
      Admin _admin = this.partido.getAdmin();
      String _mail = _admin.getMail();
      LocalDate _fechaInicio = this.partido.getFechaInicio();
      String _plus = ("El partido de la fecha " + _fechaInicio);
      String _plus_1 = (_plus + " tiene 10 jugadores");
      this.enviarMail("sistema@ddsutn.com", _mail, "Partido Confirmado", _plus_1);
    }
  }
  
  public void notificarBajaInscripcion() {
    int _cantidadInteresados = this.partido.cantidadInteresados();
    boolean _lessThan = (_cantidadInteresados < 10);
    if (_lessThan) {
      Admin _admin = this.partido.getAdmin();
      String _mail = _admin.getMail();
      LocalDate _fechaInicio = this.partido.getFechaInicio();
      String _plus = ("El partido de la fecha " + _fechaInicio);
      String _plus_1 = (_plus + " ya NO tiene 10 jugadores");
      this.enviarMail("sistema@ddsutn.com", _mail, "Partido Menos 10 jugadores", _plus_1);
    }
  }
}
