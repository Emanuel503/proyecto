package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartamentosBean extends Conexion {
    private int id;
    private String codigo;
    private String nombre;
    private String Descripcion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public List<DepartamentosBean> obtenerDepartamentos(){
        try {
            st = conexion.prepareStatement("SELECT * FROM departamentos");
            rs = st.executeQuery();
            List<DepartamentosBean> list = new ArrayList<>();
            while (rs.next()){
                DepartamentosBean departamento = new DepartamentosBean();
                departamento.setId(rs.getInt("id"));
                departamento.setCodigo(rs.getString("codigo"));
                departamento.setNombre(rs.getString("nombre"));
                departamento.setDescripcion(rs.getString("descripcion"));
                list.add(departamento);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<DepartamentosBean> obtenerDepartamento(String id){
        try {
            st = conexion.prepareStatement("SELECT * FROM departamentos WHERE id=?");
            st.setString(1,id);
            rs = st.executeQuery();
            List<DepartamentosBean> list = new ArrayList<>();
            while (rs.next()){
                DepartamentosBean departamento = new DepartamentosBean();
                departamento.setId(rs.getInt("id"));
                departamento.setCodigo(rs.getString("codigo"));
                departamento.setNombre(rs.getString("nombre"));
                departamento.setDescripcion(rs.getString("descripcion"));
                list.add(departamento);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}
