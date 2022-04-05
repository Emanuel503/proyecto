<%@ include file="conexion.jsp" %>
<%
    HttpSession session_actual = request.getSession(true);
    String opcion =  request.getParameter("opcion");
    int id = 0;
    int id_departamento = 0;
    int id_rol = 0;
    String nombre = "";
    String identificacion = "";
    String fecha_nacimiento = "";
    String sexo = "";
    String correo = "";
    String password = "";

    switch (opcion){
        case "inciarSesion":
            try {
                correo = request.getParameter("correo");
                password = request.getParameter("password");

                st = conexion.prepareStatement("SELECT * FROM usuarios WHERE correo=? AND password=?");
                st.setString(1, correo);
                st.setString(2, password);
                rs = st.executeQuery();
                if(rs.next()){
                    session_actual.setAttribute("id",rs.getString("id"));
                    session_actual.setAttribute("id_departamento",rs.getString("id_departamento"));
                    session_actual.setAttribute("id_rol", rs.getString("id_rol"));
                    session_actual.setAttribute("nombre",rs.getString("nombre"));
                    session_actual.setAttribute("identificacion",rs.getString("identificacion"));
                    session_actual.setAttribute("fecha_nacimiento",rs.getString("fecha_nacimiento"));
                    session_actual.setAttribute("sexo",rs.getString("sexo"));
                    session_actual.setAttribute("correo",rs.getString("correo"));
                    session_actual.setAttribute("password",rs.getString("password"));
                    response.sendRedirect("inicio.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                }
            }catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            break;
        case "cerrarSesion":
            session_actual.setAttribute("id",null);
            session_actual.setAttribute("id_departamento",null);
            session_actual.setAttribute("id_rol",null);
            session_actual.setAttribute("nombre",null);
            session_actual.setAttribute("identificacion",null);
            session_actual.setAttribute("fecha_nacimiento",null);
            session_actual.setAttribute("sexo",null);
            session_actual.setAttribute("correo",null);
            session_actual.setAttribute("password",null);
            response.sendRedirect("index.jsp");
            break;
        case "guardarUsuario":

            break;
        case "modificarUsuario":

            break;
        case "eliminarUsuario":

            break;
    }
%>