<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Detalle de un Jugador</title>
</head>
<body>
	<div>
	<span id="infoJugadorTitle"></span>
	<table id="infoJugador" style="width: 70%">
		<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Apodo</th>
				<th>Handicap</th>
				<th>Partidos Jugados</th>
				<th>Promedio Ultimo Partido</th>
			</tr>
	</table>
	</div>

	<div style="width: 45%">
	<span id="infraccionesTitle"></span>
		<table id="infracciones">
			<tr>
				<th>Motivo</th>
				<th>Fecha</th>
			</tr>
		</table>
	</div>
	
	<div class=friendsOf style="margin: 10px">
		<span id="amigoDe"></span>
	</div>
	<div class="table">
		<table id="tablaAmigos">
			<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Handicap</th>
				<th>Fecha Nacimiento</th>
			</tr>
		</table>
	</div>

	<div style="margin-bottom: 50px;margin-top:5px; position: inh">
			<button type="button" style="margin-bottom: 50px" id="regresar">Regresar</button>
	</div>

<script type="text/javascript">

$(document).ready(function() {
	$("#regresar").click(function(){
		window.location = baseUrl
		})
	
	makeAnAjaxCall({
		jugadorId : ${playerId}
	})
	
});

function makeAnAjaxCall(_data){
	
	urlbase = baseUrl;
	urlAmigos = urlbase + "/doDetalleJugador";
		
	callback = function(){alert("No se pudo cargar los amigos de un jugador")}
	successFunction = function(data){
				tablaAmigos = $("#tablaAmigos");
				tablaInfracciones = $("#infracciones");
				infoJugadorTabla = $("#infoJugador");
				
				$('#tablaAmigos td').remove();
				$("#infracciones td").remove();
				$('td:contains("Name")').index();

				$("#infoJugadorTitle").html(":: Datos personales de " + data.nombre + " ::")
				$("#amigoDe").html("::  Amigos de " + data.nombre + "  ::");
				$("#infraccionesTitle").html(":: Infracciones de " + data.nombre + " ::");

				fillMainPlayerInformation(data,infoJugadorTabla);
				fillFriendsTableInformation(data,tablaAmigos);
				fillInfractionTable(data,tablaInfracciones);
				
				var blue = "#00688B";
				setearColorHandicapMayorA(7, blue, tablaAmigos);
				
			}
		data = _data

		makeAjaxCall(urlAmigos,data,successFunction,callback)
}

function fillInfractionTable(data,table){
		for(i=0;i<data.infracciones.length; i++){
			var infraccion = data.infracciones[i];
			table.append('<tr><td>' + infraccion.motivo + '</td><td>' + infraccion.fecha + '</td></tr>');	
		}
} 


function fillFriendsTableInformation(data,table){
	urlbase = baseUrl;
	urlAmigos = urlbase + "/doDetalleJugador";
	
	for (i = 0; i < data.amigos.length; i++) {
		  var amigo = data.amigos[i]
		  var completedUrl = urlbase + "/detalleJugador?jugadorId=" + amigo.id
			
		  tablaAmigos.append('<tr><td><a href="'+completedUrl+'">' 
				  	+ amigo.nombre + '</a></td><td>'
					+ amigo.apellido + '</td><td>'
					+ amigo.handicap + '</td><td>' 
					+ amigo.fecha + '</td></tr>') 
		}
}

function fillMainPlayerInformation(data,table){
	table.append('<tr><td>' 
			+ data.nombre +'</td><td>'
			+ data.apellido +'</td><td>'
			+ data.apodo + '</td><td>'
			+ data.handicap + '</td><td>'
			+ data.cantidadPartidosJugados + '</td><td>'
			+ data.promedioUltimoPartido + '</td>');	
}
		
</script>

</body>
</html>
