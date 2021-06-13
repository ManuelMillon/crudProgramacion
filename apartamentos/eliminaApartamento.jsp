<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexiondb.Conecta"%>
<%@page import="java.sql.Connection"%>

<%

//RECOGEMOS LOS DATOS DEL FORMULARIO
    request.setCharacterEncoding("UTF-8");

    String codapto = request.getParameter("codapto");

     
// CONECTA CON LA BASE DE DATOS
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
    Statement s = conexion.createStatement();

// INSERTA LOS DATOS EN LA TABLA
// Execute query... 
    String borrado = "DELETE FROM apartamento WHERE codapto = ( '" + codapto + "')"; 
    out.print(borrado);
    s.execute(borrado);


// VUELVE A LA PÁGINA PRINCIPAL
    response.sendRedirect("apartamento.jsp");

%>