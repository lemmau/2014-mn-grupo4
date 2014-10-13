<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Ver Partido</title>

</head>
<body>
	
	<div class="maintitle">
	 <h1 id="partidotitle">Jugadores para </h1>
	</div>
	
	<div id="equipoJugadores">
		<g:render template="infoJugador"/>
	</div>
	
	<div class="combo-box" style="margin-top: 10px">
		<div style="margin-left: 25px">
			<span>:: Ordenar por ::</span> <select name="criterioOrden"
				id="criterioOrdenamiento" style="width: 150px">
				<option value="none">Seleccionar</option>
				<option value="handicap">Handicap</option>
				<option value="calificacion">Promedio Calificación</option>
				<option value="ultimoPartido">Promedio ultimo partido</option>
			</select>
			<select name="criterioOrden"
				id="criterioOrdenamiento2" style="width: 150px" disabled>
				<option value="none">Seleccionar</option>
				<option value="handicap">Handicap</option>
				<option value="calificacion">Promedio Calificación</option>
				<option value="ultimoPartido">Promedio ultimo partido</option>
			</select>
			<select name="criterioOrden"
				id="criterioOrdenamiento3" style="width: 150px" disabled>
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

	<div id="equiposGenerados" style="display: none">
		<div style="float: none;margin-left: 312px">
			<span id="ordenadoPor"></span>
			<span id="seleccionadoPor"></span>
		</div>
	
		<div style="width: 300px; float: left;margin-left: 135px">
		<span>Equipo A</span>
			<div id="table1">
				<g:render template="jugadoresGenerados"/>
			</div>
		</div>
		
		<div style="width: 300px; float: right;margin-right: 135px">
		<span>Equipo B</span>
			<div id="table2">
				<g:render template="jugadoresGenerados"/>
			</div>
		</div>
		
		<div style="margin: 30px; clear:both;margin-left: 46%">
			<button type="button" id="confirmarEquipos">Confirmar</button>
		</div>
		<div style="margin-left:35%">
			<span id="confirmacionFailed" style="color: red;" hidden></span>
			<span id="confirmacionSuccess" style="color: #01DF01;" hidden></span>
		</div>
		
	</div>
	<div style="margin-bottom: 50px;margin-top:5px; position: inh">
			<button type="button" id="regresar">Regresar</button>
	</div>

	<span id="idPartido"></span>
	<span id="fechaJuego"></span>
	<table id="jugadoresDelPartido">
	</table>
	
	

<script type="text/javascript">

$(document).ready(function() {
	resultadoEquiposId = new Array()
	logicaParaSeleccionYOrdenamiento();

	$("#regresar").click(function(){
		window.location = baseUrl
		})

	fillMatchTable({partidoId : ${_partidoId}});
	
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
	
	$("#confirmarEquipos").click(function(){
		confirmarEquipos(
					{ 
					idPartido : ${_partidoId},
				  	idsJugadores : resultadoEquiposId
				  	}
				);
	});
	
	$("#generarEquipos").click(function(){
		$("#ordenadoPor").text("Ordenado por " + $("#criterioOrdenamiento option:selected").text())
		$("#seleccionadoPor").text("Seleccionado por " + $("#criterioSeleccion option:selected").text())
		
		$("#equiposGenerados").show()
		fillMatchesTable({
			 ordenamiento1 : $("#criterioOrdenamiento").val(),
			 ordenamiento2 : $("#criterioOrdenamiento2").val(),
			 ordenamiento3 : $("#criterioOrdenamiento3").val(),
			 partidoId:${_partidoId},
			 seleccion : $("#criterioSeleccion").val()
		})
		
		})
	
	
	
});

function confirmarEquipos(_data){
	urlbase = baseUrl;
	urlPartidos = urlbase + "/confirmarEquipos";

	callback = function(){
					$("#confirmacionFailed").show()
					$("#confirmacionFailed").text("Problemas al intentar confirmar equipos")
				}
	successFunction =  function(data){
					$("#confirmarEquipos").attr("disabled",true)
					$("#confirmacionSuccess").show()
					$("#confirmacionSuccess").text("Los equipos fueron confirmados exitosamente")
				} 

	data = { myjson : JSON.stringify(_data) }
	makeAjaxCall(urlPartidos,data,successFunction,callback)

	
}

function logicaParaSeleccionYOrdenamiento(){
	$("#criterioOrdenamiento").change(function(){
		if ($(this).val() == "none") {
			$("#criterioOrdenamiento2").attr("disabled",true);
			$("#criterioOrdenamiento3").attr("disabled",true);
		} else {
			$("#criterioOrdenamiento2").attr("disabled",false);
		}
	})
	$("#criterioOrdenamiento2").change(function(){
		if ($(this).val() == "none") {
			$("#criterioOrdenamiento3").attr("disabled",true);
		} else {
			$("#criterioOrdenamiento3").attr("disabled",false);
		}
	})
	
	
}

function fillMatchesTable(_data){
	urlbase = baseUrl;
	urlPartidos = urlbase + "/generarEquipos";
		
		callback = function(){console.log("No se pudo cargar los partidos")}
		successFunction = function(data){
			
				tablaJugadores1 = $("#table1 table")
				tablaJugadores2 = $("#table2 table")
								
				tablaJugadores1.show()
				tablaJugadores2.show()
				
				$('#table1 table td').remove()
				$('#table2 table td').remove()

				for (i = 0; i < data.length; i++) {
					resultadoEquiposId.push(data[i].id)	
					
					var completedUrl = urlbase + "/detalleJugador?jugadorId=" + data[i].id

					var tableToFill = tablaJugadores1 		
					if(i>=5){
						tableToFill = tablaJugadores2
					}
				
					tableToFill.append('<tr><td><a href="'+completedUrl+'">' 
							+ data[i].nombre + '</a></td><td>'
							+ data[i].apodo    + '</td><td>' 
							+ data[i].handicap + '</td></tr>')
					}
			}

		data = _data
		makeAjaxCall(urlPartidos,data,successFunction,callback)
}

function fillMatchTable(_data){
	urlbase = baseUrl;
	urlPartidos = urlbase + "/getJugadoresDeUnPartdio";
		
		callback = function(){alert("No se pudo cargar los partidos")}
		successFunction = function(data){
			equipoJugadores = $("#equipoJugadores table")
				$('#equipoJugadores table td').remove();
			

			$("#partidotitle").append(data.nombrePartido);
			
				for (i = 0; i < data.jugadores.length; i++) {
				var completedUrl = urlbase + "/detalleJugador?jugadorId=" + data.jugadores[i].id
					
				equipoJugadores.append('<tr><td><a href="'+completedUrl+'">' + data.jugadores[i].nombre + '</a></td><td>'
							+ data.jugadores[i].apellido + '</td><td>' 
							+ data.jugadores[i].apodo    + '</td><td>' 
							+ data.jugadores[i].fechaNacimiento + '</td><td>' 
							+ data.jugadores[i].handicap + '</td></tr>')
				}

				var blue = "#00688B";
				setearColorHandicapMayorA(7, blue, equipoJugadores)
			}
		
		data = _data

		makeAjaxCall(urlPartidos,data,successFunction,callback)
}


		
</script>
</body>
</html>
