package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RolesBean extends Conexion {
    private int id;
    private String rol;

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