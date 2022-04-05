package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartamentosBean {
    Connection conexion =  null;
    ResultSet rs = null;
    PreparedStatement st = null;
    private int id;
    private String codigo;
    private String nombre;

    public DepartamentosBean(){
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

    public List<DepartamentosBean> mostrarDepartamentos(){
        try {
            st = conexion.prepareStatement("SELECT * FROM departamentos");
            rs = st.executeQuery();
            List<DepartamentosBean> list = new ArrayList<>();
            while (rs.next()){
                DepartamentosBean departamento = new DepartamentosBean();
                departamento.setId(rs.getInt("id"));
                departamento.setCodigo(rs.getString("codigo"));
                departamento.setNombre(rs.getString("nombre"));
                list.add(departamento);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<DepartamentosBean> mostrarDepartamento(String id){

        return null;
    }
}
