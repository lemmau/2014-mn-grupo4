<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Ver Partido</title>
</head>
<body>
	<div class="panel-group" id="accordion2">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo">Jugadores del partido: 
					</a>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body">
						<div id="list-materia" class="content scaffold-list">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<thead>
									<g:sortableColumn property="nombreJugador"
										title="Nombre Jugador" />
									<g:sortableColumn property="apellidoJugador"
										title="Apellido Jugador" />
									<g:sortableColumn property="fechaNacimiento"
										title="Fecha Nacimiento" />
								</thead>
								<tbody>
									<g:each in="${partidoInstance.inscripciones}" status="i" var="amigo">
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="detalleJugador" id="${amigo.jugador.id}">
													${amigo.jugador.nombre}
												</g:link></td>
											<td>
												${amigo.jugador.apellido}
											</td>
											<td>
												${amigo.jugador.fechaNacimiento}
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
			<div class="buttons">
				<br>
				<g:hiddenField name="id" value="${partidoInstance?.id}" />
				<g:select name="criterioOrden" title="Criterio de Ordenamiento" from="${['Handicap', 'Promedio Calificaciones', 'Promedio ultimo Partido']}" valueMessagePrefix="criterioOrden"
				noSelection="['':'-Elegir criterio de ordenamiento-']" />
				<g:select name="criterioSeleccion" from="${['Par/Impar', '1,4,5,8,9/2,3,6,7,19']}" valueMessagePrefix="criterioSeleccion" 
				noSelection="['':'-Elegir criterio de seleccion-']"/>
				<g:actionSubmit class="btn btn-primary" action="generarEquipos" value="GenerarEquipos"/>
				<g:link class="btn btn-primary" action="list">
					Volver
				</g:link>
			</div>
		</body>
</html>
