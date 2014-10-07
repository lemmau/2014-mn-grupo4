<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
		
		<div class="maintitle">
			 <h1> Partidos </h1>
		</div>
		<div id="menu" class="subtitle" style="float: left">
			<span>:: Menu De Búsqueda ::</span>
			<div class="menuLinks">
				<p>-<a href="/pruebaConcepto/organizadorPartidosFutbol/busqueda">Buscar Jugadores</a></p>
			</div>
		</div>
		<div>
			<table id="tablaPartidos" style="width: 300px; float: right; margin-right: 15%">
				<tr>
					<th>ID</th>
					<th>Fecha Inicio</th>
				</tr>
			</table>
		</div>
				
<script type="text/javascript">

$(document).ready(function() {
	console.log("El documento se cargo exitosamente");
	urlbase = "http://localhost:8090/pruebaConcepto/organizadorPartidosFutbol"
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