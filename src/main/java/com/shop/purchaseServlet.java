package com.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class purchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public purchaseServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession s = request.getSession(true);
		try {
			String cname = request.getParameter("cname");
			String i_no = request.getParameter("Ino");
			String mobileno = request.getParameter("mobno");
			String date=request.getParameter("datepicker1");
			Connection conn = jdbc.db();
			PreparedStatement pst = conn.prepareStatement("insert into purchace(cname,Ino,mobno,Date) values(?,?,?,?)");
			pst.setString(1, cname);
			pst.setString(2, i_no);
			pst.setString(3, mobileno);
			pst.setString(4, date);
			s.setAttribute("cname",cname);
			
		            int rs = pst.executeUpdate();
			
			if (rs > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
				rd.forward(request, response);
			} else {
				pw.println("Username or password error");
				RequestDispatcher rd = request.getRequestDispatcher("Purchase.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("Something went wrong !! Please try again");
			System.out.println(e);
		}
		}

	private String dateFormat(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}

