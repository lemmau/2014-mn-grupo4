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
										class="inputField" id="nombre" class="form-control" placeholder="Comienza con..."
										value="${jugadorBusqueda?.nombre}">
								</div>
								<div class="col-md-6">
									<label>Apodo</label> <input type="text" class="form-control"
										class="inputField" name="apodo" id="apodo" placeholder="Contiene..."
										value="${jugadorBusqueda?.apodo}">
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Fecha de Nacimiento desde:</label> <input type="text"
											class="inputField" name="desde" id="fechaDesde" class="form-control"
											placeholder="Desde...">
									</div>
									<div class="col-md-6">
										<label>Fecha de Nacimiento Hasta:</label> <input type="text" class="form-control"
											class="inputField" name="hasta" id="fechaHasta" placeholder="Hasta...">
									</div>
									<div class="col-md-6">
										<label>Rango handicap desde:</label> <input type="text"
											class="inputField" name="desde" id="handicapDesde" class="form-control"
											placeholder="Desde...">
									</div>
									<div class="col-md-6">
										<label>Rango handicap hasta:</label> <input type="text"
											class="inputField" class="form-control" name="hasta" id="handicapHasta"
											placeholder="Hasta...">
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

		<%--<div class="panel-group" id="accordion2">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo">Jugadores: </a>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body">
						<div id="list-materia" class="content scaffold-list">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<thead>
									<g:sortableColumn property="nombreJugador"
										title="Nombre Jugador" />
									<g:sortableColumn property="apodo"
										title="Apodo" />
									<g:sortableColumn property="handicap"
										title="Handicap" />
									<g:sortableColumn property="promedio"
										title="Promedio" />
										
								</thead>
								<tbody>
									<g:each in="${jugadoresInstanceList}" status="i" var="amigo">
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="detalleJugador" id="${amigo.id}">
													${amigo.nombre}
												</g:link></td>
											<td>
											${amigo.apodo}
											</td>
											<td>
												${amigo.handicap}
											</td>
											<td>
												4${amigo.promedio}
											</td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	--%>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
			makeAnAjaxCall({
				nombre : $("#nombre").val(),
				apodo : $("#apodo").val()
			})

			$("#nombre").keyup(function(){
				makeAnAjaxCall({
					nombre : $("#nombre").val(),
					apodo : $("#apodo").val()
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
									+ data[i].apellido + '</td><td>' + data[i].apodo
									+ '</td><td>' + data[i].fechaNacimiento + '</td><td>' + data[i].handicap + '</td></tr>')
						}
					}
				data = _data

				makeAjaxCall(urlPartidos,data,successFunction,callback)
			}
	</script>
</body>
</html>
