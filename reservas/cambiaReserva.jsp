<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexiondb.Conecta"%>
<%@page import="java.sql.Connection"%>

<%

//RECOGEMOS LOS DATOS DEL FORMULARIO
    request.setCharacterEncoding("UTF-8");

    String codres = request.getParameter("codres");
    String fechaent = request.getParameter("fechaent");
    String fechasal = request.getParameter("fechasal");
    String numper = request.getParameter("numper");
    String codapto = request.getParameter("codapto");
    String codcli = request.getParameter("codcli");
    String codage = request.getParameter("codage");
    String observaciones = request.getParameter("observaciones");
// CONECTA CON LA BASE DE DATOS
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
    Statement s = conexion.createStatement();

// INSERTA LOS DATOS EN LA TABLA
// Execute query... 
    String buscar = "SELECT * FROM reserva WHERE codres = '" + codres + "'";

    //out.print(buscar);
    s.execute(buscar);


%>

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
        <title>Cambio Cliente</title>
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
                            <li><a href="altaClientes.html"><i class="fa fa-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Crear Cliente</span></a></li>
                            <li><a href="alterClientes.html"><i class="fa fa-edit" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Modificar Cliente</span></a></li>
                            <li><a href="bajaClientes.html"><i class="fa fa-trash" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Borrar Cliente</span></a></li>
                            <li><a href="cliente.jsp"><i class="fa fa-database" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Listado Clientes</span></a></li>
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
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                            <span class="sr-only">Barra de Navegación</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                </nav>
                                <div class="search">
                                    <h2>Modificar Reserva</h2>

                                </div>
                            </div>
                            <div class="col-md-1 pull-right hidden-xs hidden-sm">
                                <div class="header-rightside">
                                    <ul class="list-inline header-top pull-right">

                                        <div class="header-rightside">
                                            <ul class="list-inline header-top pull-right">

                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../imagenes/retrato millon.jpg" alt="user">
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




                                                <%    Class.forName("com.mysql.jdbc.Driver");

                                                    ResultSet listado = s.executeQuery(buscar);
                                                    //PUEDES ORDENARLO CON DIFERENTES PÁGINAS COMO QUIERAS

                                                    listado.next();


                                                %>


                                                <div class="col-sm-12">


                                                    <form action="buscaCambiaReserva.jsp" method="GET"> 
                                                        <div class="form-group col-md-3 ">
                                                            <label>ID Reserva</label>
                                                            <input type="text" class="form-control" disabled  value="<%=codres%>">
                                                            <input type="hidden" class="form-control" name="codres" value="<%=codres%>">
                                                        </div>
                                                        <div class="form-group col-md-3 ">
                                                            <label>ID Cliente</label>
                                                            <input type="text" class="form-control" required name="codcli" value="<%=listado.getString("codcli")%>">
                                                        </div>


                                                        <div class="form-group col-md-3">
                                                            <label>Apartamento</label>

                                                            <select class="form-control" required name="codapto" id="codapto">
                                                                <option value="1">Deluxe Supreme Suite</option>
                                                                <option value="2">Royal Executive Suite</option>
                                                                <option value="3">Mediterranean Suite</option>
                                                                <option value="4">Luxury Frontbeach Suite</option>
                                                            </select>
                                                        </div> 
                                                        <!--           <div class="form-group col-md-3 ">
                                                                      <label>ID Apartamento</label>
                                                                      <input type="text" class="form-control" required name="codapto" value="<%=listado.getString("codapto")%>">
                                                                  </div> 
  
  
                                                                  
                                                         <div class="form-group col-md-3">
                                                              <label>Apartamento</label>
  
                                                              <select class="form-control" required name="codapto" id="codapto">
                                                                  <option value="1">Deluxe Supreme Suite</option>
                                                                  <option value="2">Royal Executive Suite</option>
                                                                  <option value="3">Mediterranean Suite</option>
                                                                  <option value="4">Luxury Frontbeach Suite</option>
  
                                                              </select>
                                                          </div>-->
                                                        <!--              <div class="form-group col-md-3">
                                                                         <label>ID Agencia</label>
                                                                         <input type="text" class="form-control" required name="codage" value="<%=listado.getString("codage")%>">
                                                                     </div> -->


                                                        <div class="form-group col-md-3">
                                                            <label>Agencia</label>

                                                            <select class="form-control" required name="codage" id="codage">
                                                                <option value="1">Página Web</option>
                                                                <option value="2">Privado</option>
                                                                <option value="3">AirBnB</option>
                                                                <option value="4">Booking</option>
                                                                <option value="<5">Home Away</option>
                                                                <option value="6">Trip Advisor</option>
                                                                <option value="7">Otro</option>
                                                            </select>
                                                        </div>  

                                                        <div class="form-group col-md-3 ">
                                                            <label>Entrada</label>
                                                            <input type="text" class="form-control" placeholder="AAAA-MM-DD" required name="fechaent" value="<%=listado.getString("fechaent")%>">
                                                        </div>
                                                        <div class="form-group col-md-3 ">
                                                            <label>Salida</label>
                                                            <input type="text" class="form-control" placeholder="AAAA-MM-DD" required name="fechasal" value="<%=listado.getString("fechasal")%>">
                                                        </div>
                                                        <div class="form-group col-md-3 ">
                                                            <label>Número Personas</label>
                                                            <input type="text" class="form-control" required name="numper" value="<%=listado.getString("numper")%>">
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label>Observaciones</label>
                                                            <input type="text" class="form-control" required name="observaciones" value="<%=listado.getString("observaciones")%>">
                                                        </div>
                                                        <div class="form-group col-md-3 ">
                                                        <input type="submit" class="btn btn-info mx-auto" value="Guardar">
                                                        </div>
                                                        </div>
                                                        

                                                    </form>

                                                </div>        
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


