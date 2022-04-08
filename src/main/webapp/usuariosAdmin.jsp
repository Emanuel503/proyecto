<%@ page import="proyecto.beans.UsuariosBean" %>
<jsp:useBean id="usuariolist" class="proyecto.beans.UsuariosBean" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.RolesBean" %>
<jsp:useBean id="roleslist" class="proyecto.beans.RolesBean" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.DepartamentosBean" %>
<jsp:useBean id="departamentolist" class="proyecto.beans.DepartamentosBean" scope="request"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">Registrar usuario</button><br><br>
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
        for (UsuariosBean usuario: usuariolist.obtenerUsuarios()) {
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
            <a href="modificarUsuarios.jsp?id=<%= usuario.getId() %>" class="btn btn-success">Modificar</a>
            <button onclick="eliminarUsuario(<%= usuario.getId() %>)" class="btn btn-danger">Eliminar</button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
</div>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registar usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="controllerUsuarios.jsp" method="post">
                <input hidden name="opcion" value="guardarUsuario">
                <div class="modal-body">
                    <div class="row g-3 align-items-center">
                        <div class="col-2">
                            <label for="nombre" class="col-form-label">Nombre completo: </label>
                        </div>
                        <div class="col-10">
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <div class="col-2">
                            <label for="identificacion" class="col-form-label">Identificacion: </label>
                        </div>
                        <div class="col-10">
                            <input type="text" class="form-control" id="identificacion" name="identificacion" required>
                        </div>

                        <div class="col-2">
                            <label for="fecha_nacimiento" class="col-form-label">Fecha de nacimiento: </label>
                        </div>
                        <div class="col-10">
                            <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
                        </div>

                        <div class="col-2">
                            <label for="sexo" class="col-form-label">Sexo: </label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" name="sexo" id="sexo">
                                <option>Masculino</option>
                                <option>Femenino</option>
                            </select>
                        </div>

                        <div class="col-2">
                            <label for="correo" class="col-form-label">Correo: </label>
                        </div>
                        <div class="col-10">
                            <input type="email" class="form-control" id="correo" name="correo" required>
                        </div>

                        <div class="col-2">
                            <label for="password" class="col-form-label">Contraseña: </label>
                        </div>
                        <div class="col-10">
                            <input type="text" class="form-control" id="password" name="password" required>
                        </div>

                        <div class="col-2">
                            <label for="id_rol" class="col-form-label">Rol de usuario: </label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" id="id_rol" name="id_rol">
                                <%
                                    for (RolesBean rol: roleslist.obtenerRoles()) {%>
                                <option value="<%= rol.getId()%>"><%= rol.getRol() %></option>
                                <%}%>
                            </select>
                        </div>

                        <div class="col-2">
                            <label for="id_departamento" class="col-form-label">Departamento: </label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" id="id_departamento" name="id_departamento">
                                <%
                                    for (DepartamentosBean departamento: departamentolist.obtenerDepartamentos()) {%>
                                <option value="<%= departamento.getId()%>"><%= departamento.getNombre() %></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar usuario</button>
                </div>
            </form>
        </div>
    </div>
</div>