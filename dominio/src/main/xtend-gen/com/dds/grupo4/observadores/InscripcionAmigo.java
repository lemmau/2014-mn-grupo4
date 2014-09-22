package com.dds.grupo4.observadores;

import com.dds.grupo4.dominio.Inscripcion;
import com.dds.grupo4.dominio.Jugador;
import com.dds.grupo4.dominio.Partido;
import com.dds.grupo4.mail.MailSender;
import com.dds.grupo4.observadores.InscripcionObserver;
import java.util.List;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@SuppressWarnings("all")
public class InscripcionAmigo extends InscripcionObserver {
  public InscripcionAmigo(final Partido partido, final MailSender mailSender) {
    super(partido, mailSender);
  }
  
  public void notificarNuevaInscripcion(final Inscripcion inscripcion) {
    Jugador _jugador = inscripcion.getJugador();
    List<String> _mailsAmigos = _jugador.mailsAmigos();
    final Procedure1<String> _function = new Procedure1<String>() {
        public void apply(final String mail) {
          Jugador _jugador = inscripcion.getJugador();
          String _mail = _jugador.getMail();
          Jugador _jugador_1 = inscripcion.getJugador();
          String _nombre = _jugador_1.getNombre();
          String _plus = ("Tu amigo " + _nombre);
          String _plus_1 = (_plus + " se anoto al partido de la fecha ");
          InscripcionAmigo.this.enviarMail(_mail, mail, 
            "Tu amigo se anoto al partido", _plus_1);
        }
      };
    IterableExtensions.<String>forEach(_mailsAmigos, _function);
  }
  
  public void notificarBajaInscripcion() {
  }
}
