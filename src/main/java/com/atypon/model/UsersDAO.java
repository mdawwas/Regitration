package com.atypon.model;

import com.atypon.utility.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by mdawwas on 5/24/17.
 */
public class UsersDAO {

    public void addUser(User user) throws SQLException{
        String sqlQuery = "insert into users (username ,password , name , type ) values( ? , ? ,? ,?)";
        Connection connection = null;
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setString(1, user.getUserName());
        preparedStatement.setString(2,user.getPassword());
        preparedStatement.setString(3,user.getName());
        preparedStatement.setInt(4,user.getType());
        preparedStatement.execute();

    }

    public User getUser(String userName) throws SQLException{
        String sqlQuery = "Select * from Users where username = ?";
        Connection connection = DataSource.getInstance().getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setString(1,userName);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next()) {
            String password  = resultSet.getString("password");
            String name = resultSet.getString("name");
            int type = resultSet.getInt("type");
            return new User(type,userName,password,name);
        }
        return null;
    }

    public ArrayList<User> getUsers() throws SQLException {
        ArrayList <User> usersList = new ArrayList<>();
        String sqlQuery = "select * from users";
        Connection connection = null;
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        ResultSet  resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            int id = resultSet.getInt("id");
            int type = resultSet.getInt("type");
            String userName = resultSet.getString("username");
            String name = resultSet.getString("name");
            String password = resultSet.getString("password");
            User user = new User(id,type,userName,password,name);
            usersList.add(user);
        }
        return usersList;
    }
}
