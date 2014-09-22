package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class HandicapFueraDeRangoException extends RuntimeException {
  public HandicapFueraDeRangoException(final String message) {
    super(message);
  }
}
