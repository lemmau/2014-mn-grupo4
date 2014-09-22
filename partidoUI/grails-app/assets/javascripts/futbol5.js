
$(document).ready(function(){
	console.log("Se importa bien el js")
})

function makeAjaxCall(_url,_data,successAction,fallback){
	console.log("Se realiza el llamado ajax")
		$.ajax({
					//console.log("haciendo el llamado AJAX")
					url : _url,
					data : _data,
					dataType : "json",
					success : function(data) {
						successAction(data)
						//$("#botonAgregar").removeClass("disabled");
					},
					error : fallback
				//mostrarError
				});
	
	
}