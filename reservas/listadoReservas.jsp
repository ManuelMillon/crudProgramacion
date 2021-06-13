
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        

        <link rel="stylesheet" href="../estilos/dashboard1EnCSS.css">
        <link rel="JavaScripts" href="../javascript/estilosJavaScript.js">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">    
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
        <title>Listado Reservas</title>
    </head>
    <body>


    <body class="home">
        <div class="container-fluid display-table">
            <div class="row display-table-row">
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                    <div class="logo">
                        <a hef="../login.html"><img src="../imagenes/imagenCorporativa1.jpg" alt="merkery_logo" class="hidden-xs hidden-sm">

                        </a>
                    </div>
                    <div class="navi">
                        <ul>
                            <li class="active"><a href="../index.html"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Inicio</span></a></li>
                             <li><a href="altaReserva.html"><i class="fa fa-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Crear Reserva</span></a></li>
                            <li><a href="alterReserva.html"><i class="fa fa-edit" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Modificar Reserva</span></a></li>
                            <li><a href="bajaReserva.html"><i class="fa fa-trash" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Borrar Reserva</span></a></li>
                            <li><a href="reservas.jsp"><i class="fa fa-database" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Listado Reservas</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                    <div class="row">
                        <header>
                            <div class="col-md-6 mr-auto">
                                <nav class="navbar-default pull-left">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas"
                                                data-target="#side-menu" aria-expanded="false">
                                            <span class="sr-only">Barra de Navegación</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                </nav>
                                <div class="search hidden-xs hidden-sm">
                                    <input type="text" placeholder="Búsqueda" id="search">
                                </div>
                            </div>
                            <div class="col-md-1 pull-right">
                                <div class="header-rightside">
                                    <ul class="list-inline header-top pull-right">

                                        <div class="header-rightside">
                                            <ul class="list-inline header-top pull-right">

                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img
                                                            src="../imagenes/retrato millon.jpg" alt="user">
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <div class="navbar-content">
                                                                <span>Manolo</span>

                                                                <div class="divider">
                                                                </div>
                                                                <a href="#" class="view btn-sm active">Ver perfil</a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        </header>
                                </div>

                                <div class="container-xl">
                                    <div class="table-responsive">
                                        <div class="table-wrapper">
                                            <div class="table-title">
                                                <div class="row">
                                                    
                                                    <table class="table table-striped table-hover">


                                                        
                                                        <thead>

                                                            <tr>
                                                                <th> </th>
                                                                <th>ID Reserva</th>
                                                                <th>Codigo Cliente</th>
                                                                <th>Código Apartamento</th>
                                                                <th>Nombre Agencia</th>
                                                                <th>Fecha Entrada</th>
                                                                <th>Fecha Salida</th>
                                                                <th>Número De Personas</th>
                                                                <th>Observaciones</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>     

                                                            <%    Class.forName("com.mysql.jdbc.Driver");
                                                                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
                                                                Statement s = conexion.createStatement();
                                                                ResultSet listado = s.executeQuery("SELECT * FROM reserva ORDER BY codres");
                                                                //PUEDES ORDENARLO CON DIFERENTES PÁGINAS COMO QUIERAS

                                                                while (listado.next()) {
                                                                    out.print("<tr>");

                                                                    //Código de socio
                                                                    out.print("<th>");
                                                                    out.print("</th>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("codres"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("codcli"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("codapto"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("codage"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("fechaent"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("fechasal"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("numper"));
                                                                    out.print("</td>");
                                                                    out.print("<td>");
                                                                    out.println(listado.getString("observaciones"));
                                                                    out.print("</td>");
                                                                    out.print("</tr>");
                                                                }


                                                            %>

                                                        </tbody>



                                                    </table>
                                                    <%    conexion.close();
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

                                </body>

                                </html>


