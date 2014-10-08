$(document).ready(function() {
	console.log("Se importa bien el js");
	baseUrl = "http://localhost:8090/pruebaConcepto/organizadorPartidosFutbol";
})

function makeAjaxCall(_url, _data, successAction, fallback) {
	console.log("Se realiza el llamado ajax")
	$.ajax({
		url : _url,
		data : _data,
		dataType : "json",
		success : function(data) {
			successAction(data)
		},
		error : fallback
	});
}

function excluirCheckBoxs(cb1, cb2) {
	cb1.click(function() {
		if (cb1.is(':checked')) {
			cb2.prop("disabled", true);
		} else {
			cb2.prop("disabled", false);
		}
	});
}

function validarFecha(fecha) {
	fecha.keyup(function() {
		if (fecha.val().length == 10 || fecha.val().length == 0) {
			makeAnAjaxCall(dataValues())
		}
	})
}

function setearColorHandicapMayorA(unValor, unColor, unaTabla) {
	var cantFilas = unaTabla.find('tr').length; 
	var handicapColumn = getIndexOfATitleName("Handicap", unaTabla)
	
	//i = 1 para omitir el titulo
	for (i = 1; i < cantFilas; i++) {
		var valorHandicap = $('tr:eq('+i+') td:eq('+handicapColumn+')', unaTabla).text();
		if(valorHandicap > unValor){
			$('tr:eq('+i+') td:eq('+handicapColumn+')', unaTabla).css('color',unColor).css('font-weight', "bold")
		}
	}
}

function getIndexOfATitleName(nameToFind,table) {
	return table.find('tr:first th').filter(function() {
		return $(this).text() == nameToFind;
	}).index();
}