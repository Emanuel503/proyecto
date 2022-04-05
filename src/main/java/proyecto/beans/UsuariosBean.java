package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuariosBean {
    Connection conexion =  null;
    ResultSet rs = null;
    PreparedStatement st = null;
    private int id;
    private int id_departamento;
    private int id_rol;
    private String nombre;
    private String identificacion;
    private String fecha_nacimiento;
    private String sexo;
    private String correo;
    private String password;

    public UsuariosBean(){
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

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<UsuariosBean> obtenerUsuarios(){
        try {
            st = conexion.prepareStatement("SELECT * FROM usuarios");
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt("id"));
                usuarios.setId_departamento(rs.getInt("id_departamento"));
                usuarios.setId_rol(rs.getInt("id_rol"));
                usuarios.setNombre(rs.getString("nombre"));
                usuarios.setIdentificacion(rs.getString("identificacion"));
                usuarios.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                usuarios.setSexo(rs.getString("sexo"));
                usuarios.setCorreo(rs.getString("correo"));
                usuarios.setPassword(rs.getString("password"));
                list.add(usuarios);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<UsuariosBean> obtenerUsuario(String id){
        try {
            st = conexion.prepareStatement("SELECT * FROM usuarios WHERE id = ?");
            st.setString(1,id);
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt("id"));
                usuarios.setId_departamento(rs.getInt("id_departamento"));
                usuarios.setId_rol(rs.getInt("id_rol"));
                usuarios.setNombre(rs.getString("nombre"));
                usuarios.setIdentificacion(rs.getString("identificacion"));
                usuarios.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                usuarios.setSexo(rs.getString("sexo"));
                usuarios.setCorreo(rs.getString("correo"));
                usuarios.setPassword(rs.getString("password"));
                list.add(usuarios);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}