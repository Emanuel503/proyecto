<%@ include file="conexion.jsp" %>
<%
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

        switch (opcion){
            case "abrirCaso":
                descripcion_requerimiento = request.getParameter("descripcion_requerimiento");
                pdf_requerimiento = request.getParameter("pdf_requerimiento");

                break;

        }
%>