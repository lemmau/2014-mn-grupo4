package com.dds.grupo4.dominio;

@SuppressWarnings("all")
public class Admin {
  /* @Property
   */private /* String */Object nombre;
  
  /* @Property
   */private /* String */Object apellido;
  
  /* @Property
   */private /* String */Object mail;
  
  /* @Property
   */private /* Map<String, Integer> */Object mailsRecibidos /* Skipped initializer because of errors */;
  
  public Admin(final /* String */Object mail) {
    this.mail = mail;
  }
  
  public void recibirMail(final /* String */Object mail) {
    throw new Error("Unresolved compilation problems:"
      + "\nNo exception of type BusinessException can be thrown; an exception type must be a subclass of Throwable"
      + "\nput cannot be resolved"
      + "\nget cannot be resolved"
      + "\n+ cannot be resolved"
      + "\nput cannot be resolved");
  }
}
