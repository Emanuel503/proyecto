<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="proyecto.beans.CasosBean" %>
<jsp:useBean id="casosList" class="proyecto.beans.CasosBean" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.UsuariosProgramadoresBeans" %>
<jsp:useBean id="usuarioProgramadorList" class="proyecto.beans.UsuariosProgramadoresBeans" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.UsuariosBean" %>
<jsp:useBean id="usuarioTesterList" class="proyecto.beans.UsuariosBean" scope="request"></jsp:useBean>
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
    <br><h1>Detalles del caso</h1><br>
    <a href="casos.jsp" class="btn btn-outline-secondary">Regresar</a><br><br>
    <%for (CasosBean caso: casosList.obtenerCasoRequerimiento(request.getParameter("id"))) { %>
        <div class="row g-3 align-items-center">
            <div class="col-2">
                <label for="descripcion_requerimiento" class="col-form-label">Descripcion del requerimiento: </label>
            </div>
            <div class="col-10">
                <input readonly type="text" class="form-control" id="descripcion_requerimiento" name="descripcion_requerimiento" value="<%= caso.getDescripcion_requerimiento() %>" required>
            </div>

            <div class="col-2">
                <label for="pdf_requerimiento" class="col-form-label">PDF (opcional): </label>
            </div>
            <div class="col-10">
                <input readonly type="file" accept=".pdf" class="form-control" id="pdf_requerimiento" name="pdf_requerimiento">
            </div>

            <div class="col-2">
                <label for="porcentaje" class="col-form-label">Porcentaje de avance: </label>
            </div>
            <div class="col-10">
                <input readonly type="text" class="form-control" id="porcentaje" name="porcentaje" value="<%= caso.getPorcentaje() %>%">
            </div>

            <div class="col-2">
                <label for="id_estado" class="col-form-label">Estado del caso: </label>
            </div>
            <div class="col-10">
                <input readonly type="text" class="form-control" id="id_estado" name="id_estado" value="<%= caso.getEstado() %>">
            </div>

            <% if(caso.getId_estado() == 2){ %>
                <div class="col-2">
                    <label for="argumento_rechazo1" class="col-form-label">Argumento de rechazo: </label>
                </div>
                <div class="col-10">
                    <input readonly type="text" class="form-control" id="argumento_rechazo1" name="argumento_rechazo" value="<%= caso.getArgumento_rechazo() %>">
                </div>
            <% } %>
        </div><br>
    <% if (session_actual.getAttribute("id_rol").toString().equals("3")){%>
        <% if (caso.getId_estado() == 1){%>
        <button type="button"data-bs-toggle="modal" data-bs-target="#modalAceptar" class="btn btn-success">Aceptar caso</button>
        <button type="button"data-bs-toggle="modal" data-bs-target="#modalRechazar" class="btn btn-danger">Rechazar caso</button>
        <%}%>

        <div class="modal fade" id="modalAceptar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Aceptar caso</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="controllerCasos.jsp" method="post">
                        <input hidden name="opcion" value="aceptarCaso">
                        <input hidden name="id" value="<%= request.getParameter("id")%>">
                        <div class="modal-body">
                            <div class="row g-3 align-items-center">
                                <div class="col-2">
                                    <label for="id_programador" class="col-form-label">Seleccione al programador: </label>
                                </div>
                                <div class="col-10">
                                    <select id="id_programador" name="id_programador" class="form-select">
                                        <%for (UsuariosProgramadoresBeans usuarioProgramadores: usuarioProgramadorList.obtenerUsuariosProgramadoresJefe(session_actual.getAttribute("id").toString())) { %>
                                            <option value="<%= usuarioProgramadores.getId()%>"><%= usuarioProgramadores.getNombre_programador() %></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="col-2">
                                    <label for="id_tester" class="col-form-label">Seleccione al tester: </label>
                                </div>
                                <div class="col-10">
                                    <select id="id_tester" name="id_tester" class="form-select">
                                        <%for (UsuariosBean usuarioTester: usuarioTesterList.obtenerUsuariosTester()) { %>
                                        <option value="<%= usuarioTester.getId()%>"><%= usuarioTester.getNombre() %></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="col-2">
                                    <label for="fecha_limite" class="col-form-label">Seleccione la fecha limite: </label>
                                </div>
                                <div class="col-10">
                                    <input type="date" name="fecha_limite" id="fecha_limite" class="form-control" required>
                                </div>

                                <div class="col-2">
                                    <label for="descripcion_apertura" class="col-form-label">Descripcion: </label>
                                </div>
                                <div class="col-10">
                                    <input type="text" name="descripcion_apertura" id="descripcion_apertura" class="form-control" required>
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
                            <button type="submit" class="btn btn-primary">Abrir caso</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalRechazar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Rechazar caso</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="controllerCasos.jsp" method="post">
                        <input hidden name="opcion" value="rechazarCaso">
                        <input hidden name="id" value="<%= request.getParameter("id")%>">
                        <div class="modal-body">
                            <div class="row g-3 align-items-center">
                                <div class="col-2">
                                    <label for="argumento_rechazo" class="col-form-label">Descripcion: </label>
                                </div>
                                <div class="col-10">
                                    <input type="text" name="argumento_rechazo" id="argumento_rechazo" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Rechazar caso</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <%}%>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/funciones.js"></script>
</body>
</html>
<% } %>
<% } %>