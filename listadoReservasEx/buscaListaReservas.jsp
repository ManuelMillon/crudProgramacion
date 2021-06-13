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
    String nomapto = request.getParameter("nomapto");
    String nomcli = request.getParameter("nomcli");
    String apecli = request.getParameter("apecli");
    String nomage = request.getParameter("nomage");
    String observaciones = request.getParameter("observaciones");
    String codapto = request.getParameter("codapto");
    String codage = request.getParameter("codage");

// CONECTA CON LA BASE DE DATOS
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbddnegocio", "manolo", "666666");
    Statement s = conexion.createStatement();

// INSERTA LOS DATOS EN LA TABLA
// Execute query... 
    String actualiza = "UPDATE reserva SET codres= ('" + codres + "'),fechaent= ('" + fechaent + "'),fechasal=('" + fechasal + "'), numper= ('" + numper + "'),codapto= ('" + codapto + "'),nomcli=('" + nomcli + "'),apecli=('" + apecli + "'),codage= ('" + codage + "'),observaciones=('" + observaciones + "') WHERE codres = ('" + codres + "')";

    //out.print(actualiza);
    s.execute(actualiza);

// VUELVE A LA PÁGINA PRINCIPAL
  response.sendRedirect("listaReservas.jsp");

%>