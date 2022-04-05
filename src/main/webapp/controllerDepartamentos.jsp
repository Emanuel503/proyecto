<%@ include file="conexion.jsp" %>
<%
    String opcion = request.getParameter("opcion");
    int id = 0;
    String codigo = "";
    String nombre = "";

    switch (opcion){
        case "guardarDepartamento":
            codigo = request.getParameter("codigo");;
            nombre = request.getParameter("nombre");
            st = conexion.prepareStatement("INSERT INTO departamentos (codigo, nombre) VALUES (?,?)");
            st.setString(1, codigo);
            st.setString(2, nombre);
            st.executeUpdate();
            response.sendRedirect("departamentos.jsp?guardado");
            break;
        case "modificarDepartamento":
            id = Integer.parseInt(request.getParameter("id"));
            codigo = request.getParameter("codigo");;
            nombre = request.getParameter("nombre");
            st = conexion.prepareStatement("UPDATE departamentos SET codigo=?, nombre=? WHERE id=?");
            st.setString(1, codigo);
            st.setString(2, nombre);
            st.setInt(3, id);
            st.executeUpdate();
            response.sendRedirect("departamentos.jsp?modificado");
            break;
        case "eliminarDepartamento":
            id = Integer.parseInt(request.getParameter("id"));
            st = conexion.prepareStatement("DELETE FROM departamentos WHERE id=?");
            st.setInt(1, id);
            st.executeUpdate();
            response.sendRedirect("departamentos.jsp?eliminado");
            break;
    }
%>