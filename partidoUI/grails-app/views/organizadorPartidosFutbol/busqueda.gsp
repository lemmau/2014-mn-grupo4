<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Busqueda de un juegador</title>
</head>
<body>
	<div style="width: 90%; padding: 15pt;">
		<div class="maintitle">
			<h1>B&uacute;squeda de Jugadores</h1>
		</div>
		<g:if test="${flash.message}">
			<div class="alert alert-info">
				${flash.message}
			</div>
		</g:if>
		<div class="panel-group" id="accordion1">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a data-toggle="collapse" data-parent="#accordion1"
						href="#collapseOne"> Par&aacute;metros de b&uacute;squeda </a>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<form class="form-horizontal" method="post">
							<div style="float: right;" class="col-md-12">
								<form action="">
									
									<input type="checkbox" id="conInfraccion" name="conInfracciones" value="conInfracciones">Con
									Infracciones 	<br> 
									<input type="checkbox" id="sinInfraccion"name="sinInfracciones" value="sinInfracciones">Sin
									Infracciones
								</form>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Nombre</label> <input type="text" name="nombre"
										id="nombre" class="form-control inputField"
										placeholder="Comienza con..."
										value="${jugadorBusqueda?.nombre}">
								</div>
								<div class="col-md-6">
									<label>Apodo</label> <input type="text"
										class="form-control inputField" name="apodo" id="apodo"
										placeholder="Contiene..." value="${jugadorBusqueda?.apodo}">
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Fecha de Nacimiento desde:</label> <input type="text"
											name="desde" id="fechaDesde" class="form-control dateField"
											placeholder="Desde..."> <span style="color: grey">
											aaaa/mm/dd </span>
									</div>
									<div class="col-md-6">
										<label>Fecha de Nacimiento Hasta:</label> <input type="text"
											class="form-control dateField" name="hasta" id="fechaHasta"
											placeholder="Hasta..."> <span style="color: grey">
											aaaa/mm/dd </span>
									</div>
									<div class="col-md-6">
										<label>Rango handicap desde:</label> <input type="text"
											name="desde" id="handicapDesde"
											class="form-control inputField" placeholder="Desde...">
										<span style="color: grey"> 0-10 </span>
									</div>
									<div class="col-md-6">
										<label>Rango handicap hasta:</label> <input type="text"
											class="form-control inputField" name="hasta"
											id="handicapHasta" placeholder="Hasta..."> <span
											style="color: grey"> 0-10 </span>
									</div>
								</div>

								<div class="col-md-12">
									<br />
									<table id="tablaJugadores">
										<tr>
											<th>Nombre</th>
											<th>Apellido</th>
											<th>Apodo</th>
											<th>Fecha Nacimiento</th>
											<th>Handicap</th>
										</tr>
									</table>
									<g:link class="btn btn-primary" name="Regresar" action="index">
										Regresar
									</g:link>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			makeAnAjaxCall(dataValues())

			excluirCheckBoxs($("#conInfraccion"), $("#sinInfraccion"))
			excluirCheckBoxs($("#sinInfraccion"), $("#conInfraccion"))

			validarFecha($("fechaDesde"))
			validarFecha($("fechaHasta"))

			$(".inputField").keyup(function() {
				makeAnAjaxCall(dataValues())
			})

		});

		$("#conInfraccion").click(function(){
			makeAnAjaxCall(dataValues())	
		})
		$("#sinInfraccion").click(function(){
			makeAnAjaxCall(dataValues())	
		})

		function dataValues() {
			console.log($("#conInfraccion").is(':checked'))
			console.log($("#sinInfraccion").is(':checked'))
			
			var dataV = {
				nombre : $("#nombre").val(),
				apodo : $("#apodo").val(),
				handicapDesde : $("#handicapDesde").val(),
				handicapHasta : $("#handicapHasta").val(),
				fechaDesde : $("#fechaDesde").val(),
				fechaHasta : $("#fechaHasta").val(),
				conInfraccion : $("#conInfraccion").is(':checked'),
				sinInfraccion : $("#sinInfraccion").is(':checked')
			}

			return dataV
		}

		function makeAnAjaxCall(_data) {

			urlbase = "http://localhost:8090/pruebaConcepto/organizadorPartidosFutbol";
			urlPartidos = urlbase + "/buscarJugadoresAsJson";

			callback = function() {
				alert("No se pudo cargar los partidos")
			}
			successFunction = function(data) {
				tablaJugadores = $("#tablaJugadores")
				$('#tablaJugadores td').remove();

				for (i = 0; i < data.length; i++) {
					var completedUrl = urlbase + "/detalleJugador?jugadorId="
							+ data[i].id

					tablaJugadores.append('<tr><td><a href="'+completedUrl+'">'
							+ data[i].nombre + '</a></td><td>'
							+ data[i].apellido + '</td><td>' + data[i].apodo
							+ '</td><td>' + data[i].fechaNacimiento
							+ '</td><td>' + data[i].handicap + '</td></tr>')
				}

				var blue = "#00688B";
				setearColorHandicapMayorA(7, blue, $("#tablaJugadores"));
			}
			data = _data
			
			makeAjaxCall(urlPartidos, data, successFunction, callback)
		}
	</script>
</body>
</html>
