<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Ver Partido</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}

table tr:nth-child(even) {
	background-color: #eee;
}

table tr:nth-child(odd) {
	background-color: #fff;
}

table th {
	color: white;
	background: black;
}

</style>
</head>
<body>

	<table id="equipoJugadores">
		<tr>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>Apodo</th>
			<th>Fecha Nacimiento</th>
			<th>Handicap</th>
		</tr>
	</table>

	<div class="combo-box" style="margin-top: 10px">
		<div style="margin-left: 25px">
			<span>:: Ordenar por ::</span> <select name="criterioOrden"
				id="criterioOrdenamiento" style="width: 150px">
				<option value="none">Seleccionar</option>
				<option value="handicap">Handicap</option>
				<option value="calificacion">Promedio Calificación</option>
				<option value="ultimoPartido">Promedio ultimo partido</option>
			</select>
		</div>
		<div>
			<span>:: Seleccionar por ::</span> <select name="criterioSeleccion"
				id="criterioSeleccion" style="width: 150px">
				<option value="none">Seleccionar</option>
				<option value="parImpar">Par/Impar</option>
				<option value="numerosFijos">1,4,5,8,9/2,3,6,7,19</option>
			</select>
		</div>
	</div>

	<div style="margin-top: 10px">
		<button type="button" id="generarEquipos" disabled>Generar
			Equipos</button>
	</div>

	<div>
		<div style="width: 300px; float: left">
			<table id="tabla1">
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Handicap</th>
				</tr>
			</table>
		</div>
		<div style="width: 300px; float: right">
			<table id="tabla2">
				<tr>
					<th>Nombre</th>
					<th>Apodo</th>
					<th>Handicap</th>
				</tr>
			</table>
		</div>

	</div>

	<span id="idPartido"></span>
	<span id="fechaJuego"></span>
	<table id="jugadoresDelPartido">
	</table>

<script type="text/javascript">

$(document).ready(function() {

	fillMatchTable({partidoId : 2})
	
	$("#tabla1").hide();
	$("#tabla2").hide();

	$(".combo-box").click(function(){
		//console.log($("#criterioOrdenamiento").val() == "none")
		if(($("#criterioOrdenamiento").val() != "none") && ($("#criterioSeleccion").val() != "none")){
			$("#generarEquipos").attr("disabled", false)
			} else {
				$("#generarEquipos").attr("disabled", true)
				}
		})
	
	$("#generarEquipos").click(function(){

		fillMatchesTable({
			ordenamiento : $("#criterioOrdenamiento").val(),
			 partidoId:${_partidoId},
			 seleccion : $("#criterioSeleccion").val()
		})
		
		})
	
	
	
});

function fillMatchesTable(_data){
	urlbase = "http://localhost:8080/pruebaConcepto/organizadorPartidosFutbol";
	urlPartidos = urlbase + "/generarEquipos";
		
		callback = function(){alert("No se pudo cargar los partidos")}
		successFunction = function(data){
				tablaJugadores1 = $("#tabla1")
				tablaJugadores2 = $("#tabla2")
								
				tablaJugadores1.show()
				tablaJugadores2.show()
				
				$('#table1 td').remove()
				$('#table2 td').remove()

				for (i = 0; i < data.length; i++) {
				var completedUrl = urlbase + "/detalleJugador?jugadorId=" + data[i].id

				var tableToFill = tablaJugadores1 		
						if(i>=5){
							tableToFill = tablaJugadores2
							}
				 
				
				tableToFill.append('<tr><td><a href="'+completedUrl+'">' + data[i].nombre + '</a></td><td>'
							+ data[i].apodo    + '</td><td>' 
							+ data[i].handicap + '</td></tr>')
				}
			}
		data = _data

		makeAjaxCall(urlPartidos,data,successFunction,callback)
	
}

function fillMatchTable(_data){
	urlbase = "http://localhost:8080/pruebaConcepto/organizadorPartidosFutbol";
	urlPartidos = urlbase + "/getJugadoresDeUnPartdio";
		
		callback = function(){alert("No se pudo cargar los partidos")}
		successFunction = function(data){
			equipoJugadores = $("#equipoJugadores")
				$('#equipoJugadores td').remove();

			

				for (i = 0; i < data.length; i++) {
				var completedUrl = urlbase + "/detalleJugador?jugadorId=" + data[i].id
					
				equipoJugadores.append('<tr><td><a href="'+completedUrl+'">' + data[i].nombre + '</a></td><td>'
							+ data[i].apellido + '</td><td>' 
							+ data[i].apodo    + '</td><td>' 
							+ data[i].fechaNacimiento + '</td><td>' 
							+ data[i].handicap + '</td></tr>')
				}
			}
		
		data = _data

		makeAjaxCall(urlPartidos,data,successFunction,callback)
}


		
</script>
</body>
</html>
