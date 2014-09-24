<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}

table#tablaJugadores tr:nth-child(even) {
	background-color: #eee;
}

table#tablaJugadores tr:nth-child(odd) {
	background-color: #fff;
}

#tablaJugadores th {
	color: white;
	background: black;
}
</style>
</head>
<body>
	<div style="width: 90%; padding: 15pt;">
		<g:render template="titulo"
			model="['titulo': 'B&uacute;squeda de Jugadores']" />
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
							<div class="row">
								<div class="col-md-6">
									<label>Nombre</label> <input type="text" name="nombre"
										id="nombre" class="form-control inputField" placeholder="Comienza con..."
										value="${jugadorBusqueda?.nombre}">
								</div>
								<div class="col-md-6">
									<label>Apodo</label> <input type="text" class="form-control inputField"
										name="apodo" id="apodo" placeholder="Contiene..."
										value="${jugadorBusqueda?.apodo}">
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Fecha de Nacimiento desde:</label> <input type="text"
											name="desde" id="fechaDesde" class="form-control dateField"
											placeholder="Desde..."> <span style="color:grey"> aaaa/mm/dd </span> 
									</div>
									<div class="col-md-6">
										<label>Fecha de Nacimiento Hasta:</label> <input type="text" class="form-control dateField"
											name="hasta" id="fechaHasta" placeholder="Hasta..."> <span style="color:grey"> aaaa/mm/dd </span>
									</div>
									<div class="col-md-6">
										<label>Rango handicap desde:</label> <input type="text"
											name="desde" id="handicapDesde" class="form-control inputField"
											placeholder="Desde..."> <span style="color:grey"> 0-10 </span>
									</div>
									<div class="col-md-6">
										<label>Rango handicap hasta:</label> <input type="text"
											class="form-control inputField" name="hasta" id="handicapHasta"
											placeholder="Hasta..."> <span style="color:grey"> 0-10 </span>
									</div>

								</div>
								<div class="col-md-12">
									<br />
									<%--<g:actionSubmit class="btn btn-primary" action="busqueda"
										value="busqueda" />
									--%>
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
									
									<%--<button type="submit" class="btn btn-primary" >
										<span class="glyphicon glyphicon-search"></span>
										Buscar
									</button>
								--%>
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
			
			makeAnAjaxCall({
				nombre : $("#nombre").val(),
				apodo : $("#apodo").val()
			})

			$(".dateField").keyup(function(){
				if($("#fechaDesde").val().length == 10 || $("#fechaHasta").val().length == 10){
					makeAnAjaxCall({
						nombre : $("#nombre").val(),
						apodo : $("#apodo").val(),
						handicapDesde : $("#handicapDesde").val(),
						handicapHasta : $("#handicapHasta").val(),
						fechaDesde : $("#fechaDesde").val(),
						fechaHasta : $("#fechaHasta").val()
					})
					}
				
				})
			
			$(".inputField").keyup(function(){
				makeAnAjaxCall({
					nombre : $("#nombre").val(),
					apodo : $("#apodo").val(),
					handicapDesde : $("#handicapDesde").val(),
					handicapHasta : $("#handicapHasta").val()
				})
			})
			
			
		});

		function makeAnAjaxCall(_data){
			urlPartidos = "http://localhost:8080/pruebaConcepto/organizadorPartidosFutbol/buscarJugadoresAsJson"
				callback = function(){alert("No se pudo cargar los partidos")}
				successFunction = function(data){
						tablaJugadores = $("#tablaJugadores")
						$('#tablaJugadores td').remove();

						for (i = 0; i < data.length; i++) {
							tablaJugadores.append('<tr><td>' + data[i].nombre + '</td><td>'
									+ data[i].apellido + '</td><td>' 
									+ data[i].apodo    + '</td><td>' 
									+ data[i].fechaNacimiento + '</td><td>' 
									+ data[i].handicap + '</td></tr>')
						}
					}
				data = _data

				makeAjaxCall(urlPartidos,data,successFunction,callback)
			}
	</script>
</body>
</html>
