<%@ page import="proyecto.beans.CasosBean" %>
<jsp:useBean id="casoslist" class="proyecto.beans.CasosBean" scope="request"></jsp:useBean>

<table class="table table-striped table-hover table-bordered">
    <thead class="table-dark">
    <tr>
        <th>#</th>
        <th>Descripcion del requerimiento</th>
        <th>PDF apertura(opcional)</th>
        <th>Estado del caso</th>
        <th>Opciones</th>
    </tr>
    </thead>
    <tbody>
    <%
        int contador=0;
        for (CasosBean caso: casoslist.obtenerCasosRequerimiento()) {
            contador++;
    %>
    <tr>
        <td><%= contador %></td>
        <td><%= caso.getDescripcion_requerimiento() %></td>
        <td>
            <%
                if(caso.getPdf_requerimiento()==null || caso.getPdf_requerimiento().isEmpty() ){
                    out.println("Sin PDF");
                }else{
                    out.println(caso.getPdf_requerimiento());
                }
            %>
        </td>
        <td><%= caso.getEstado() %></td>
        <td>
            <% if(caso.getId_estado() == 1 || caso.getId_estado() == 2){%>
            <a href="detallesCasoRequerimientos.jsp?id=<%= caso.getId() %>" class="btn btn-primary">Detalles</a>
            <% }else{ %>
            <a href="detallesCasoAbierto.jsp?id=<%= caso.getId() %>" class="btn btn-primary">Detalles</a>
            <% } %>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>