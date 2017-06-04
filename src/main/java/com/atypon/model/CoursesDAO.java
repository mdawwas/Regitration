package com.atypon.model;

import com.atypon.utility.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by mdawwas on 5/24/17.
 */
public class CoursesDAO {

    private static CoursesDAO instance;
    private static final Object lock = new Object();
    private CoursesDAO(){}

    public static CoursesDAO getInstance(){
        if(instance == null) {
            synchronized (lock) {
                if(instance == null) {
                    instance = new CoursesDAO();
                }
            }
        }
        return instance;
    }

    public boolean addCourse(String courseName , String courseDescription) {
        String sqlQuery = "insert into courses (course_name , course_description) VALUES (?,?)";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1,courseName);
            preparedStatement.setString(2,courseDescription);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void deleteCourse(int id){
        String sqlQuery = "delete from courses where id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Course> getCourses() {
        ArrayList<Course> courses = new ArrayList<>();
        String sqlQuery = "select * from courses";
        try {
            Connection connection = DataSource.getInstance().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String courseName = resultSet.getString("course_Name");
                String courseDescription = resultSet.getString("course_description");
                courses.add(new Course(id, courseName, courseDescription));
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }


}
