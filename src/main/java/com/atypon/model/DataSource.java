package com.atypon.model;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by mdawwas on 5/28/17.
 */
public class DataSource {
    private static DataSource     datasource;
    private static ArrayList<Connection> connections;
    private static final Object lock = new Object();

    private DataSource() {
        connections = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            for(int  i = 0; i < 10 ; ++ i){
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Registration","root","root");
                connections.add(connection);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static DataSource getInstance() {
        if (datasource == null) {
            synchronized (lock) {
                if (datasource == null) {
                    datasource = new DataSource();
                }
            }
        }
        return datasource;
    }

    public Connection getConnection(){
        while (connections.isEmpty()) {
            synchronized (lock){
                try {
                    wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            };
        }
        return connections.remove(connections.size()-1);
    }

    public void returnConnection(Connection connection){
        connections.add(connection);
        synchronized (lock){
            notifyAll();
        }
    }

}
