<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Ver Jugador</title>
</head>
<body>
		<g:form class="form-horizontal" method="post">
			<div class="row">
				<div class="col-md-6">
					<label class="control-label" for="nombre">Nombre&nbsp;&nbsp; </label> 
					<input class="readOnly form-control" type="text" value="${jugadorInstance?.nombre}"/>
				</div>
				<div class="col-md-6">
					<label class="control-label" for="apodo">Apodo&nbsp;&nbsp; </label>
					<input class="readOnly form-control" type="text" value="${jugadorInstance?.apodo}"/>
				</div>
				<div class="col-md-6">	
					<label class="control-label" for="handicap">Handicap&nbsp;&nbsp; </label> 
					<input class="readOnly form-control" type="text" value="${jugadorInstance?.handicap}"/>
				</div>
			</div>
		</g:form>

<div class="panel-group" id="accordion2">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo">Amigos: 
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
									<g:each in="${amigosInstance}" status="i" var="amigo">
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="detalleJugador" id="${amigo.id}">
													${amigo.nombre}
												</g:link></td>
											<td>
												${amigo.apellido}
											</td>
											<td>
												${amigo.fechaNacimiento}
											</td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>



</body>
</html>
