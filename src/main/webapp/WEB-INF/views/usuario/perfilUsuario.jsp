<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- JSP para que el usuario pueda modificar su perfil --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mi perfil</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		
</head>

<body style="background-color: #2CC8E7;">

<style>
.boton {
  padding: 15px 35px;
  font-size: 18px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #166EE7;
  border: none;
  border-radius: 10px;
  box-shadow: 0 3px #999;
}

.boton:hover {background-color: #21DD27}

.b:active {
  background-color: #21DD27;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

spam {
    padding: 20px;
    color: #3629D3;
    margin-left: 12px;
	font-weight: bold;
	font-size: 20px;
}

</style>





	<div class="row bg-primary">
		<div class="col-md-5 col-md-offset-1">
			<img src="http://i65.tinypic.com/2dvizyh.png" style="width:30%;">
		</div>
		
		<div class="col-md-2 col-md-offset-4">
				<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#miModal" style="border-width: 10px;"><strong>?</strong></button>
		</div>
	</div>
	
	<div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Ayuda</h4>
					</div>
					<div class="modal-body"><%-- Poner ayuda para modificar el perfil --%>
						Para poder usar IntraVita tendr� que rellenar el cuestionario con sus datos personales, 
						respetando las pol�ticas de seguridad y estructuras que son necesarias.<br><br>
						- Para el nombre de usuario: nombre.apellido<br>
						- Para el mail: ser� el corporativo de la empresa, con la extensi�n @alu.uclm.es<br>
						- Para la contrase�a: longitud m�nima de 8 caracteres, utilizando letras y n�meros<br>
						- Para la confirmaci�n: tiene que ser igual que la contrase�a anterior<br>
						- Para la respuesta: utilice una respuesta de la que se acordar� en el futuro<br>
						- Foto de perfil: introduzca una foto suya preferentemente con fondo blanco
						
					</div>
				</div>
			</div>
		</div>
	<%-- volver al muro --%>
	<div class="row">
		<div class="col-md-1 col-md-offset-10">
			<br>
			<form action="irLogin" method="GET">
				<button class="btn btn-danger btn-block btn-md login" type="submit">Volver</button>
			</form>	
					
		<br/>
		</div>
	</div>

	<%-- action modificar perfil --%>
	<form action="modificarPerfilUsuario" method="POST"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<label for="pwd" style="color:white; font-size:15px">Modificar contrase�a:</label>
		  		<input type="password" class="form-control" id="pwd" name="txtUsuarioClave" placeholder="password">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			  	<label for="pwd1" style="color:white; font-size:15px">Confirmar Contrase�a:</label>
			  	<input type="password" class="form-control" id="pwd1" name="txtUsuarioClave1" placeholder="confirmacion password">	
			</div>
		</div>
		
	
			<script>
				$(document).on('ready', function() {
				    $("#input-b5").fileinput({showCaption: false});
				});
			</script>
			
			<br>
			<img src="input-b5" width="128px" height="128px" class="img-circle">
			</div>
		</div>
		
		<br>
		<br>
		
		<div class="row">
			<div class="col-md-2 col-md-offset-5">
				<button type="submit" class="boton btn-info btn-block" value="Modificar">Modificar perfil</button>	
			</div>
		</div>		
	</form>

	<br>
	
	<div class="row">
		<div class="col-md-12">
			<t><spam><em>${alerta}</em></spam></t>
		</div>
	</div>

	
	<div class="col-md-12" style="position: fixed; bottom: 0;">
		<div class="panel-footer">
			<h5>� Copyright 2017 IntraVita. Todos los derechos reservados.</h5>
		</div>
	</div>

</body>

</html>