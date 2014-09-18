<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Generar Equipos</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 22em 1em;
				padding: 1em;
				width: 10em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}
			.buttons {
    background-color: #efefef;
    border: medium none;
    box-shadow: 0 0 3px 1px #aaaaaa;
    margin: 3em 21em 1em 19em;
    overflow: hidden;
    padding: 0.3em;
}
			
		</style>
</head>
<body>
	<div id="status" align="center" ><h2> B&uacute;squeda de Jugadores </h2></div>

	<div class="panel-group" id="accordion1">
		<div class="panel panel-default" align= "center"><br>
			<div class="panel-heading" align="center"> 
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<form>
						<div class="row">
							<div class="col-md-6">
							<br>
							<i> </i>
								<table>
									<tr>
										<td><label>Nombre Jugador</label> <input type="text"
											name="fechaPartido" id="fechaPartido" class="form-control"
											placeholder="Contiene..." value="${jugador?.nombre}">
										</td>
											<td><label>Apodo Jugador</label> <input type="text"
											name="fechaPartido" id="fechaPartido" class="form-control"
											placeholder="Contiene..." value="${jugador?.apodo}">
										</td>									</tr>
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
			<div class="panel panel-default"><%--
				<div class="panel-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo">Resultados: ${partidoInstanceTotal}
					</a>
				--%></div>
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
     										Fecha: <b> ${partidoInstance.fechaInicio}</b>
     										<br />
     										Admin: <b> ${partidoInstance.admin.mail} </b>
										</g:if>
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="show" id="${inscripcion.jugador.id}">
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
							
			<div class="buttons" align="center">
				<g:hiddenField name="id" value="${jugadorInstance?.id}" />
				<g:link class="btn btn-primary" action="index">
				Volver
				</g:link>
			</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>