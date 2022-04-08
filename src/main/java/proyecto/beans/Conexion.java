package proyecto.beans;

import java.sql.*;

public class Conexion {
    Connection conexion =  null;
    ResultSet rs = null;
    PreparedStatement st = null;

    public Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/proyectopoo","root","");
        }catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
