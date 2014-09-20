<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="mainSeguidorDeCarrera" />
</head>
<body>
	<div class="panel-group" id="accordion1">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion1"
					href="#collapseOne"> Par&aacute;metros de b&uacute;squeda </a>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<form>
						<div class="row">
							<div class="col-md-6">
								<table>
									<tr>
										<td><label>Fecha Partido</label> <input type="text"
											name="materia" id="materia" class="form-control"
											placeholder="Contiene..." value="${partido?.fechaInicio}">
										</td>
										<td><label>Profesor</label> <input type="text"
											class="form-control" name="profesor" id="profesor"
											placeholder="Contiene..." value="${materia?.profesor}">
										</td>
									</tr>
								</table>
							</div>
							<div class="col-md-12" align="center">
								<br />
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Buscar
								</button>
							</div>
						</div>
					</form>
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
									<g:sortableColumn property="nombreJugador"
										title="Nombre Jugador" />
									<g:sortableColumn property="apellidoJugador"
										title="Apellido Jugador" />
									<g:sortableColumn property="fechaNacimiento"
										title="Fecha Nacimiento" />
								</thead>
								<tbody>
									<g:each in="${inscripciones}" status="i" var="inscripcion">
										<g:if test="${i == 0}">
     										Partido: ${partidoInstance.fechaInicio}
     										<br />
     										Admin: ${partidoInstance.admin.mail}  
										</g:if>
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="show" id="${partidoInstance.id}">
													${inscripcion.jugador.nombre}
												</g:link></td>
											<td>
												${inscripcion.jugador.apellido}
											</td>
											<td>
												${inscripcion.jugador.fechaNacimiento}
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
		<div class="panel-group" id="accordion3">
			<div class="panel panel-default">
				<%--<div class="panel-heading">
					<b> Acciones </b>
				</div>
				--%><div id="collapseThree" class="panel-collapse collapse in">
					<div class="panel-body">
						<g:link class="btn btn-primary" action="create">
						<br />
							<span class="glyphicon glyphicon-file"></span>
								Gestionar Partido
							</g:link>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>