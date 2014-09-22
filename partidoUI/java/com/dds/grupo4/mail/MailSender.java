package com.dds.grupo4.mail;

import com.dds.grupo4.mail.Mail;

@SuppressWarnings("all")
public interface MailSender {
  public abstract void sendMail(final Mail mail);
}
