package com.dds.grupo4

import com.dds.grupo4.excepciones.SuperaMaximoCalificacionesException
import com.dds.grupo4.tipoDeInscripcion.Estandar
import java.time.LocalDate
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class InscripcionTest {

	Interesado jugadorEstandar
	Inscripcion inscripcion

	@Before
	def void setUp() {

		jugadorEstandar = new Interesado("Diego", "Mulder", LocalDate.of(1979, 12, 14), new Estandar)
		
		inscripcion = new Inscripcion(jugadorEstandar)

		inscripcion.calificar(10, "Extraordinario");		
		inscripcion.calificar(9, "Excelente");
		inscripcion.calificar(8, "Muy Bien");
		inscripcion.calificar(7, "Bien");
		inscripcion.calificar(6, "Zafa");
		inscripcion.calificar(5, "Regular");
		inscripcion.calificar(4, "Sos de madera");
		inscripcion.calificar(3, "Quedate en el banco");
		inscripcion.calificar(2, "Quedate en tu casa");

	}

	@Test(expected=typeof(SuperaMaximoCalificacionesException))
	def void verificarAgregarCalificacionDeMas() {
		inscripcion.calificar(1, "No existis");
	}

	@Test
	def void verificarCantCalificaciones() {
		Assert.assertEquals(9, inscripcion.cantidadCalificaciones)
	}

	@Test
	def void verificarSumaCalificaciones() {
		// promedio 10+9+8+7+6+5+4+3+2 = 54
		Assert.assertEquals( 54, inscripcion.sumaCalificaciones(inscripcion.calificaciones))
	}

	@Test
	def void verificarPromedio() {
		// promedio 10+9+8+7+6+5+4+3+2 = 54;  54/9=6
		Assert.assertEquals(6, inscripcion.promedioCalificaciones, 0)
	}

	@Test
	def void verificarPromedioUltimas4Calificaciones() {
		// promedio 5+4+3+2 = 14;  14/4=3.5
		Assert.assertEquals( 3.5, inscripcion.promedioUltimasCalificaciones(4), 0)
	}

	@Test(expected=typeof(SuperaMaximoCalificacionesException))
	def void verificarPromedioUltimas10Error() {
		inscripcion.promedioUltimasCalificaciones(10)
	}

}
