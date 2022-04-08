<%@ page import="proyecto.beans.CasosBean" %>
<jsp:useBean id="casoslist" class="proyecto.beans.CasosBean" scope="request"></jsp:useBean>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">Registrar nuevo caso</button><br><br>
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
            <a href="modificarCaso.jsp?id=<%= caso.getId() %>" class="btn btn-success">Modificar</a>
            <button onclick="eliminarCaso(<%= caso.getId() %>)" class="btn btn-danger">Eliminar</button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>

<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registar nuevo caso</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="controllerCasos.jsp" enctype="multipart/form-data" method="post">
                <input hidden name="opcion" value="abrirCaso">
                <div class="modal-body">
                    <div class="row g-3 align-items-center">
                        <div class="col-2">
                            <label for="descripcion_apertura" class="col-form-label">Descripcion del requerimiento: </label>
                        </div>
                        <div class="col-10">
                            <input type="text" class="form-control" id="descripcion_apertura" name="descripcion_apertura" required>
                        </div>

                        <div class="col-2">
                            <label for="pdf_apertura" class="col-form-label">PDF (opcional): </label>
                        </div>
                        <div class="col-10">
                            <input type="file" accept=".pdf" class="form-control" id="pdf_apertura" name="pdf_apertura">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar caso</button>
                </div>
            </form>
        </div>
    </div>
</div>