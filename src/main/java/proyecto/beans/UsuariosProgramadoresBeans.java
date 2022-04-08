package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuariosProgramadoresBeans {
    Connection conexion =  null;
    ResultSet rs = null;
    PreparedStatement st = null;
    private int id;
    private int id_programador;
    private String identificacion;
    private String correo;
    private String nombre_programador;
    private int id_jefe;
    private String nombre_jefe;

    public UsuariosProgramadoresBeans(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/proyectopoo","root","");
        }catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_programador() {
        return id_programador;
    }

    public void setId_programador(int id_programador) {
        this.id_programador = id_programador;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre_programador() {
        return nombre_programador;
    }

    public void setNombre_programador(String nombre_programador) {
        this.nombre_programador = nombre_programador;
    }

    public int getId_jefe() {
        return id_jefe;
    }

    public void setId_jefe(int id_jefe) {
        this.id_jefe = id_jefe;
    }

    public String getNombre_jefe() {
        return nombre_jefe;
    }

    public void setNombre_jefe(String nombre_jefe) {
        this.nombre_jefe = nombre_jefe;
    }

    public List<UsuariosProgramadoresBeans> obtenerUsuariosProgramadores(){
        try {
            st = conexion.prepareStatement("SELECT P.id,P.id_programador, U.nombre, P.id_jefe ,J.nombre FROM programadores P JOIN usuarios U ON P.id_programador = U.id JOIN usuarios J ON P.id_jefe = J.id");
            rs = st.executeQuery();
            List<UsuariosProgramadoresBeans> list = new ArrayList<>();
            while (rs.next()){
                UsuariosProgramadoresBeans usuariosProgramadores = new UsuariosProgramadoresBeans();
                usuariosProgramadores.setId(rs.getInt(1));
                usuariosProgramadores.setId_programador(rs.getInt(2));
                usuariosProgramadores.setNombre_programador(rs.getString(3));
                usuariosProgramadores.setId_jefe(rs.getInt(4));
                usuariosProgramadores.setNombre_jefe(rs.getString(5));
                list.add(usuariosProgramadores);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<UsuariosProgramadoresBeans> obtenerUsuariosProgramadoresJefe(String id_jefe){
        try {
            st = conexion.prepareStatement("SELECT P.id,P.id_programador, U.nombre, U.identificacion, U.correo FROM programadores P JOIN usuarios U ON P.id_programador = U.id JOIN usuarios J ON P.id_jefe = J.id WHERE id_jefe = ?");
            st.setString(1,id_jefe);
            rs = st.executeQuery();
            List<UsuariosProgramadoresBeans> list = new ArrayList<>();
            while (rs.next()){
                UsuariosProgramadoresBeans usuariosProgramadores = new UsuariosProgramadoresBeans();
                usuariosProgramadores.setId(rs.getInt(1));
                usuariosProgramadores.setId_programador(rs.getInt(2));
                usuariosProgramadores.setNombre_programador(rs.getString(3));
                usuariosProgramadores.setIdentificacion(rs.getString(4));
                usuariosProgramadores.setCorreo(rs.getString(5));
                list.add(usuariosProgramadores);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}