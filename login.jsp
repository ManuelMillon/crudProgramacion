<%@page import="java.util.HashMap"%>


<html lang="en">
    ?
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- 1- introducimos estilo bootstrap PARA EL JS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        ?
        <link rel="stylesheet" href="estilos/estilocss.css">
        <script src="javascript/javascriptValidacion.js"></script>

        <title>Log In</title>
        <style>
            p {color:white;
               visibility: hidden;}
            </style>

        </head>
        ?
        <body>
            <div class="login">
            <h1>ACCESO</h1>
            <form method="post" onsubmit ="return validarFormulario()" action="login.html">
                <!-- 2- cada campo tiene un div de la class form-group que los envuelve-->
                <div class="form-group">
                    <input type="text" placeholder="Correo electrónico" required="required" class="form-control"
                           id="correo" name="correo" aria-describedby="correoHelp" onfocus="desmarcarError('correo')" />
                    <p id="correoHelp" class="form-text text-muted">Un correo para entrar</p>
                </div>
                <div class="form-group">
                    <input type="contrasena" name="contrasena" placeholder="Contraseña" required="required" class="form-control"
                           id="contrasena" aria-describedby="contrasenaHelp" onfocus="desmarcarError('contrasena')" />
                    <p id="contrasenaHelp" class="form-text text-muted">Números, may, min y caracteres especiales</p>
                </div>  
                <button onclick="return validarFormulario()" type="submit" class="btn btn-primary btn-block btn-large">Entrar</button>
            </form>
        </div>
        ?

        <%

                        HashMap<String, String> correoContrasena = new HashMap<String, String>();
		
		
		

                        correoContrasena.put("mamamaria@gmail.com", "Qwer123@-");
                        correoContrasena.put("papamanuel@gmail.com", "Qwer123@-");
                        correoContrasena.put("hijoantonio@gmail.com", "Quer123@-");
                        correoContrasena.put("hijomanuel@gmail.com", "Qwer123@-");

		
                        request.setCharacterEncoding("UTF-8");
                        String correo = request.getParameter("correo");
                        String contrasena = request.getParameter("contrasena");
		
		
                        if (correoContrasena.containsKey(correo)) {
			
			
                                if (correoContrasena.get(correo).equals(contrasena)) {
				
                                        response.sendRedirect("index.html");
                                } else {
                                        out.print("<script> alert('Contraseña incorrecta');</script>");
                                }
                        } else {
                                out.print("<script> alert('El usuario introducido no existe');</script>");
                        }
        %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    </body>
    ?
</html>
