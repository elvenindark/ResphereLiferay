package com.resphere.view.portlet.reporte;
import java.sql.*;

public class Conexion {

String url="jdbc:postgresql://localhost:5432/Respheres2";
    
    public Connection getconexion(){
        Connection cn=null;
        try{
            Class.forName("org.postgresql.Driver");
            cn=DriverManager.getConnection(url,"postgres","admin2012");
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return cn;
    }
    
}
