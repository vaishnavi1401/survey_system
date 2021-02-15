package com.projectsem5;
import java.io.*;
import java.sql.*;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

public class Question extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//String question[] = new String[10];
		String question,category,course,branch,semester;
		LocalDate date;
		PrintWriter out = resp.getWriter();
		
		question = req.getParameter("question");
		category = req.getParameter("category");
		course = req.getParameter("course");
		branch = req.getParameter("branch");
		semester = req.getParameter("semester");
		date = java.time.LocalDate.now();
		out.println(question);
		out.println(date);
		
		try {
			Connection conn;
			Statement stmt = null;
			int res;
			String sql;
			
			String qid = "Ques";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				
				int i = (int)(Math.random()*9000)+1000;
				String digit = String.valueOf(i);
				qid = qid + digit;
				sql = "INSERT INTO questions(qid,question,category,course,branch,semester,date) values('"+qid+"','"+question+"','"+category+"','"+course+"','"+branch+"','"+semester+"','"+date+"')";
				res = stmt.executeUpdate(sql);
				if(res == 0) {
					System.out.println("Could Not Post Questions");
					resp.sendRedirect("admin_profile.jsp?Error=ErrorPostingQuestion");
				}
				else {
					System.out.println("Question Posted");
					resp.sendRedirect("admin_profile.jsp?Success=QuestionPostedSuccessfully");
				}
			}
			stmt.close();
			conn.close();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException s) {
			s.printStackTrace();
		}
		
	}

}
