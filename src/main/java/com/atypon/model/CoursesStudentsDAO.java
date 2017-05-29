package com.atypon.model;

import com.atypon.utility.StudentCourse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by mdawwas on 5/24/17.
 */
public class CoursesStudentsDAO {

    public ArrayList<StudentCourse> studentCourses(int studentId) throws SQLException {
        ArrayList <StudentCourse> courses = new ArrayList<>();
        String sqlQuery = "SELECT * FROM courses LEFT JOIN Courses_Students ON courses.id = Courses_Students.Course_Id and Courses_Students.Student_Id = ? UNION SELECT * FROM courses RIGHT JOIN Courses_Students ON courses.id = Courses_Students.Course_Id and Courses_Students.Student_Id = ?)";
        Connection connection = null;
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setInt(1,studentId);
        preparedStatement.setInt(2,studentId);
        ResultSet resultSet =  preparedStatement.executeQuery();
        while(resultSet.next()){
            String courseName = resultSet.getString("course_name");
            int grade = resultSet.getInt("grade");
            courses.add(new StudentCourse(grade,courseName));
        }
        return courses;

    }
}
