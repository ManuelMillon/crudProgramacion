<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexiondb.Conecta"%>
<%@page import="java.sql.Connection"%>

<%

//RECOGEMOS LOS DATOS DEL FORMULARIO
    request.setCharacterEncoding("UTF-8");

    String codcli = request.getParameter("codcli");
    String nomcli = request.getParameter("nomcli");
    String apecli = request.getParameter("apecli");
    String contaccli = request.getParameter("contaccli");

// CONECTA CON LA BASE DE DATOS
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
    Statement s = conexion.createStatement();

// INSERTA LOS DATOS EN LA TABLA
// Execute query... 
    String actualiza = "UPDATE cliente SET nomcli= ('" + nomcli + "'),apecli= ('" + apecli + "'),contaccli=('" + contaccli + "') WHERE codcli = ('" + codcli + "')";

    out.print(actualiza);
    s.execute(actualiza);

// VUELVE A LA PÁGINA PRINCIPAL
  response.sendRedirect("cliente.jsp");

%>