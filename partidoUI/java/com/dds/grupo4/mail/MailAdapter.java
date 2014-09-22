package com.dds.grupo4.mail;

import com.dds.grupo4.mail.Mail;

@SuppressWarnings("all")
public class MailAdapter {
  public static Mail crearMail(final /* String */Object remitente, final /* String */Object receptor, final /* String */Object asunto, final /* String */Object mensaje) {
    return new Mail(remitente, receptor, asunto, mensaje);
  }
}
