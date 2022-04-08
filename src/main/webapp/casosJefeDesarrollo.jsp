<%@ page import="proyecto.beans.CasosBean" %>
<jsp:useBean id="casoslist" class="proyecto.beans.CasosBean" scope="request"></jsp:useBean>

<table class="table table-striped table-hover table-bordered">
    <thead class="table-dark">
    <tr>
        <th>#</th>
        <th>Codigo</th>
        <th>Descripcion del requerimiento</th>
        <th>PDF apertura(opcional)</th>
        <th>Estado del caso</th>
        <th>Opciones</th>
    </tr>
    </thead>
    <tbody>
    <%
        int contador=0;
        for (CasosBean caso: casoslist.obtenerCasos()) {
            contador++;
    %>
    <tr>
        <td><%= contador %></td>
        <td><%= caso.getCodigo() %></td>
        <td><%= caso.getDescripcion_apertura() %></td>
        <td><%= caso.getPdf_apertura() %></td>
        <td><%= caso.getEstado() %></td>
        <td>
            <a href="detallesCaso.jsp?id=<%= caso.getId() %>" class="btn btn-primary">Detalles</a>
            <a href="modificarUsuarios.jsp?id=<%= caso.getId() %>" class="btn btn-success">Modificar</a>
            <button onclick="eliminarCaso(<%= caso.getId() %>)" class="btn btn-danger">Eliminar</button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>