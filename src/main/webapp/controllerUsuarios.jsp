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
                    response.sendRedirect("index.jsp?error");
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
            id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
            id_rol = Integer.parseInt(request.getParameter("id_rol"));
            nombre = request.getParameter("nombre");
            identificacion = request.getParameter("identificacion");;
            fecha_nacimiento = request.getParameter("fecha_nacimiento");;
            sexo = request.getParameter("sexo");;
            correo = request.getParameter("correo");;
            password = request.getParameter("password");;
            st = conexion.prepareStatement("INSERT INTO usuarios (id_departamento, id_rol, nombre, identificacion, fecha_nacimiento, sexo, correo, password) VALUES (?,?,?,?,?,?,?,?)");
            st.setInt(1, id_departamento);
            st.setInt(2, id_rol);
            st.setString(3, nombre);
            st.setString(4, identificacion);
            st.setString(5, fecha_nacimiento);
            st.setString(6, sexo);
            st.setString(7, correo);
            st.setString(8, password);
            st.executeUpdate();
            response.sendRedirect("usuarios.jsp?guardado");
            break;
        case "modificarUsuario":
            id = Integer.parseInt(request.getParameter("id"));
            id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
            id_rol = Integer.parseInt(request.getParameter("id_rol"));
            nombre = request.getParameter("nombre");
            identificacion = request.getParameter("identificacion");;
            fecha_nacimiento = request.getParameter("fecha_nacimiento");;
            sexo = request.getParameter("sexo");;
            correo = request.getParameter("correo");;
            password = request.getParameter("password");;
            st = conexion.prepareStatement("UPDATE usuarios SET(id_departamento=?, id_rol=?, nombre=?, identificacion=?, fecha_nacimiento=?, sexo=?, correo=?, password=?) WHERE id=?");
            st.setInt(1, id_departamento);
            st.setInt(2, id_rol);
            st.setString(3, nombre);
            st.setString(4, identificacion);
            st.setString(5, fecha_nacimiento);
            st.setString(6, sexo);
            st.setString(7, correo);
            st.setString(8, password);
            st.setInt(10, id);
            st.executeUpdate();
            response.sendRedirect("usuarios.jsp?modificado");

            break;
        case "eliminarUsuario":
                id = Integer.parseInt(request.getParameter("id"));
                st = conexion.prepareStatement("DELETE FROM usuarios WHERE id=?");
                st.setInt(1, id);
                st.executeUpdate();
                response.sendRedirect("usuarios.jsp?eliminado");
            break;
    }
%>