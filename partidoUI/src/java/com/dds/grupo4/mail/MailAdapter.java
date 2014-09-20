package com.dds.grupo4.mail;

import com.dds.grupo4.mail.Mail;

@SuppressWarnings("all")
public class MailAdapter {
  public static Mail crearMail(final String remitente, final String receptor, final String asunto, final String mensaje) {
    return new Mail(remitente, receptor, asunto, mensaje);
  }
}
