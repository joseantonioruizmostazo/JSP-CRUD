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

  <body id="index">
		<div class="container">
			<br><br>			
      <div class="panel panel-primary">
        <div class="panel-heading text-center"><h2>Jugadores y sus clubes de la Liga BBVA</h2></div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/clubes","root", "");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM jugadores INNER JOIN equipo ON jugadores.CodEqui = equipo.CodEqui");
         
        %>

        <table class="table table-striped">
        <form method="get" action="grabaJugador.jsp">
          <tr><td><input type="text" name="CodJug" size="4"></td>
              <td><input type="text" name="NomJug" size="20"></td>
              <td><input type="text" name="EdaJug" size="2"></td>
              <td><input type="text" name="PosJug" size="15"></td>
              <td><input type="text" name="AltJug" size="3"></td>
              <td><input type="text" name="PesJug" size="3"></td>
              <td><input type="text" name="PieJug" size="10"></td>
              <td><input type="text" name="CodEqui" size="2"></td>
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
        </form>
        <tr><th>Código</th><th>Nombre</th><th>Edad</th><th>Posición</th><th>Altura</th><th>Peso</th><th>Pie dominante</th><th>Codigo Equipo</th><th>Nombre Equipo</th><th>Año fundación</th></tr>
        
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("CodJug") + "</td>");
            out.println("<td>" + listado.getString("NomJug") + "</td>");
            out.println("<td>" + listado.getString("EdaJug") + "</td>");
            out.println("<td>" + listado.getString("PosJug") + "</td>");
            out.println("<td>" + listado.getString("AltJug") + "</td>");
            out.println("<td>" + listado.getString("PesJug") + "</td>");
            out.println("<td>" + listado.getString("PieJug") + "</td>");
            out.println("<td>" + listado.getString("CodEqui") + "</td>");
            out.println("<td>" + listado.getString("NomEqui") + "</td>");
            out.println("<td>" + listado.getString("FunEqui") + "</td>");
        %>
        <td>
        <form method="get" action="modificaJugador.jsp">
          <input type="hidden" name="CodJug" value="<%=listado.getString("CodJug") %>">
					<input type="hidden" name="NomJug" value="<%=listado.getString("NomJug") %>">
          <input type="hidden" name="EdaJug" value="<%=listado.getString("EdaJug") %>">
          <input type="hidden" name="PosJug" value="<%=listado.getString("PosJug") %>">
          <input type="hidden" name="AltJug" value="<%=listado.getString("AltJug") %>">
          <input type="hidden" name="PesJug" value="<%=listado.getString("PesJug") %>">
          <input type="hidden" name="PieJug" value="<%=listado.getString("PieJug") %>">
          <input type="hidden" name="CodEqui" value="<%=listado.getString("CodEqui") %>">
					<button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>
				</form>
				</td>
				<td>
        <form method="get" action="borraJugador.jsp">
          <input type="hidden" name="CodJug" value="<%=listado.getString("CodJug") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
        </form>
        </td></tr>
        <%
          } // while

          conexion.close();
        %>

        </table>
      </div>
      <div class="text-center">&copy; José Antonio Ruiz Mostazo</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>