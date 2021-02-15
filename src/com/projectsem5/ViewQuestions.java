package com.projectsem5;
import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

public class ViewQuestions extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
		PrintWriter out = resp.getWriter();
		String studentid, course = "", branch = "", semester = "";
		studentid = req.getParameter("id");
		System.out.println(studentid);
		
		try {
			Connection conn;
			Statement stmt = null;
			ResultSet res,res1;
			String sql, question = "";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				sql = "SELECT * FROM users WHERE collegeid='"+studentid+"';";
				res = stmt.executeQuery(sql);
				while(res.next()) {
					course = res.getString("course");
					branch = res.getString("branch");
					semester = res.getString("semester");
					System.out.println(course + " " + branch + " " + semester);
				}
				sql = "SELECT * FROM questions WHERE (course='"+course+"' OR course='All') AND (branch='"+branch+"' OR branch='All') AND (semester='"+semester+"' OR semester='All');";
				res = stmt.executeQuery(sql);
				if(!res.next()) {
					System.out.println("Could Not Fetch Questions");
				}
				else {
					System.out.println("Questions Fetched");
					 do {
						 if(checkVoted(res.getString("qid"), studentid).compareTo("false") == 0) {
							 question = question + res.getString("qid") + "-" + res.getString("question") + "|";
						 } 
						
					}
					while(res.next());
					 if(question.length() != 0) {
						 question = question.substring(0, question.length()-1);
					 }
					 else {
						 question = "";
					 }
					out.write(question);
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
	
	public String checkVoted(String qid, String id) {
		String value = null;
		try {
			Connection conn;
			Statement stmt = null;
			ResultSet res;
			String sql;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				sql = "SELECT * FROM voted_questions WHERE collegeid='"+id+"' AND qid='"+qid+"';";
				res = stmt.executeQuery(sql);
				if(!res.next()) {
					System.out.println("Could Not Fetch Questions");
					value = "false";
				}
				else {
					System.out.println("Questions Fetched");
					value = "true";
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
		return value;
	}

}
