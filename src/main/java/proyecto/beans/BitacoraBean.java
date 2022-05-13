package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BitacoraBean extends Conexion {
    private int id;
    private int id_caso;
    private String cambios;
    private  String fecha;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_caso() {
        return id_caso;
    }

    public void setId_caso(int id_caso) {
        this.id_caso = id_caso;
    }

    public String getCambios() {
        return cambios;
    }

    public void setCambios(String cambios) {
        this.cambios = cambios;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<BitacoraBean> obtenerBitacoraCaso(String id_caso){
        try {
            st = conexion.prepareStatement("SELECT * FROM bitacora WHERE id_caso=? ORDER BY fecha");
            st.setString(1,id_caso);
            rs = st.executeQuery();
            List<BitacoraBean> list = new ArrayList<>();
            while (rs.next()){
                BitacoraBean bitacora = new BitacoraBean();
                bitacora.setId(rs.getInt("id"));
                bitacora.setId_caso(rs.getInt("id_caso"));
                bitacora.setCambios(rs.getString("cambios"));
                bitacora.setFecha(rs.getString("fecha"));
                list.add(bitacora);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}