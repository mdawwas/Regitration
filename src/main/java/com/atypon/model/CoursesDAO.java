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

    public void addCourse(String courseName , String courseDescription) throws SQLException {
        String sqlQuery = "insert into courses (course_Name , courseDescription) VALUES (?,?)";
        Connection connection = DataSource.getInstance().getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setString(1,courseName);
        preparedStatement.setString(2,courseDescription);
        preparedStatement.execute();
    }

    public void deleteCourse(int id) throws SQLException {
        String sqlQuery = "delete from courses where id = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setInt(1,id);
        preparedStatement.execute();
    }

    public ArrayList<Course> getCourses() throws SQLException {
        ArrayList<Course> courses = new ArrayList<>();
        String sqlQuery = "select * from courses";
        Connection connection = null;
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            int id = resultSet.getInt("id");
            String courseName = resultSet.getString("course_Name");
            String courseDescription = resultSet.getString("course_description");
            courses.add(new Course(id,courseName,courseDescription));
        }
        return courses;
    }


}
