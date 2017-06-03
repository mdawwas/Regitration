package com.atypon.model;

import com.atypon.utility.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Mohammad on 03/06/2017.
 */
public class SectionStudentsDAO {
    private static SectionStudentsDAO instance;

    private SectionStudentsDAO(){}

    public static SectionStudentsDAO getInstance() {
        if(instance == null)
            instance = new SectionStudentsDAO();
        return instance;
    }

    public ArrayList<User> getSectionStudents(int sectionId){
        ArrayList<User> students = new ArrayList<>();
        String sqlQuery = "SELECT section_students.student_id , users.name as student_name FROM section_students , users where (section_students.student_id = users.id) and section_students.section_Id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,sectionId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("student_name");
                students.add(new User(studentId,studentName));
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }

    public void addSectionStudent(int sectionId , int studentId){
        String sqlQuery = "insert into section_students (section_id,student_id) values(?,?)";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,sectionId);
            preparedStatement.setInt(2,studentId);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletStudentFromSection(int studentId , int sectionId){
        String sqlQuery = "Delete from section_students where section_id = ? and student_id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,sectionId);
            preparedStatement.setInt(2,studentId);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<User> getTeacherStudents(int sectionId){
        ArrayList<User> students = new ArrayList<>();
        String sqlQuery = "SELECT users.id ,users.name ,section_students.grade FROM users,section_students WHERE users.id = section_students.student_id and section_students.section_id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,sectionId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int grade = resultSet.getInt("grade");
                students.add(new User(id,grade,name));
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public void editGrade(int sectionId , int studentId , int grade){
        String sqlQuery = "update section_students set grade = ? where section_id = ? and student_id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,grade);
            preparedStatement.setInt(2,sectionId);
            preparedStatement.setInt(3,studentId);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
