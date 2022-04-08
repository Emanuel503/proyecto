<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="proyecto.beans.UsuariosBean" %>
<jsp:useBean id="usuariolist" class="proyecto.beans.UsuariosBean" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.UsuariosProgramadoresBeans" %>
<jsp:useBean id="usuarioprogramadoreslist" class="proyecto.beans.UsuariosProgramadoresBeans" scope="request"></jsp:useBean>
<%
    HttpSession session_actual = request.getSession(false);
    String id = (String) session_actual.getAttribute("id");
    if (id == null) {
        response.sendRedirect("index.jsp");
    }else{
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="css/estilos.css" rel="stylesheet">
    <title>Sistema de proyectos</title>
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="inicio.jsp">
                        Inicio
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                            <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                        </svg>
                        <i class="bi bi-house"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="casos.jsp">
                        Casos
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3-fill" viewBox="0 0 16 16">
                            <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2H0zm0 1v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3H0z"/>
                        </svg>
                        <i class="bi bi-calendar3-fill"></i>
                    </a>
                </li>
                <%
                    if (session_actual.getAttribute("id_rol").equals("1")){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="departamentos.jsp">
                        Departamentos
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-collection" viewBox="0 0 16 16">
                            <path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"/>
                        </svg>
                        <i class="bi bi-collection"></i>
                    </a>
                </li>
                <% } %>
                <%
                    if (session_actual.getAttribute("id_rol").equals("1") || session_actual.getAttribute("id_rol").equals("2") || session_actual.getAttribute("id_rol").equals("3")){
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">Usuario</a>
                    <ul class="dropdown-menu dropdown-menu-dark mx-0 border-0 shadow" aria-labelledby="dropdown08">
                        <a class="dropdown-item d-flex gap-2 align-items-center" href="usuarios.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            </svg>
                            <i class="bi bi-person"></i>
                            Registro de usuarios
                        </a>
                        <%
                            if (session_actual.getAttribute("id_rol").equals("1")){
                        %>
                        <a class="dropdown-item d-flex gap-2 align-items-center" href="usuariosProgramadores.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            </svg>
                            <i class="bi bi-person"></i>
                            Registro de programadores
                        </a>
                        <% } %>
                    </ul>
                </li>
                <% } %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown0" data-bs-toggle="dropdown" aria-expanded="false">Cuenta <% out.print(session_actual.getAttribute("rol").toString()); %></a>
                    <ul class="dropdown-menu dropdown-menu-dark mx-0 border-0 shadow" aria-labelledby="dropdown0">
                        <a class="dropdown-item d-flex gap-2 align-items-center" href="informacion.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                            </svg>
                            <i class="bi bi-info-circle"></i>
                            Informacion
                        </a>
                        <a href="controllerUsuarios.jsp?opcion=cerrarSesion" class="dropdown-item d-flex gap-2 align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                                <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                            </svg>
                            <i class="bi bi-box-arrow-left"></i>
                            Cerrar sesion
                        </a>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<body>
<div class="container">
    <br><h1>Registro de programadores</h1><br>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">Registrar programador</button><br><br>
    <table class="table table-striped table-hover table-bordered">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Nombre del programador</th>
            <th>Nombre del jefe</th>
            <th>Opciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            int contador=0;
            for (UsuariosProgramadoresBeans usuariosProgramadores: usuarioprogramadoreslist.obtenerUsuariosProgramadores()) {
                contador++;
        %>
        <tr>
            <td><%= contador %></td>
            <td><%= usuariosProgramadores.getNombre_programador() %></td>
            <td><%= usuariosProgramadores.getNombre_jefe() %></td>
            <td>
                <button onclick="eliminarProgramador(<%= usuariosProgramadores.getId() %>)" class="btn btn-danger">Eliminar</button>
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
            <form action="controllerUsuariosProgramadores.jsp" method="post">
                <input hidden name="opcion" value="guardarProgramador">
                <div class="modal-body">
                    <div class="row g-3 align-items-center">
                        <div class="col-2">
                            <label for="id_programador" class="col-form-label">Seleccione el empleado: </label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" id="id_programador" name="id_programador">
                                <%
                                for (UsuariosBean usuariosProgramador: usuariolist.obtenerUsuariosProgramador()) {%>
                                    <option value="<%= usuariosProgramador.getId()%>"><%= usuariosProgramador.getNombre() %></option>
                                <%}%>
                            </select>
                        </div>

                        <div class="col-2">
                            <label for="id_jefe" class="col-form-label">Seleccione el jefe: </label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" id="id_jefe" name="id_jefe">
                                <%
                                for (UsuariosBean usuariosJefes: usuariolist.obtenerUsuariosJefes()) {%>
                                    <option value="<%= usuariosJefes.getId()%>"><%= usuariosJefes.getNombre() %></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar programador</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/funciones.js"></script>
</body>
</html>
<%
    if (request.getParameter("guardado") != null){
        out.println("<div class=\"alert alert-success alert-dismissible fade show fixed-top text-center\" role=\"alert\">\n" +
                "       <svg xmlns=\"http://www.w3.org/2000/svg\" style=\"display: none;\">\n" +
                "          <symbol id=\"check-circle-fill\" fill=\"currentColor\" viewBox=\"0 0 16 16\">\n" +
                "              <path d=\"M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z\"/>\n" +
                "           </symbol>\n" +
                "        </svg>\n" +
                "        <svg class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Success:\"><use xlink:href=\"#check-circle-fill\"/></svg>\n" +
                "         <b>Usuario registrado correctamente</b>\n" +
                "         <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                "     </div>");
    }

    if (request.getParameter("eliminado") != null){
        out.println("<div class=\"alert alert-warning alert-dismissible fade show fixed-top text-center\" role=\"alert\">\n" +
                "       <svg xmlns=\"http://www.w3.org/2000/svg\" style=\"display: none;\">\n" +
                "          <symbol id=\"check-circle-fill\" fill=\"currentColor\" viewBox=\"0 0 16 16\">\n" +
                "              <path d=\"M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z\"/>\n" +
                "           </symbol>\n" +
                "        </svg>\n" +
                "        <svg class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Success:\"><use xlink:href=\"#check-circle-fill\"/></svg>\n" +
                "         <b>Usuario eliminado correctamente</b>\n" +
                "         <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                "     </div>");
    }

    if (request.getParameter("error") != null){
        out.println("<div class=\"alert alert-danger alert-dismissible fade show fixed-top text-center\" role=\"alert\">\n" +
                "       <svg xmlns=\"http://www.w3.org/2000/svg\" style=\"display: none;\">\n" +
                "          <symbol id=\"check-circle-fill\" fill=\"currentColor\" viewBox=\"0 0 16 16\">\n" +
                "              <path d=\"M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z\"/>\n" +
                "           </symbol>\n" +
                "        </svg>\n" +
                "        <svg class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Success:\"><use xlink:href=\"#check-circle-fill\"/></svg>\n" +
                "         <b>No se puede eliminar este programador por ya tiene otros registros</b>\n" +
                "         <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                "     </div>");
    }

    if (request.getParameter("errorGuardar") != null){
        out.println("<div class=\"alert alert-warning alert-dismissible fade show fixed-top text-center\" role=\"alert\">\n" +
                "       <svg xmlns=\"http://www.w3.org/2000/svg\" style=\"display: none;\">\n" +
                "           <symbol id=\"exclamation-triangle-fill\" fill=\"currentColor\" viewBox=\"0 0 16 16\">\n" +
                "               <path d=\"M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z\"/>\n" +
                "            </symbol>\n" +
                "        </svg>\n" +
                "        <svg class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Warning:\"><use xlink:href=\"#exclamation-triangle-fill\"/></svg>\n" +
                "         <b>Registro ya existente</b>\n" +
                "         <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                "     </div>");
    }
}
%>