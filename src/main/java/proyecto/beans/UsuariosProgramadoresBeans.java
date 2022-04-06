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
    private String nombre_pogramador;
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

    public String getNombre_pogramador() {
        return nombre_pogramador;
    }

    public void setNombre_pogramador(String nombre_pogramador) {
        this.nombre_pogramador = nombre_pogramador;
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
                usuariosProgramadores.setNombre_pogramador(rs.getString(3));
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
}