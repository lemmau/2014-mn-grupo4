package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class FaltaDefinirCriterioDeOrdenException extends RuntimeException {
  public FaltaDefinirCriterioDeOrdenException(final String message) {
    super(message);
  }
}
