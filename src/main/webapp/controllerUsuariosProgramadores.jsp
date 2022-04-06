<%@ include file="conexion.jsp" %>
<%
    HttpSession session_actual = request.getSession(true);
    String opcion =  request.getParameter("opcion");
    int id = 0;
    int id_programador = 0;
    int id_jefe = 0;

    switch (opcion){
        case "guardarProgramador":
            id_programador = Integer.parseInt(request.getParameter("id_programador"));
            id_jefe = Integer.parseInt(request.getParameter("id_jefe"));

            st = conexion.prepareStatement("SELECT * FROM programadores WHERE id_programador=? AND id_jefe=?");
            st.setInt(1, id_programador);
            st.setInt(2, id_jefe);
            rs = st.executeQuery();

            if(rs.next()){
                response.sendRedirect("usuariosProgramadores.jsp?errorGuardar");
            }else{
                st = conexion.prepareStatement("INSERT INTO programadores (id_programador, id_jefe) VALUES (?,?)");
                st.setInt(1, id_programador);
                st.setInt(2, id_jefe);
                st.executeUpdate();
                response.sendRedirect("usuariosProgramadores.jsp?guardado");
            }
            break;
        case "eliminarProgramador":
            try {
                id = Integer.parseInt(request.getParameter("id"));
                st = conexion.prepareStatement("DELETE FROM programadores WHERE id=?");
                st.setInt(1, id);
                st.executeUpdate();
                response.sendRedirect("usuariosProgramadores.jsp?eliminado");
            }catch (SQLIntegrityConstraintViolationException exception){
                response.sendRedirect("usuariosProgramadores.jsp?error");
            }
            break;
    }
%>
