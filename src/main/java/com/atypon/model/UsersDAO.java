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

    private static UsersDAO instance;
    private static final Object lock = new Object();

    private UsersDAO(){

    }

    public static UsersDAO getInstance(){
        if(instance == null) {
            synchronized (lock) {
                if(instance == null) {
                    instance = new UsersDAO();
                }
            }
        }
        return instance;
    }

    public boolean addUser(User user) {
        String sqlQuery = "insert into users (username ,password , name , type ) values( ? , ? ,? ,?)";
        Connection connection = DataSource.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setInt(4, user.getType());
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public User doLogin(String userName , String password){
        String sqlQuery = "Select * from users where username = ? and password =  ?";
        Connection connection = DataSource.getInstance().getConnection();

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1,userName);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {

                String name = resultSet.getString("name");
                int type = resultSet.getInt("type");
                int id = resultSet.getInt("id");
                return new User(id,type,userName,password,name);
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    public ArrayList<User> getUsers() {
        ArrayList <User> usersList = new ArrayList<>();
        String sqlQuery = "select * from users";
        try {
            Connection connection = DataSource.getInstance().getConnection();
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
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }

    public ArrayList<User> getTeachers() {
        ArrayList <User> usersList = new ArrayList<>();
        String sqlQuery = "select * from users where type = ?";
        try {
            Connection connection = DataSource.getInstance().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,1);
            ResultSet  resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                User user = new User(id,name);
                usersList.add(user);
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }

    public ArrayList<User> getNotInSectionStudents(int sectionId){
        ArrayList <User> students = new ArrayList<>();
        String sqlQuery = "select id,name from users where id not in (select student_id from section_students where section_id not in(select id from sections where course_id not in(select course_id from sections where id = ?)) ) AND type = 2";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,sectionId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int studentId = resultSet.getInt("id");
                String studentName = resultSet.getString("name");
                students.add(new User(studentId,studentName));
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public void deleteUser(int id){
        String sqlQuery = "delete from users where id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


}
