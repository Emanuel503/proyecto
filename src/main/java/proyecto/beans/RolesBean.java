package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RolesBean {
    Connection conexion =  null;
    ResultSet rs = null;
    PreparedStatement st = null;
    private int id;
    private String rol;

    public RolesBean(){
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

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public List<RolesBean> obtenerRoles(){
        try {
            st = conexion.prepareStatement("SELECT * FROM roles_usuarios");
            rs = st.executeQuery();
            List<RolesBean> list = new ArrayList<>();
            while (rs.next()){
                RolesBean roles = new RolesBean();
                roles.setId(rs.getInt("id"));
                roles.setRol(rs.getString("rol"));
                list.add(roles);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<RolesBean> obtenerRol(String id){
        try {
            st = conexion.prepareStatement("SELECT * FROM roles_usuarios WHERE id=?");
            st.setString(1,id);
            rs = st.executeQuery();
            List<RolesBean> list = new ArrayList<>();
            while (rs.next()){
                RolesBean roles = new RolesBean();
                roles.setId(rs.getInt("id"));
                roles.setRol(rs.getString("rol"));
                list.add(roles);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}