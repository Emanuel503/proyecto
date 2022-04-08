<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="proyecto.beans.UsuariosProgramadoresBeans" %>
<jsp:useBean id="usuariolist" class="proyecto.beans.UsuariosProgramadoresBeans" scope="request"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session_actual = request.getSession(false);
%>
<table class="table table-striped table-hover table-bordered">
    <thead class="table-dark">
    <tr>
        <th>#</th>
        <th>Nombre del programador</th>
        <th>Identificacion</th>
        <th>Correo</th>
        <th>Opciones</th>
    </tr>
    </thead>
    <tbody>
    <%
        int contador=0;
        for (UsuariosProgramadoresBeans usuario: usuariolist.obtenerUsuariosProgramadoresJefe(session_actual.getAttribute("id").toString())) {
            contador++;
    %>
    <tr>
        <td><%= contador %></td>
        <td><%= usuario.getNombre_programador() %></td>
        <td><%= usuario.getIdentificacion() %></td>
        <td><%= usuario.getCorreo() %></td>
        <td>
            <a href="detallesUsuario.jsp?id=<%= usuario.getId() %>" class="btn btn-success">Detalles</a>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
</div>