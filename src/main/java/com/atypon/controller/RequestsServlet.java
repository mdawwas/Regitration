package com.atypon.controller;

import com.atypon.model.CoursesDAO;
import com.atypon.model.SectionsDAO;
import com.atypon.model.UsersDAO;
import com.atypon.utility.Course;
import com.atypon.utility.Section;
import com.atypon.utility.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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
        if(action.equals("/login.do")){
            User user = UsersDAO.getInstance().doLogin(request.getParameter("username"),request.getParameter("password"));
            HttpSession session = request.getSession();
            if(user!=null){
                session.setAttribute("user",user);
                RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                rd.forward(request,response);
            }else{
                request.setAttribute("error","Error !");
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
        }
    }
}
