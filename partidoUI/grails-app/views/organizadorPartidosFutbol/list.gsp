<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="mainSeguidorDeCarrera" />
</head>
<body>
		<div class="panel-group" id="accordion3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b> Acciones </b>
				</div>
				<div id="collapseThree" class="panel-collapse collapse in">
					<div class="panel-body">
						<g:link class="btn btn-primary" action="busqueda">
						<br />
							<span class="glyphicon glyphicon-file"></span>
								Busqueda Jugadores
							</g:link>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="panel-group" id="accordion2">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo">Resultados: ${partidoInstanceTotal}
					</a>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body">
						<div id="list-materia" class="content scaffold-list">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<thead>
									<g:sortableColumn property="id"
										title="ID Partido" />
									<g:sortableColumn property="fechaInicio"
										title="Fecha Inicio" />
								</thead>
								<tbody>
									<g:each in="${partidoInstanceList}" status="i" var="partido">
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="show" id="${partido.id}">
													${partido.id}
												</g:link></td>
											<td>
												${partido.fechaInicio}
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
</body>
</html>