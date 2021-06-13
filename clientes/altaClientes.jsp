<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexiondb.Conecta"%>
<%@page import="java.sql.Connection"%>

<%

//RECOGEMOS LOS DATOS DEL FORMULARIO
    request.setCharacterEncoding("UTF-8");
    
    String nomcli = request.getParameter("nomcli");
    String apecli = request.getParameter("apecli");
    String contaccli = request.getParameter("contaccli");

     
// CONECTA CON LA BASE DE DATOS
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
    Statement s = conexion.createStatement();

// INSERTA LOS DATOS EN LA TABLA
// Execute query... 
    String insercion = "INSERT INTO cliente(nomcli, apecli, contaccli) VALUES ('" + nomcli + "', '" + apecli + "', '" + contaccli + "')";
    out.print(insercion);
    s.execute(insercion);

    

// VUELVE A LA PÁGINA PRINCIPAL
    response.sendRedirect("cliente.jsp");

%>