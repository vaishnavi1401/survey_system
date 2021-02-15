package com.projectsem5;

import java.io.*;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Vote extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String qid, studentid, vote;
		String r;
		
		qid = req.getParameter("id");
		studentid = req.getParameter("studentid");
		vote = req.getParameter("vote");
		PrintWriter out=resp.getWriter();
		
		try {
			Connection conn;
			Statement stmt = null;
			ResultSet res;
			String sql, question = "";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				sql = "SELECT * FROM questions where qid='"+qid+"'";
				res = stmt.executeQuery(sql);
				if(!res.next()) {
					System.out.println("Could Not Fetch Questions");
				}
				else {
					System.out.println("Questions Fetched");
					 do {
						if(vote.compareTo("yes")==0) {
							r=res.getString("yes");
							insert(qid,"yes",r,studentid);
						}
						else if(vote.compareTo("no")==0) {
							r=res.getString("no");
							insert(qid,"no",r,studentid);
						}
						
					}
					while(res.next());
				}
			}
			stmt.close();
			conn.close();

			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
	}
	
	
	public void insert(String q,String col,String val, String studentid)
	{
		int v = Integer.parseInt(val);
		v = v + 1;
		try {
		Connection conn;
		Statement stmt = null;
		int res;
		String sql, question = "";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
		if(conn != null) {
			System.out.println("Connection Successful !");
			stmt = conn.createStatement();
			sql = "UPDATE questions set "+col+"='"+v+"' where qid='"+q+"'";
			System.out.println(sql);
			res = stmt.executeUpdate(sql);
			sql = "INSERT INTO `voted_questions`( `qid`, `question`, `category`, `course`, `branch`, `semester`, `date`) SELECT `qid`, `question`, `category`, `course`, `branch`, `semester`, `date` FROM questions WHERE qid='"+q+"';";
			res = stmt.executeUpdate(sql);
			if(col.compareTo("yes") == 0) {
				sql = "UPDATE voted_questions SET collegeid='"+studentid+"', vote='yes' WHERE qid='"+q+"';";
				res = stmt.executeUpdate(sql);
			}
			else {
				sql = "UPDATE voted_questions SET collegeid='"+studentid+"', vote='no' WHERE qid='"+q+"';";
				res = stmt.executeUpdate(sql);
			}
			
		}
		stmt.close();
		conn.close();

		}
		catch(SQLException s)
		{
			s.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}

}
