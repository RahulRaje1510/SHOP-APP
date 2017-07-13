package com.shop;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession s = request.getSession(true);
		
		try{
			String username = request.getParameter("uname");  
	        String password = request.getParameter("pass");
	        Connection conn=jdbc.db();   
	        PreparedStatement pst = (PreparedStatement) conn.prepareStatement("Select * from login where uname='"+username+"' and pass='"+password+"'");
	        /*  pst.setString(1, username);
	        pst.setString(2, password);
	        s.setAttribute("uname", username);*/
	        ResultSet rs = pst.executeQuery();   
        
        if(rs.next()) {          
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			rd.forward(request, response);
		}else{
			pw.println("Username or password error");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
            
   }
   catch(Exception e){       
       System.out.println("Something went wrong !! Please try again");
       System.out.println(e);
   }
	}

}
