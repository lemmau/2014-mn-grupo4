<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<style>
table {
	width: 40%;
	float: left;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}

table#tablaPartidos tr:nth-child(even) {
	background-color: #eee;
}

table#tablaPartidos tr:nth-child(odd) {
	background-color: #fff;
}

#tablaPartidos th {
	color: white;
	background: black;
}
</style>
</head>
<body>
		<div class="panel-group" id="accordion3">
			<div class="panel panel-default">
				<div id="collapseThree" class="panel-collapse collapse in">
					<div class="panel-body">
						<g:link class="btn btn-primary" action="busqueda">
						<br />
							<span class="glyphicon glyphicon-file"></span>
								Buscar Jugadores
							</g:link>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div>
		 <span>:: Partidos ::</span>
		 </br>
		</div>
		<div>
		
			<table id="tablaPartidos">
			
				<tr>
					<th>ID</th>
					<th>Fecha Inicio</th>
				</tr>
			</table>
		</div>
				
<script type="text/javascript">

$(document).ready(function() {
	console.log("El documento se cargo exitosamente");
	urlbase = "http://localhost:8080/pruebaConcepto/organizadorPartidosFutbol"
	urlPartidos = urlbase + "/getPartidos"
	callback = function(){alert("No se pudo cargar los partidos")}
	successFunction = function(data){
		tablaPartidos = $("#tablaPartidos")
		$('#tablaPartidos td').remove();

		for (i = 0; i < data.length; i++) {
			tablaPartidos.append('<tr><td><a href="'+urlbase+'/show?partidoId='+ data[i].id +' ">' + data[i].id + '</a></td><td>'
					+ data[i].fecha + '</td></tr>')
		}
	}
	data = ""
	makeAjaxCall(urlPartidos,data,successFunction,callback)
	
});

		
</script>
</body>
</html>