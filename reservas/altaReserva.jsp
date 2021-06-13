<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexiondb.Conecta"%>
<%@page import="java.sql.Connection"%>

<%

                    
//RECOGEMOS LOS DATOS DEL FORMULARIO
    request.setCharacterEncoding("UTF-8");
    String fechaent = request.getParameter("fechaent");
    String fechasal = request.getParameter("fechasal");
    String numper = request.getParameter("numper");
    String codapto = request.getParameter("codapto");
    String codcli = request.getParameter("codcli");
    String codage = request.getParameter("codage");
    String observaciones = request.getParameter("observaciones");
    
    
//CONVIERTO LOS DATOS DE nomapto A codapto

    
    
// CONECTA CON LA BASE DE DATOS
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
    Statement s = conexion.createStatement();

// INSERTA LOS DATOS EN LA TABLA
// Execute query... 

    String insercion = "INSERT into reserva (fechaent, fechasal, numper, codapto, codcli, codage, observaciones) VALUES ( '" + fechaent + "', '" + fechasal + "', '" + numper + "', '" + codapto + "', '" + codcli + "', '" + codage + "', '" + observaciones + "')";

    
    out.print(insercion);
    s.execute(insercion);


// VUELVE A LA PÁGINA PRINCIPAL
    response.sendRedirect("reservas.jsp");

%>