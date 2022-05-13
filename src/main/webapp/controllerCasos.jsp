<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Calendar" %>
<%@ include file="conexion.jsp" %>
<%
    HttpSession session_actual = request.getSession(false);

    String opcion = request.getParameter("opcion");
    int id = 0;
    int id_estado = 0;
    String estado = "";
    int id_programador = 0;
    String nombre_programador = "";
    int id_tester = 0;
    String nombre_tester = "";
    String codigo= "";
    String descripcion_requerimiento = "";
    String pdf_requerimiento = "";
    String argumento_rechazo = "";
    String descripcion_apertura = "";
    String pdf_apertura = "";
    String fecha_apertura = "";
    String fecha_limite = "";
    String porcentaje= "";
    String observacion_devolucion="";

    switch (opcion){
        case "abrirCaso":
            descripcion_requerimiento = request.getParameter("descripcion_requerimiento");
            pdf_requerimiento = request.getParameter("pdf_requerimiento");
            id_estado = 1;
            porcentaje = "0";

            if(descripcion_requerimiento.isEmpty()){
                response.sendRedirect("casos.jsp?errorDatos");
            }

            st = conexion.prepareStatement("INSERT INTO casos (id_estado, descripcion_requerimiento, pdf_requerimiento, porcentaje) VALUES (?,?,?,?)");
            st.setInt(1, id_estado);
            st.setString(2, descripcion_requerimiento);
            st.setString(3, pdf_requerimiento);
            st.setString(4, porcentaje);
            st.executeUpdate();
            response.sendRedirect("casos.jsp?guardado");
            break;
        case "aceptarCaso":
            id = Integer.parseInt(request.getParameter("id"));
            id_programador = Integer.parseInt(request.getParameter("id_programador"));
            id_tester = Integer.parseInt(request.getParameter("id_tester"));
            descripcion_apertura = request.getParameter("descripcion_apertura");
            fecha_limite = request.getParameter("fecha_limite");
            pdf_apertura = request.getParameter("pdf_apertura");

            id_estado = 3;

            //Generacion de la fecha actual
            SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd", Locale.ENGLISH);
            Date fecha_actual = new Date();
            sdf1.format(fecha_actual);
            fecha_apertura = sdf1.format(fecha_actual);

            //Generacion del codigo del caso
            SimpleDateFormat sdf = new SimpleDateFormat("yy", Locale.ENGLISH);
            Date fecha = new Date();
            sdf.format(fecha);
            String fechaString = sdf.format(fecha);
            Random randomNum = new Random();
            int numero = randomNum.nextInt((999 - 100 + 1) + 100);
            String codigoDepartamento = session_actual.getAttribute("codigo").toString();
            codigo = codigoDepartamento + fechaString + numero;

            st = conexion.prepareStatement("UPDATE casos SET id_estado=? id_programador=?, id_tester=?, codigo=?, descripcion_apertura=?, pdf_apertura=?, fecha_apertura=?, fecha_limite=? WHERE id=?");
            st.setInt(1, id_estado);
            st.setInt(2, id_programador);
            st.setInt(3, id_tester);
            st.setString(4, codigo);
            st.setString(5, descripcion_apertura);
            st.setString(6, pdf_apertura);
            st.setString(7, fecha_apertura);
            st.setString(8, fecha_limite);
            st.setInt(9, id);
            st.executeUpdate();
            response.sendRedirect("casos.jsp?modificado");
            break;

        case "rechazarCaso":
            id = Integer.parseInt(request.getParameter("id"));
            argumento_rechazo = request.getParameter("argumento_rechazo");
            id_estado = 2;

            if(argumento_rechazo.isEmpty()){
                response.sendRedirect("casos.jsp?errorDatos");
                return;
            }

            st = conexion.prepareStatement("UPDATE casos SET id_estado=?, argumento_rechazo=? WHERE id=?");
            st.setInt(1, id_estado);
            st.setString(2, argumento_rechazo);
            st.setInt(3, id);
            st.executeUpdate();
            response.sendRedirect("casos.jsp?modificado");
            break;

        case "eliminarCasoRequerimiento":
            try {
                id = Integer.parseInt(request.getParameter("id"));
                st = conexion.prepareStatement("DELETE FROM casos WHERE id=?");
                st.setInt(1, id);
                st.executeUpdate();
                response.sendRedirect("casos.jsp?eliminado");
            }catch (SQLIntegrityConstraintViolationException exception){
                response.sendRedirect("casos.jsp?error");
            }
            break;

        case "modificarCasoRequerimiento":
            id = Integer.parseInt(request.getParameter("id"));
            descripcion_requerimiento = request.getParameter("descripcion_requerimiento");
            pdf_requerimiento = request.getParameter("pdf_requerimiento");

            if(descripcion_requerimiento.isEmpty()){
                response.sendRedirect("casos.jsp?errorDatos");
                return;
            }

            st = conexion.prepareStatement("UPDATE casos SET descripcion_requerimiento=?,pdf_requerimiento=? WHERE id=?");
            st.setString(1, descripcion_requerimiento);
            st.setString(2, pdf_requerimiento);
            st.setInt(3, id);
            st.executeUpdate();
            response.sendRedirect("casos.jsp?modificado");
            break;

        case "cerrarCaso":
            id = Integer.parseInt(request.getParameter("id"));
            fecha_limite = request.getParameter("fecha_limite");
            fecha_apertura = request.getParameter("fecha_apertura");
            porcentaje = "100";

            SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

            Date fechaActual = new Date(System.currentTimeMillis());
            Date fechaLimite = date.parse(fecha_limite);

            int dias = (int) ((fechaLimite.getTime()-fechaActual.getTime())/1000/60/60/24);

            if(dias < 0 ){
                id_estado = 4;
            }else{
                id_estado = 5;
            }

            st = conexion.prepareStatement("UPDATE casos SET id_estado=?, porcentaje=? WHERE id=?");
            st.setInt(1, id_estado);
            st.setString(2, porcentaje);
            st.setInt(3, id);
            st.executeUpdate();

            response.sendRedirect("casos.jsp?modificado");
            break;

        case "aprovarCaso":
            id = Integer.parseInt(request.getParameter("id"));
            id_estado = 7;

            st = conexion.prepareStatement("UPDATE casos SET id_estado=? WHERE id=?");
            st.setInt(1, id_estado);
            st.setInt(2, id);
            st.executeUpdate();

            response.sendRedirect("casos.jsp?modificado");
            break;

        case "devolverCaso":
            id = Integer.parseInt(request.getParameter("id"));
            id_estado = 6;
            observacion_devolucion = request.getParameter("observacion_devolucion");
            fecha_limite = request.getParameter("fecha_limite");

            String[] f = fecha_limite.split("-");
            Calendar calendar = Calendar.getInstance();
            calendar.set(Integer.parseInt(f[0]), Integer.parseInt(f[1])-1, Integer.parseInt(f[2]));

            calendar.add(Calendar.DAY_OF_MONTH, 7);
            SimpleDateFormat fe = new SimpleDateFormat("YYYY-MM-dd");
            String nuevaFecha = fe.format(calendar.getTime());

            st = conexion.prepareStatement("UPDATE casos SET id_estado=?, fecha_limite=? , observacion_devolucion=? WHERE id=?");
            st.setInt(1, id_estado);
            st.setString(2, nuevaFecha);
            st.setString(3, observacion_devolucion);
            st.setInt(4, id);
            st.executeUpdate();

            response.sendRedirect("casos.jsp?modificado");
            break;
    }
%>