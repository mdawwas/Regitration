package com.atypon.model;

import com.atypon.utility.Section;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Mohammad on 01/06/2017.
 */
public class SectionsDAO {
    private static SectionsDAO instance;

    private SectionsDAO(){}

    public static SectionsDAO getInstance(){
        if(instance == null)
            instance = new SectionsDAO();
        return instance;
    }

    public ArrayList<Section> getSections(){
        ArrayList<Section> sections = new ArrayList<>();
        String sqlQuery = "SELECT sections.id , sections.course_id , sections.teacher_id ,sections.time , courses.course_name FROM sections , courses WHERE courses.id = course_id";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                int courseId = resultSet.getInt("course_id");
                int teacherId = resultSet.getInt("teacher_id");
                String time = resultSet.getString("time");
                String courseName = resultSet.getString("course_name");
                sections.add(new Section(id,teacherId,courseId,time,courseName));
            }
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return sections;
    }

    public boolean addSection(Section section){
        String sqlQuery = "insert into Sections (teacher_id,course_id,time) values(?,?,?)";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,section.getTeacherId());
            preparedStatement.setInt(2,section.getCourseId());
            preparedStatement.setString(3,section.getTime());
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void deleteSection(int id){
        String sqlQuery = "delete from Sections where id = ?";
        Connection connection = DataSource.getInstance().getConnection();
        try{
            PreparedStatement preparedStatement= connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
            DataSource.getInstance().returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}