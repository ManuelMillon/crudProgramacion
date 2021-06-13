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
    String alter = "UPDATE reserva SET fechaent = '" + fechaent + "', fechasal = '" + fechasal + "', numper = '" + numper + "', codapto = '" + codapto + "', codcli = '" + codcli + "', codage = '" + codage + "', observaciones = '" + observaciones + "' + WHERE codres = '" + codres + "'";
    
    
    out.print(alter);
    s.execute(alter);


// VUELVE A LA PÁGINA PRINCIPAL
    response.sendRedirect("reservas.jsp");

%>