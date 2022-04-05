<%@ page import="java.sql.*" %>
<%
    Connection conexion = null;
    ResultSet rs = null;
    PreparedStatement st = null;
    Class.forName("com.mysql.jdbc.Driver");
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/proyectopoo", "root", "");
%>