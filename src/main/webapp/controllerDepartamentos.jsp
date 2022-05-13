<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>
<%@ include file="conexion.jsp" %>
<%
    String opcion = request.getParameter("opcion");
    int id = 0;
    String codigo = "";
    String nombre = "";
    String descripcion = "";

    switch (opcion){
        case "guardarDepartamento":

            nombre = request.getParameter("nombre");
            descripcion = request.getParameter("descripcion");

            if(nombre.isEmpty() || descripcion.isEmpty()){
                response.sendRedirect("departamentos.jsp?errorDatos");
                return;
            }

            //Generacion del codigo del departamento
            SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd", Locale.ENGLISH);
            Date fecha = new Date();
            sdf.format(fecha);
            String fechaString = sdf.format(fecha);

            Random randomNum = new Random();
            int numero = randomNum.nextInt((999 - 100 + 1) + 100);

            Random random = new Random();
            String letras = "";
            for (int i=1; i<=3; i++){
                letras += (char)(random.nextInt(26) + 'A');
            }

            codigo = letras + fechaString + numero;

            st = conexion.prepareStatement("INSERT INTO departamentos (codigo, nombre, descripcion) VALUES (?,?,?)");
            st.setString(1, codigo);
            st.setString(2, nombre);
            st.setString(3, descripcion);
            st.executeUpdate();
            response.sendRedirect("departamentos.jsp?guardado");
            break;
        case "modificarDepartamento":
            id = Integer.parseInt(request.getParameter("id"));
            nombre = request.getParameter("nombre");
            descripcion = request.getParameter("descripcion");

            if(nombre.isEmpty() || descripcion.isEmpty()){
                response.sendRedirect("departamentos.jsp?errorDatos");
                return;
            }

            st = conexion.prepareStatement("UPDATE departamentos SET nombre=?,descripcion=? WHERE id=?");
            st.setString(1, nombre);
            st.setString(2, descripcion);
            st.setInt(3, id);
            st.executeUpdate();
            response.sendRedirect("departamentos.jsp?modificado");
            break;
        case "eliminarDepartamento":
            try {
                id = Integer.parseInt(request.getParameter("id"));
                st = conexion.prepareStatement("DELETE FROM departamentos WHERE id=?");
                st.setInt(1, id);
                st.executeUpdate();
                response.sendRedirect("departamentos.jsp?eliminado");
            }catch (SQLIntegrityConstraintViolationException exception){
                response.sendRedirect("departamentos.jsp?error");
            }
            break;
    }
%>