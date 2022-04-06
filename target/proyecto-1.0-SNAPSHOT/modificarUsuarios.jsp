<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="proyecto.beans.UsuariosBean" %>
<jsp:useBean id="usuariolist" class="proyecto.beans.UsuariosBean" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.RolesBean" %>
<jsp:useBean id="roleslist" class="proyecto.beans.RolesBean" scope="request"></jsp:useBean>
<%@ page import="proyecto.beans.DepartamentosBean" %>
<jsp:useBean id="departamentolist" class="proyecto.beans.DepartamentosBean" scope="request"></jsp:useBean>
<%
    HttpSession session_actual = request.getSession(false);
    String id = (String) session_actual.getAttribute("id");
    if (id == null) {
        response.sendRedirect("index.jsp");
    }
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
                <li class="nav-item">
                    <a class="nav-link" href="departamentos.jsp">
                        Departamentos
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-collection" viewBox="0 0 16 16">
                            <path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"/>
                        </svg>
                        <i class="bi bi-collection"></i>
                    </a>
                </li>
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
                        <a class="dropdown-item d-flex gap-2 align-items-center" href="usuariosProgramadores.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            </svg>
                            <i class="bi bi-person"></i>
                            Registro de programadores
                        </a>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown0" data-bs-toggle="dropdown" aria-expanded="false">Cuenta</a>
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
    <br><h1>Modificar usuario</h1><br>
    <%
        for (UsuariosBean usuario: usuariolist.obtenerUsuario(Integer.parseInt(request.getParameter("id")))) {
    %>
    <form action="controllerUsuarios.jsp" method="post">
        <input hidden name="opcion" value="modificarUsuario">
        <input hidden name="id" value="<%= request.getParameter("id") %>">
        <div class="row g-3 align-items-center">
            <div class="col-2">
                <label for="nombre" class="col-form-label">Nombre completo: </label>
            </div>
            <div class="col-10">
                <input type="text" class="form-control" id="nombre" name="nombre" required value="<%= usuario.getNombre() %>">
            </div>

            <div class="col-2">
                <label for="identificacion" class="col-form-label">Identificacion: </label>
            </div>
            <div class="col-10">
                <input type="text" class="form-control" id="identificacion" name="identificacion" required value="<%= usuario.getIdentificacion() %>">
            </div>

            <div class="col-2">
                <label for="fecha_nacimiento" class="col-form-label">Fecha de nacimiento: </label>
            </div>
            <div class="col-10">
                <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required value="<%= usuario.getFecha_nacimiento() %>">
            </div>

            <div class="col-2">
                <label for="sexo" class="col-form-label">Sexo: </label>
            </div>
            <div class="col-10">
                <select class="form-select" name="sexo" id="sexo">
                    <option <% if(usuario.getSexo().equals("Masculino")){ out.println("selected");}%>>Masculino</option>
                    <option <% if(usuario.getSexo().equals("Femenino")){ out.println("selected");}%>>Femenino</option>
                </select>
            </div>

            <div class="col-2">
                <label for="correo" class="col-form-label">Correo: </label>
            </div>
            <div class="col-10">
                <input type="email" class="form-control" id="correo" name="correo" required value="<%= usuario.getCorreo() %>">
            </div>

            <div class="col-2">
                <label for="password" class="col-form-label">Contraseña: </label>
            </div>
            <div class="col-10">
                <input type="text" class="form-control" id="password" name="password" required value="<%= usuario.getPassword() %>">
            </div>

            <div class="col-2">
                <label for="id_rol" class="col-form-label">Rol de usuario: </label>
            </div>
            <div class="col-10">
                <select class="form-select" id="id_rol" name="id_rol">
                    <%
                    for (RolesBean rol: roleslist.obtenerRoles()) {
                        if (rol.getId() == usuario.getId_rol()){ %>
                            <option selected value="<%= rol.getId()%>"><%= rol.getRol() %></option>
                        <%}else{%>
                            <option value="<%= rol.getId()%>"><%= rol.getRol() %></option>
                        <%}
                    }%>
                </select>
            </div>

            <div class="col-2">
                <label for="id_departamento" class="col-form-label">Departamento: </label>
            </div>
            <div class="col-10">
                <select class="form-select" id="id_departamento" name="id_departamento">
                    <%
                    for (DepartamentosBean departamento: departamentolist.obtenerDepartamentos()) {
                        if (departamento.getId() == usuario.getId_departamento()){ %>
                            <option selected value="<%= departamento.getId()%>"><%= departamento.getNombre() %></option>
                        <%}else{%>
                            <option value="<%= departamento.getId()%>"><%= departamento.getNombre() %></option>
                        <%}
                    }%>
                </select>
            </div>
        </div><br><br>
        <a href="usuarios.jsp" class="btn btn-secondary" >Cancelar</a>
        <button type="submit" class="btn btn-success">Modificar usuario</button>
    </form>
    <%}%>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/funciones.js"></script>
</body>
</html>