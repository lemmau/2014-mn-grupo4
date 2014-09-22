package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class NoTieneCalificacionesException extends RuntimeException {
  public NoTieneCalificacionesException(final String message) {
    super(message);
  }
}
