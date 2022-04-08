<%@ page import="proyecto.beans.UsuariosBean" %>
<jsp:useBean id="usuariolist" class="proyecto.beans.UsuariosBean" scope="request"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session_actual = request.getSession(false);
%>
<table class="table table-striped table-hover table-bordered">
    <thead class="table-dark">
    <tr>
        <th>#</th>
        <th>Nombre completo</th>
        <th>Identificacion</th>
        <th>Fecha nacimiento</th>
        <th>Sexo</th>
        <th>Correo</th>
        <th>Password</th>
        <th>Rol de usuario</th>
        <th>Departamento</th>
        <th>Opciones</th>
    </tr>
    </thead>
    <tbody>
    <%
        int contador=0;
        for (UsuariosBean usuario: usuariolist.obtenerUsuariosDepartamento(session_actual.getAttribute("id_departamento").toString())) {
            contador++;
    %>
    <tr>
        <td><%= contador %></td>
        <td><%= usuario.getNombre() %></td>
        <td><%= usuario.getIdentificacion() %></td>
        <td><%= usuario.getFecha_nacimiento() %></td>
        <td><%= usuario.getSexo() %></td>
        <td><%= usuario.getCorreo() %></td>
        <td><%= usuario.getPassword() %></td>
        <td><%= usuario.getRol() %></td>
        <td><%= usuario.getDepartamento() %></td>
        <td>
            <a href="detallesUsuario.jsp?id=<%= usuario.getId() %>" class="btn btn-success">Detalles</a>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
</div>