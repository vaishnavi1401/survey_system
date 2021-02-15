package com.projectsem5;
import java.io.*;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditQuestion extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String param, qid;
		PrintWriter out = resp.getWriter();
		param = req.getParameter("request");
		qid = req.getParameter("qid");
		
		if(param.compareTo("view") == 0) {
			String question;
			question = viewquestion(qid);
			out.println(question);
		}
		else if(param.compareTo("edit") == 0) {
			String ques = req.getParameter("question");
			editquestion(qid, ques);
		}
		else {
			out.println("Invalid Request");
		}
	}
	
	//function to view question
	public String viewquestion(String id) {
		String question = "";
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
				sql = "SELECT * FROM questions WHERE qid='"+id+"'";
				res = stmt.executeQuery(sql);
				if(!res.next()) {
					System.out.println("Could Not Fetch Question");
				}
				else {
					System.out.println("Question Fetched");
					do {
						question = res.getString("question");
					}
					while(res.next());
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
		return question;
	}
	
	//function to edit question
	public void editquestion(String id, String question) {
		try {
			Connection conn;
			Statement stmt = null;
			int res;
			String sql;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				sql = "UPDATE questions SET question='"+question+"' WHERE qid='"+id+"'";
				res = stmt.executeUpdate(sql);
				if(res == 0) {
					System.out.println("Could Not Update Question");
				}
				else {
					System.out.println("Question Updated");
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
