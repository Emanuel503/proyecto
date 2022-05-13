package proyecto.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CasosBean extends Conexion{
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
    private String porcentaje;
    private String observacion_devolucion;

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

    public String getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(String porcentaje) {
        this.porcentaje = porcentaje;
    }

    public String getObservacion_devolucion() {
        return observacion_devolucion;
    }

    public void setObservacion_devolucion(String observacion_devolucion) {
        this.observacion_devolucion = observacion_devolucion;
    }


    public List<CasosBean> obtenerCasosRequerimiento(){
        try {
            st = conexion.prepareStatement("SELECT c.id, c.id_estado, c.descripcion_requerimiento, c.pdf_requerimiento, e.estado, c.porcentaje, c.argumento_rechazo FROM casos c JOIN estados_casos e ON c.id_estado = e.id ORDER BY c.id_estado");
            rs = st.executeQuery();
            List<CasosBean> list = new ArrayList<>();
            while (rs.next()){
                CasosBean caso = new CasosBean();
                caso.setId(rs.getInt("id"));
                caso.setId_estado(rs.getInt("id_estado"));
                caso.setDescripcion_requerimiento(rs.getString("descripcion_requerimiento"));
                caso.setPdf_requerimiento(rs.getString("pdf_requerimiento"));
                caso.setEstado(rs.getString("estado"));
                caso.setPorcentaje(rs.getString("porcentaje"));
                caso.setArgumento_rechazo(rs.getString("argumento_rechazo"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<CasosBean> obtenerCasoRequerimiento(String id){
        try {
            st = conexion.prepareStatement("SELECT c.id, c.id_estado, c.descripcion_requerimiento, c.pdf_requerimiento, e.estado, c.porcentaje, c.argumento_rechazo FROM casos c JOIN estados_casos e ON c.id_estado = e.id WHERE c.id=?");
            st.setString(1,id);
            rs = st.executeQuery();
            List<CasosBean> list = new ArrayList<>();
            while (rs.next()){
                CasosBean caso = new CasosBean();
                caso.setId(rs.getInt("id"));
                caso.setId_estado(rs.getInt("id_estado"));
                caso.setDescripcion_requerimiento(rs.getString("descripcion_requerimiento"));
                caso.setPdf_requerimiento(rs.getString("pdf_requerimiento"));
                caso.setEstado(rs.getString("estado"));
                caso.setPorcentaje(rs.getString("porcentaje"));
                caso.setArgumento_rechazo(rs.getString("argumento_rechazo"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<CasosBean> obtenerCasoAbierto(String id){
        try {
            st = conexion.prepareStatement("SELECT C.id, C.id_estado, E.estado, C.id_programador, UP.nombre, C.id_tester, UT.nombre, C.codigo, C.descripcion_requerimiento, C.pdf_requerimiento, C.descripcion_apertura, C.pdf_apertura, C.fecha_apertura, C.fecha_limite, C.porcentaje, C.observacion_devolucion FROM casos C JOIN estados_casos E ON C.id_estado = E.id JOIN usuarios UP ON C.id_programador = UP.id JOIN usuarios UT ON C.id_tester = UT.id WHERE C.id=?");
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
                caso.setDescripcion_apertura(rs.getString("descripcion_apertura"));
                caso.setPdf_apertura(rs.getString("pdf_apertura"));
                caso.setFecha_apertura(rs.getString("fecha_apertura"));
                caso.setFecha_limite(rs.getString("fecha_limite"));
                caso.setPorcentaje(rs.getString("porcentaje"));
                caso.setObservacion_devolucion(rs.getString("observacion_devolucion"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<CasosBean> obtenerCasoAbiertoProgramador(String id_programador){
        try {
            st = conexion.prepareStatement("SELECT C.id, C.id_estado, E.estado, C.id_programador, UP.nombre, C.id_tester, UT.nombre, C.codigo, C.descripcion_requerimiento, C.pdf_requerimiento, C.descripcion_apertura, C.pdf_apertura, C.fecha_apertura, C.fecha_limite, C.porcentaje, C.observacion_devolucion FROM casos C JOIN estados_casos E ON C.id_estado = E.id JOIN usuarios UP ON C.id_programador = UP.id JOIN usuarios UT ON C.id_tester = UT.id WHERE C.id_programador=?");
            st.setString(1,id_programador);
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
                caso.setDescripcion_apertura(rs.getString("descripcion_apertura"));
                caso.setPdf_apertura(rs.getString("pdf_apertura"));
                caso.setFecha_apertura(rs.getString("fecha_apertura"));
                caso.setFecha_limite(rs.getString("fecha_limite"));
                caso.setPorcentaje(rs.getString("porcentaje"));
                caso.setObservacion_devolucion(rs.getString("observacion_devolucion"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<CasosBean> obtenerCasoAbiertoTester(String id_tester){
        try {
            st = conexion.prepareStatement("SELECT C.id, C.id_estado, E.estado, C.id_programador, UP.nombre, C.id_tester, UT.nombre, C.codigo, C.descripcion_requerimiento, C.pdf_requerimiento, C.descripcion_apertura, C.pdf_apertura, C.fecha_apertura, C.fecha_limite, C.porcentaje, C.observacion_devolucion FROM casos C JOIN estados_casos E ON C.id_estado = E.id JOIN usuarios UP ON C.id_programador = UP.id JOIN usuarios UT ON C.id_tester = UT.id WHERE C.id_tester=? AND id_estado = 5");
            st.setString(1,id_tester);
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
                caso.setDescripcion_apertura(rs.getString("descripcion_apertura"));
                caso.setPdf_apertura(rs.getString("pdf_apertura"));
                caso.setFecha_apertura(rs.getString("fecha_apertura"));
                caso.setFecha_limite(rs.getString("fecha_limite"));
                caso.setPorcentaje(rs.getString("porcentaje"));
                caso.setObservacion_devolucion(rs.getString("observacion_devolucion"));
                list.add(caso);
            }
            return list;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public int obtenerNumeroCasos(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosEspera(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 1;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosRechazados(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 2;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosEnDesarrollo(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 3;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosVencidos(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 4;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosEsperaAprovacion(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 5;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosObservaciones(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 6;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public int obtenerCasosFinalizados(){
        try {
            st = conexion.prepareStatement("SELECT COUNT(*) FROM casos WHERE id_estado = 7;");
            rs = st.executeQuery();
            rs.next();
            return rs.getInt("COUNT(*)");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }
}