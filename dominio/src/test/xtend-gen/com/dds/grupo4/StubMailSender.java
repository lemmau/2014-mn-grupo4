package com.dds.grupo4;

import com.dds.grupo4.mail.Mail;
import com.dds.grupo4.mail.MailSender;
import com.google.common.base.Objects;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class StubMailSender implements MailSender {
  private Map<String,Set<String>> mailsEnviados;
  
  public void sendMail(final Mail mail) {
    String _from = mail.getFrom();
    String _message = mail.getMessage();
    this.simularEnvioMail(_from, _message);
    StringBuffer _stringBuffer = new StringBuffer();
    StringBuffer buf = _stringBuffer;
    StringBuffer _append = buf.append("Simulaci\u00C3\u00B3n env\u00C3\u00ADo de mail | From: ");
    String _from_1 = mail.getFrom();
    StringBuffer _append_1 = _append.append(_from_1);
    StringBuffer _append_2 = _append_1.append(" | To: ");
    String _to = mail.getTo();
    StringBuffer _append_3 = _append_2.append(_to);
    StringBuffer _append_4 = _append_3.append(
      " | Message: ");
    String _message_1 = mail.getMessage();
    _append_4.append(_message_1);
    String _string = buf.toString();
    InputOutput.<String>println(_string);
  }
  
  public Set<String> simularEnvioMail(final String from, final String message) {
    Set<String> _xblockexpression = null;
    {
      Set<String> mensajes = this.mailsDe(from);
      mensajes.add(message);
      Set<String> _put = this.mailsEnviados.put(from, mensajes);
      _xblockexpression = (_put);
    }
    return _xblockexpression;
  }
  
  public Set<String> mailsDe(final String from) {
    Set<String> _xblockexpression = null;
    {
      Set<String> mensajes = this.mailsEnviados.get(from);
      boolean _equals = Objects.equal(mensajes, null);
      if (_equals) {
        HashSet<String> _hashSet = new HashSet<String>();
        mensajes = _hashSet;
      }
      _xblockexpression = (mensajes);
    }
    return _xblockexpression;
  }
  
  /**
   * IMPLEMENTACION DE SINGLETON
   */
  private static StubMailSender instance;
  
  private StubMailSender() {
    HashMap<String,Set<String>> _hashMap = new HashMap<String,Set<String>>();
    this.mailsEnviados = _hashMap;
  }
  
  public static StubMailSender getInstance() {
    StubMailSender _xblockexpression = null;
    {
      boolean _equals = Objects.equal(StubMailSender.instance, null);
      if (_equals) {
        StubMailSender _stubMailSender = new StubMailSender();
        StubMailSender.instance = _stubMailSender;
      }
      _xblockexpression = (StubMailSender.instance);
    }
    return _xblockexpression;
  }
}
