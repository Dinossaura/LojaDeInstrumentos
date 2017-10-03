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
        String url = "jdbc:derby://localhost:1527/MadeinAstec";
        try {
            Class.forName("com.derby.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection (url, "Astec", "astec");
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
