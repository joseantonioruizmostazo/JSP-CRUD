<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="crud.css">

    <title>Jugadores y sus clubes de La Liga BBVA - José Antonio Ruiz Mostazo</title>
  </head>
  <body id="correcto">
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/clubes","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE jugadores SET "
                           + "NomJug='" + request.getParameter("NomJug")
                           + "', EdaJug=" + Integer.valueOf(request.getParameter("EdaJug"))
                           + ", PosJug='" + request.getParameter("PosJug")
                           + "', AltJug=" + Integer.valueOf(request.getParameter("AltJug"))
                           + ", PesJug=" + Integer.valueOf(request.getParameter("PesJug"))
                           + ", PieJug='" + request.getParameter("PieJug")
                           + "', CodEqui=" + Integer.valueOf(request.getParameter("CodEqui"))
                           + " WHERE CodJug=" + Integer.valueOf(request.getParameter("CodJug"));
      s.execute(actualizacion);
      out.println("jugador actualizado correctamente.");
      
      conexion.close();
    %>
    <br>
    <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>