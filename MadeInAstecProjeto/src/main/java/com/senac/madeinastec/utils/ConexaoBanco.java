package com.senac.madeinastec.utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author uriel.oliveira
 */
public class ConexaoBanco {
    
    public Connection createConnection(){
        String url = "jdbc:mysql://localhost:3306/xgamesproject";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection (url, "root", "110500");
            System.out.println("conectado");
            
            return conn;
        } catch (SQLException e) {
            System.out.println("Deu ruim" +e);
        }catch (Exception e) {
              System.out.println("Deu ruim" +e);
        } 
            return null;
    }
}
