package com.atypon.model;

import com.atypon.utility.StudentSection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Mohammad on 03/06/2017.
 */
public class StudentViewDAO {

    private static StudentViewDAO instance;
    private static final Object lock = new Object();

    private StudentViewDAO(){}

    public static StudentViewDAO getInstance(){
        if(instance == null) {
            synchronized (lock) {
                if(instance == null) {
                    instance = new StudentViewDAO();
                }
            }
        }
        return instance;
    }

    public ArrayList getStudentSections(int studentId){
        ArrayList<StudentSection> sections = new ArrayList<>();
        String sqlQuery = "SELECT course_name , name as teacher ,time ,grade ,section_id FROM student_view WHERE student_id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int sectionId = resultSet.getInt("section_id");
                int grade = resultSet.getInt("grade");
                String time = resultSet.getString("time");
                String teacherName = resultSet.getString("teacher");
                String courseName = resultSet.getString("course_name");
                sections.add(new StudentSection(sectionId,grade,teacherName,courseName,time));
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sections;
    }
}
