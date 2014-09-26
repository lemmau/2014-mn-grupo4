<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Ver Jugador</title>
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

table#tablaAmigos tr:nth-child(even) {
	background-color: #eee;
}

table#tablaAmigos tr:nth-child(odd) {
	background-color: #fff;
}

#tablaAmigos th {
	color: white;
	background: black;
}
</style>
</head>
<body>
	<g:form class="form-horizontal" method="post" style="margin: 10px">
		<div class="row">
			<div class="col-md-6">
				<label class="control-label" for="nombre">Nombre&nbsp;&nbsp;
				</label> <input class="readOnly form-control" type="text" id="nombre" />
			</div>
			<div class="col-md-6">
				<label class="control-label" for="apodo">Apodo&nbsp;&nbsp; </label>
				<input class="readOnly form-control" type="text" id="apodo" />
			</div>
			<div class="col-md-6">
				<label class="control-label" for="handicap">Handicap&nbsp;&nbsp;
				</label> <input class="readOnly form-control" type="text" id="handicap" />
			</div>
		</div>
	</g:form>

	<div class=friendsOf style="margin: 10px">
		<span id="amigoDe"></span>
	</div>
	<div class="table">
		<table id="tablaAmigos">
			<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Fecha Nacimiento</th>
			</tr>
		</table>
	</div>

	<div class="regresar" style="left:0px">
		<span><a
			href="http://localhost:8080/pruebaConcepto/organizadorPartidosFutbol/list">
				Regresar </a></span>
	</div>

<script type="text/javascript">

$(document).ready(function() {
	
	makeAnAjaxCall({
		jugadorId : ${playerId}
	})
	
});

function makeAnAjaxCall(_data){
	
	urlbase = "http://localhost:8080/pruebaConcepto/organizadorPartidosFutbol";
	urlAmigos = urlbase + "/doDetalleJugador";
		
		callback = function(){alert("No se pudo cargar los amigos de un jugador")}
		successFunction = function(data){
				tablaAmigos = $("#tablaAmigos")
				$('#tablaAmigos td').remove();

				$("#amigoDe").html("::  Amigos de " + data.nombre + "  ::")
				$("#nombre").val(data.nombre)
				$("#apodo").val(data.apodo)
				$("#handicap").val(data.handicap)
								
				for (i = 0; i < data.amigos.length; i++) {
				  var amigo = data.amigos[i]
				  var completedUrl = urlbase + "/detalleJugador?jugadorId=" + amigo.id
					
				  tablaAmigos.append('<tr><td><a href="'+completedUrl+'">' + amigo.nombre + '</a></td><td>'
							+ amigo.apellido + '</td><td>' 
							+ amigo.fecha + '</td></tr>') 
				}
			}
		data = _data

		makeAjaxCall(urlAmigos,data,successFunction,callback)
	}

		
</script>

</body>
</html>
