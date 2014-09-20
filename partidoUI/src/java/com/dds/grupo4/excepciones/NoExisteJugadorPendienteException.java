package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class NoExisteJugadorPendienteException extends RuntimeException {
  public NoExisteJugadorPendienteException(final String message) {
    super(message);
  }
}
