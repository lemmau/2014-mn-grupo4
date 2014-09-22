package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class NoEsJugadorDelPartidoException extends RuntimeException {
  public NoEsJugadorDelPartidoException(final String message) {
    super(message);
  }
}
