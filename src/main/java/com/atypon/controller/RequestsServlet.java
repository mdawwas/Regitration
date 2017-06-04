package com.atypon.controller;

import com.atypon.model.*;
import com.atypon.utility.Course;
import com.atypon.utility.Section;
import com.atypon.utility.StudentSection;
import com.atypon.utility.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

/**
 * Created by mdawwas on 5/29/17.
 */
public class RequestsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processResquests(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processResquests(request,response);
    }

    protected void processResquests( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        HttpSession session = request.getSession();
        if(action.equals("/login.do")){
            User user = UsersDAO.getInstance().doLogin(request.getParameter("username"),request.getParameter("password"));

            if(user!=null){
                session.setAttribute("user",user);
                response.sendRedirect("/home.page");
            }else{
                request.setAttribute("message","Error !");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }

        }else if(action.equals("/home.page")){
            RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
            rd.forward(request,response);
        }else if(action.equals("/users.page")){
            ArrayList<User> users = UsersDAO.getInstance().getUsers();
            request.setAttribute("users_list",users);
            RequestDispatcher rd = request.getRequestDispatcher("users.jsp");
            rd.forward(request,response);
        }else if(action.equals("/courses.page")){
            ArrayList<Course> courses = CoursesDAO.getInstance().getCourses();
            request.setAttribute("courses_list",courses);
            RequestDispatcher rd = request.getRequestDispatcher("courses.jsp");
            rd.forward(request,response);
        }else if(action.equals("/add_user.page")){
            RequestDispatcher rd = request.getRequestDispatcher("Add_user.jsp");
            rd.forward(request,response);
        }else if(action.equals("/users.add")){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            int type = Integer.parseInt(request.getParameter("type"));
            boolean done  = UsersDAO.getInstance().addUser(new User(type,username,password,name));
            if(done){
                request.setAttribute("Message","The user " + username + "Added successfully");
                response.sendRedirect("/users.page");
            }else{
                request.setAttribute("Message","Something went error : The user " + username + "already exist or there is an internal error");
                request.getRequestDispatcher("/add_user.page").forward(request,response);
            }
        }else if(action.equals("/add_course.page")){
            RequestDispatcher rd = request.getRequestDispatcher("Add_course.jsp");
            rd.forward(request,response);
        }else if(action.equals("/courses.add")){
            String courseName = request.getParameter("course_name");
            String courseDescription = request.getParameter("course_description");
            boolean done = CoursesDAO.getInstance().addCourse(courseName,courseDescription);
            if(done){
                request.setAttribute("Message","The course " + courseName + "Added successfully");
                response.sendRedirect("/courses.page");
            }else{
                request.setAttribute("Message","Something went error : The course " + courseName + "already exist or there is an internal error");
                request.getRequestDispatcher("/add_course.page").forward(request,response);
            }
        }else if(action.equals("/sections.page")){
            ArrayList<Section> sections = SectionsDAO.getInstance().getSections();
            request.setAttribute("sections_list",sections);
            RequestDispatcher rd = request.getRequestDispatcher("sections.jsp");
            rd.forward(request,response);
        }else if(action.equals("/add_section.page")){
            ArrayList<Course> courses = CoursesDAO.getInstance().getCourses();
            request.setAttribute("courses_list",courses);
            ArrayList<User> teachers = UsersDAO.getInstance().getTeachers();
            request.setAttribute("teachers_list",teachers);
            RequestDispatcher rd = request.getRequestDispatcher("Add_section.jsp");
            rd.forward(request,response);
        }else if(action.equals("/sections.add")){
            int teacherId = Integer.parseInt(request.getParameter("teacher"));
            int courseId =  Integer.parseInt(request.getParameter("course"));
            String time = request.getParameter("time");
            boolean done = SectionsDAO.getInstance().addSection(new Section(teacherId,courseId,time));
            if(done){
                request.setAttribute("Message","The Section Added successfully");
                request.getRequestDispatcher("/sections.page").forward(request,response);
            }else{
                request.setAttribute("Message","Something went error : The teacher have another section at the same time or there is an internal error");
                request.getRequestDispatcher("/add_section.page").forward(request,response);
            }
        }else if(action.equals("/mysections.page")){
            int studentId = ((User)session.getAttribute("user")).getId();
            ArrayList <StudentSection> sections = StudentViewDAO.getInstance().getStudentSections(studentId);
            request.setAttribute("sections_list",sections);
            request.getRequestDispatcher("StudentSections.jsp").forward(request,response);
        }else if(action.equals("/courses.delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            CoursesDAO.getInstance().deleteCourse(id);
            response.sendRedirect("/courses.page");
        }else if(action.equals("/sections.delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            SectionsDAO.getInstance().deleteSection(id);
            response.sendRedirect("/sections.page");
        }else if(action.equals("/edit.section")){
            int secId = Integer.parseInt(request.getParameter("id"));
            ArrayList <User> sectionStudents = SectionStudentsDAO.getInstance().getSectionStudents(secId);
            request.setAttribute("section_students_list",sectionStudents);
            ArrayList<User> notInSectionStudent = UsersDAO.getInstance().getNotInSectionStudents(secId);
            request.setAttribute("students_list",notInSectionStudent);
            request.getRequestDispatcher("EditSectionStudents.jsp").forward(request,response);
        }else if(action.equals("/section.students.add")){
            int studentId = Integer.parseInt(request.getParameter("student"));
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            SectionStudentsDAO.getInstance().addSectionStudent(sectionId,studentId);
            response.sendRedirect("/edit.section?id=" + sectionId);
        }else if(action.equals("/user.delete")){
            int userId = Integer.parseInt(request.getParameter("id"));
            UsersDAO.getInstance().deleteUser(userId);
            response.sendRedirect("/users.page");
        }else if(action.equals("/section.student.delete")){
            int studentId = Integer.parseInt(request.getParameter("id"));
            int sectionId = Integer.parseInt(request.getParameter("sec"));
            SectionStudentsDAO.getInstance().deletStudentFromSection(studentId,sectionId);
            response.sendRedirect("/edit.section?id=" + sectionId);
        }else if(action.equals("/teacher.sections.page")){
            int teacherId = ((User)session.getAttribute("user")).getId();
            ArrayList<Section> sections = SectionsDAO.getInstance().getTeacherSections(teacherId);
            request.setAttribute("sections_list",sections);
            request.getRequestDispatcher("TeacherSections.jsp").forward(request,response);
        }else if(action.equals("/section.students")){
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            ArrayList<User> students = SectionStudentsDAO.getInstance().getTeacherStudents(sectionId);
            request.setAttribute("students_list",students);
            request.getRequestDispatcher("TeacherStudents.jsp").forward(request,response);
        }else if(action.equals("/editgrade")){
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int grade = Integer.parseInt(request.getParameter("grade"));
            System.out.println(sectionId + " " + studentId + " " + grade);
            SectionStudentsDAO.getInstance().editGrade(sectionId,studentId,grade);
        }else if(action.equals("/Logout")){
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }
}
