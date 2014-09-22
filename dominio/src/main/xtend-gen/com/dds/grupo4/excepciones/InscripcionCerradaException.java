package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class InscripcionCerradaException extends RuntimeException {
  public InscripcionCerradaException(final String message) {
    super(message);
  }
}
