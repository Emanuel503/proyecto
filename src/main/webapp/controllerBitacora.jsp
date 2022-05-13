<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>
<%@ include file="conexion.jsp" %>
<%
    HttpSession session_actual = request.getSession(false);

    String opcion = request.getParameter("opcion");
    int id = 0;
    int id_caso = 0;
    String cambios = "";
    String fecha= "";
    String porcentaje= "";

    switch (opcion){
        case "guardarBitacora":
            id_caso = Integer.parseInt(request.getParameter("id_caso"));
            cambios = request.getParameter("cambios");
            porcentaje = request.getParameter("porcentaje");

            SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd", Locale.ENGLISH);
            Date fecha_actual = new Date();
            sdf1.format(fecha_actual);
            fecha = sdf1.format(fecha_actual);

            st = conexion.prepareStatement("INSERT INTO bitacora (id_caso, cambios, fecha) VALUES (?,?,?)");
            st.setInt(1, id_caso);
            st.setString(2, cambios);
            st.setString(3, fecha);
            st.executeUpdate();

            st = conexion.prepareStatement("UPDATE casos SET porcentaje=? WHERE id=?");
            st.setString(1, porcentaje);
            st.setInt(2, id_caso);
            st.executeUpdate();
            response.sendRedirect("casos.jsp?guardado");
            break;
        case "modificarBitacora":
            id = Integer.parseInt(request.getParameter("id"));
            id_caso = Integer.parseInt(request.getParameter("id_caso"));
            cambios = request.getParameter("cambios");
            porcentaje = request.getParameter("porcentaje");

            st = conexion.prepareStatement("UPDATE bitacora SET cambios=? WHERE id=?");
            st.setString(1, cambios);
            st.setInt(2, id);
            st.executeUpdate();

            st = conexion.prepareStatement("UPDATE casos SET porcentaje=? WHERE id=?");
            st.setString(1, porcentaje);
            st.setInt(2, id_caso);
            st.executeUpdate();
            response.sendRedirect("casos.jsp?modificado");
            break;

        case "eliminarBitacora":
            try {
                id = Integer.parseInt(request.getParameter("id"));
                st = conexion.prepareStatement("DELETE FROM bitacora WHERE id=?");
                st.setInt(1, id);
                st.executeUpdate();
                response.sendRedirect("casos.jsp?eliminado");
            }catch (SQLIntegrityConstraintViolationException exception){
                response.sendRedirect("casos.jsp?error");
            }
            response.sendRedirect("casos.jsp?modificado");
            break;
    }
%>
