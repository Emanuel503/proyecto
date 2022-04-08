package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CasosBean {
    Connection conexion =  null;
    ResultSet rs = null;
    PreparedStatement st = null;
    private int id;
    private int id_estado;
    private String estado;
    private int id_programador;
    private String nombre_programador;
    private int id_tester;
    private String nombre_tester;
    private String codigo;
    private String descripcion_requerimiento;
    private String pdf_requerimiento;
    private String argumento_rechazo;
    private String descripcion_apertura;
    private String pdf_apertura;
    private String fecha_apertura;
    private String fecha_limite;

    public CasosBean(){
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

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_programador() {
        return id_programador;
    }

    public void setId_programador(int id_programador) {
        this.id_programador = id_programador;
    }

    public String getNombre_programador() {
        return nombre_programador;
    }

    public void setNombre_programador(String nombre_programador) {
        this.nombre_programador = nombre_programador;
    }

    public int getId_tester() {
        return id_tester;
    }

    public void setId_tester(int id_tester) {
        this.id_tester = id_tester;
    }

    public String getNombre_tester() {
        return nombre_tester;
    }

    public void setNombre_tester(String nombre_tester) {
        this.nombre_tester = nombre_tester;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion_requerimiento() {
        return descripcion_requerimiento;
    }

    public void setDescripcion_requerimiento(String descripcion_requerimiento) {
        this.descripcion_requerimiento = descripcion_requerimiento;
    }

    public String getPdf_requerimiento() {
        return pdf_requerimiento;
    }

    public void setPdf_requerimiento(String pdf_requerimiento) {
        this.pdf_requerimiento = pdf_requerimiento;
    }

    public String getArgumento_rechazo() {
        return argumento_rechazo;
    }

    public void setArgumento_rechazo(String argumento_rechazo) {
        this.argumento_rechazo = argumento_rechazo;
    }

    public String getDescripcion_apertura() {
        return descripcion_apertura;
    }

    public void setDescripcion_apertura(String descripcion_apertura) {
        this.descripcion_apertura = descripcion_apertura;
    }

    public String getPdf_apertura() {
        return pdf_apertura;
    }

    public void setPdf_apertura(String pdf_apertura) {
        this.pdf_apertura = pdf_apertura;
    }

    public String getFecha_apertura() {
        return fecha_apertura;
    }

    public void setFecha_apertura(String fecha_apertura) {
        this.fecha_apertura = fecha_apertura;
    }

    public String getFecha_limite() {
        return fecha_limite;
    }

    public void setFecha_limite(String fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

    public List<CasosBean> obtenerCasos(){
        try {
            st = conexion.prepareStatement("SELECT C.id, C.id_estado, E.estado, C.id_programador, UP.nombre, C.id_tester, UT.nombre, C.codigo, C.descripcion_requerimiento, C.pdf_requerimiento, C.argumento_rechazo, C.descripcion_apertura, C.pdf_apertura, C.fecha_apertura, C.fecha_limite FROM casos C JOIN estados_casos E ON C.id_estado = E.id JOIN usuarios UP ON C.id_programador = UP.id JOIN usuarios UT ON C.id_tester = UT.id;");
            rs = st.executeQuery();
            List<CasosBean> list = new ArrayList<>();
            while (rs.next()){
                CasosBean caso = new CasosBean();
                caso.setId(rs.getInt("id"));
                caso.setId_estado(rs.getInt("id_estado"));
                caso.setEstado(rs.getString("estado"));
                caso.setId_programador(rs.getInt("id_programador"));
                caso.setNombre_programador(rs.getString(5));
                caso.setId_tester(rs.getInt("id_tester"));
                caso.setNombre_tester(rs.getString(7));
                caso.setCodigo(rs.getString("codigo"));
                caso.setDescripcion_requerimiento(rs.getString("descripcion_requerimiento"));
                caso.setPdf_requerimiento(rs.getString("pdf_requerimiento"));
                caso.setArgumento_rechazo(rs.getString("argumento_rechazo"));
                caso.setDescripcion_apertura(rs.getString("descripcion_apertura"));
                caso.setPdf_apertura(rs.getString("pdf_apertura"));
                caso.setFecha_apertura(rs.getString("fecha_apertura"));
                caso.setFecha_limite(rs.getString("fecha_limite"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<CasosBean> obtenerCaso(String id){
        try {
            st = conexion.prepareStatement("SELECT C.id, C.id_estado, E.estado, C.id_programador, UP.nombre, C.id_tester, UT.nombre, C.codigo, C.descripcion_requerimiento, C.pdf_requerimiento, C.argumento_rechazo, C.descripcion_apertura, C.pdf_apertura, C.fecha_apertura, C.fecha_limite FROM casos C JOIN estados_casos E ON C.id_estado = E.id JOIN usuarios UP ON C.id_programador = UP.id JOIN usuarios UT ON C.id_tester = UT.id WHERE C.id=?");
            st.setString(1,id);
            rs = st.executeQuery();
            List<CasosBean> list = new ArrayList<>();
            while (rs.next()){
                CasosBean caso = new CasosBean();
                caso.setId(rs.getInt("id"));
                caso.setId_estado(rs.getInt("id_estado"));
                caso.setEstado(rs.getString("estado"));
                caso.setId_programador(rs.getInt("id_programador"));
                caso.setNombre_programador(rs.getString(5));
                caso.setId_tester(rs.getInt("id_tester"));
                caso.setNombre_tester(rs.getString(7));
                caso.setCodigo(rs.getString("codigo"));
                caso.setDescripcion_requerimiento(rs.getString("descripcion_requerimiento"));
                caso.setPdf_requerimiento(rs.getString("pdf_requerimiento"));
                caso.setArgumento_rechazo(rs.getString("argumento_rechazo"));
                caso.setDescripcion_apertura(rs.getString("descripcion_apertura"));
                caso.setPdf_apertura(rs.getString("pdf_apertura"));
                caso.setFecha_apertura(rs.getString("fecha_apertura"));
                caso.setFecha_limite(rs.getString("fecha_limite"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}