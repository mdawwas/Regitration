package com.atypon.controller.Filter;

import com.atypon.utility.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by mdawwas on 5/31/17.
 */
public class URLFilter implements Filter {
    ArrayList <ArrayList<String> > allowedActions;
    PrintWriter file;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        try {
            file = new PrintWriter(new File("LogFile.txt"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        allowedActions = new ArrayList<>();
        for(int i = 0 ; i < 3 ; ++i ) {
            allowedActions.add(new ArrayList<String>());
            allowedActions.get(i).add("/home.page");
            allowedActions.get(i).add("/Logout");
        }
        allowedActions.get(0).add("/users.page");
        allowedActions.get(0).add("/courses.page");
        allowedActions.get(0).add("/add_user.page");
        allowedActions.get(0).add("/users.add");
        allowedActions.get(0).add("/add_course.page");
        allowedActions.get(0).add("/courses.add");
        allowedActions.get(0).add("/sections.page");
        allowedActions.get(0).add("/add_section.page");
        allowedActions.get(0).add("/sections.add");
        allowedActions.get(0).add("/courses.delete");
        allowedActions.get(0).add("/sections.delete");
        allowedActions.get(0).add("/edit.section");
        allowedActions.get(0).add("/section.students.add");
        allowedActions.get(0).add("/user.delete");
        allowedActions.get(0).add("/section.student.delete");
        allowedActions.get(2).add("/mysections.page");

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        String action = request.getServletPath();
        User user = (User) session.getAttribute("user");
        String name = user == null ? "Guest" : user.getUserName();
        String time = new Date().toString();
        if(!action.equals("/login.do")) {
            file.println("at : " + time + " user " + name + " did action : " + action);
            file.flush();
        }
        if(user == null && !action.equals("/login.do")) {
            response.sendRedirect("/index.jsp");
        } else if(user == null){
            file.println("at : " + time + " user " + request.getParameter("username") + " did action : " + action);
            file.flush();
            filterChain.doFilter(servletRequest,servletResponse);
        } else {
            int userType = user.getType();
            if(allowedActions.get(userType).contains(action)){
                filterChain.doFilter(servletRequest,servletResponse);
            }else{
                response.sendRedirect("/home.page");
            }
        }

    }
}
