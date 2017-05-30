package com.atypon.controller;

import com.atypon.model.UsersDAO;
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
            HttpSession session = request.getSession(false);
            if(user!=null){
                session.setAttribute("user",user);
                RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                rd.forward(request,response);
            }else{
                request.setAttribute("error","Error !");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }

        }else if(action.equals("/users.page")){
            ArrayList<User> users = UsersDAO.getInstance().getUsers();
            HttpSession session = request.getSession();
            session.setAttribute("users_list",users);
            RequestDispatcher rd = request.getRequestDispatcher("users.jsp");
            rd.forward(request,response);
        }
    }
}