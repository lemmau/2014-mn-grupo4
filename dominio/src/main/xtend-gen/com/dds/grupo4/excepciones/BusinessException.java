package com.dds.grupo4.excepciones;

@SuppressWarnings("all")
public class BusinessException extends RuntimeException {
  public BusinessException(final String message) {
    super(message);
  }
}
