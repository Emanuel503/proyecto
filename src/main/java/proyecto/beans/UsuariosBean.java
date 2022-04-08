package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuariosBean extends Conexion{
    private int id;
    private int id_departamento;
    private String departamento;
    private int id_rol;
    private String rol;
    private String nombre;
    private String identificacion;
    private String fecha_nacimiento;
    private String sexo;
    private String correo;
    private String password;

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

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
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
            st = conexion.prepareStatement("SELECT * FROM `usuarios` INNER JOIN roles_usuarios ON usuarios.id_rol = roles_usuarios.id INNER JOIN departamentos on usuarios.id_departamento = departamentos.id");
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt(1));
                usuarios.setId_departamento(rs.getInt("id_departamento"));
                usuarios.setDepartamento(rs.getString(14));
                usuarios.setId_rol(rs.getInt("id_rol"));
                usuarios.setRol(rs.getString("rol"));
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

    public List<UsuariosBean> obtenerUsuariosDepartamento(String id_departamento){
        try {
            st = conexion.prepareStatement("SELECT * FROM `usuarios` INNER JOIN roles_usuarios ON usuarios.id_rol = roles_usuarios.id INNER JOIN departamentos on usuarios.id_departamento = departamentos.id WHERE id_departamento=?");
            st.setString(1, id_departamento);
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt(1));
                usuarios.setId_departamento(rs.getInt("id_departamento"));
                usuarios.setDepartamento(rs.getString(14));
                usuarios.setId_rol(rs.getInt("id_rol"));
                usuarios.setRol(rs.getString("rol"));
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

    public List<UsuariosBean> obtenerUsuario(int id){
        try {
            st = conexion.prepareStatement("SELECT * FROM `usuarios` INNER JOIN roles_usuarios ON usuarios.id_rol = roles_usuarios.id INNER JOIN departamentos on usuarios.id_departamento = departamentos.id WHERE usuarios.id = ?");
            st.setInt(1,id);
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt(1));
                usuarios.setId_departamento(rs.getInt("id_departamento"));
                usuarios.setDepartamento(rs.getString(14));
                usuarios.setId_rol(rs.getInt("id_rol"));
                usuarios.setRol(rs.getString("rol"));
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

    public List<UsuariosBean> obtenerUsuariosProgramador(){
        try {
            st = conexion.prepareStatement("SELECT id, nombre FROM usuarios WHERE id_rol = 5;");
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt("id"));
                usuarios.setNombre(rs.getString("nombre"));
                list.add(usuarios);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<UsuariosBean> obtenerUsuariosTester(){
        try {
            st = conexion.prepareStatement("SELECT id, nombre FROM usuarios WHERE id_rol = 6;");
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt("id"));
                usuarios.setNombre(rs.getString("nombre"));
                list.add(usuarios);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<UsuariosBean> obtenerUsuariosJefes(){
        try {
            st = conexion.prepareStatement("SELECT id, nombre FROM usuarios WHERE id_rol = 3;");
            rs = st.executeQuery();
            List<UsuariosBean> list = new ArrayList<>();
            while (rs.next()){
                UsuariosBean usuarios = new UsuariosBean();
                usuarios.setId(rs.getInt("id"));
                usuarios.setNombre(rs.getString("nombre"));
                list.add(usuarios);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}