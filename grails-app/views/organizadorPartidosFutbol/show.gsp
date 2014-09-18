<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Mostrar Datos Personales</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 17em 1em;
				padding: 1em;
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
	<g:form class="form-horizontal" method="POST">
<br>
<div id="status">
	<div class="row">
				<div class="col-md-6">
					<label for="nombre" class="control-label">Nombre&nbsp;&nbsp; </label>
					<input type="text" value="${jugadorInstance?.nombre}" class="readOnly form-control">
				</div>
  <br>
				<div class="col-md-6">
					<label for="apodo" class="control-label">Apodo&nbsp;&nbsp; </label>
					<input type="text" value="${jugadorInstance?.apodo}" class="readOnly form-control">
				</div>
    <br>
  
				<div class="col-md-6">	
					<label for="handicap" class="control-label">Handicap&nbsp;&nbsp; </label> 
					<input type="text" value="${jugadorInstance?.handicap}" class="readOnly form-control">
				</div>
    <br>
				<div class="col-md-6">
					<label for="fechaNacimiento" class="control-label">Fecha de Nacimiento&nbsp;&nbsp; </label>
					<input type="text" value="${jugadorInstance?.fechaNacimiento}" class="readOnly form-control"> 
				</div>
    <br>
			</div>
</div>			
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
									<g:each in="${amigos}" status="i" var="amigo">
										<tr class="${(i % 2) == 0 ? 'info' : ''}">
											<td><g:link action="show" id="${amigo.jugador.id}">
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
			<div class="buttons" align="center">
				<g:hiddenField name="id" value="${jugadorInstance?.id}" />
				<g:link class="btn btn-primary" action="busquedaDeJugadores">
				Volver
				</g:link>
			</div>
		</g:form>	
</body>
</html>
