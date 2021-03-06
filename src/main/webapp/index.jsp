<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession session_actual = request.getSession(false);
    String id = (String) session_actual.getAttribute("id");
    if (id != null) {
        response.sendRedirect("inicio.jsp");
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
<body>
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col-xl login shadow-lg rounded">
            <h1 class="text-center">Inicio de sesión</h1>
            <h2 class="text-center">Sistema de gestion de proyectos</h2>
            <img src="img/proyectosp.png" class="" alt="Proyectos">

            <form action="controllerUsuarios.jsp" method="POST">
                <input hidden name="opcion" value="inciarSesion">
                <div class="form-floating mb-3">
                    <input type="correo" class="form-control" id="correo" placeholder="name@example.com"  name="correo" required>
                    <label for="correo">Correo electronico</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                    <label for="password">Contraseña</label>
                </div>
                <br>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button name="enviar" type="submit" class="btn btn-primary">Iniciar sesion</button>
                </div>
            </form>
        </div>
        <div class="col"></div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/funciones.js"></script>
</body>
</html>
<%
    if (request.getParameter("error") != null){
        out.println("<div class=\"alert alert-warning alert-dismissible fade show fixed-top text-center\" role=\"alert\">\n" +
                "       <svg xmlns=\"http://www.w3.org/2000/svg\" style=\"display: none;\">\n" +
                "           <symbol id=\"exclamation-triangle-fill\" fill=\"currentColor\" viewBox=\"0 0 16 16\">\n" +
                "               <path d=\"M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z\"/>\n" +
                "            </symbol>\n" +
                "        </svg>\n" +
                "        <svg class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Warning:\"><use xlink:href=\"#exclamation-triangle-fill\"/></svg>\n" +
                "         <b>Email o contaseña incorrectos</b>\n" +
                "         <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                "     </div>");
    }
%>