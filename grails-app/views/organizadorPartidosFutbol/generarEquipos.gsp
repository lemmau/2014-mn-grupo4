<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Organizador de Partidos de F&uacute;tbol 5</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 8em 1em;
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

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 2em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="page-body" role="main" align="center">
			<p>A continuacion seleccione algunos de los botones a los que intenta acceder:</p>

		<div id="status" >
			<h1><a href="http://localhost:8080/OrganizadorDePartidosDeFutbol/organizadorPartidosFutbol/generarEquipos">Generar Equipos</a></h1>
		</div>
		
		<div id="status">
			<h1><a href="http://localhost:8080/OrganizadorDePartidosDeFutbol/organizadorPartidosFutbol/busquedaDeJugadores" >B&uacute;squeda de Jugadores</a></h1>
		</div>

&nbsp;-
<hr />
			<p><u>Nota</u>:<i>Tenga en cuenta que los partidos estan sujetos a disponibilidad de canchas, cuestiones metereol&oacute;gicas, entre otros.</i></p>

			<p><b><font size="2">admin@dds-utn.com</font> </b></p>
		</div>
	</body>
</html>
