package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseConnection {

    //Creating Connection
    public static Connection connection;

    public static Connection getConnection() {
        try {
            String dbDriver = "com.mysql.cj.jdbc.Driver"; 
            String dbURL = "jdbc:mysql://localhost:3306/myshop"; 
            // Database name to access 
            String dbUsername = "root"; 
            String dbPassword = ""; 
      
            Class.forName(dbDriver); 
            connection = DriverManager.getConnection(dbURL, 
                                                         dbUsername,  
                                                         dbPassword); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (connection);
    }

    public static void CloseConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
        ResultSet rs = null;
        try {
            if (connection == null) {
                getConnection();
            }
            rs = connection.createStatement().executeQuery(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    public static int insertUpdateFromSqlQuery(String SqlQueryString) {
        int i = 2;
        try {
            if (connection == null) {
                getConnection();
            }
            i = connection.createStatement().executeUpdate(SqlQueryString);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return i;
    }
}
