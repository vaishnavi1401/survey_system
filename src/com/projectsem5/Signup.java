package com.projectsem5;
import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

public class Signup extends HttpServlet { 
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name, collegeid,course, branch, semester, password, type;
		name = req.getParameter("username");
		collegeid = req.getParameter("email");
		course = req.getParameter("course");
		branch = req.getParameter("branch");
		semester = req.getParameter("semester");
		password = req.getParameter("password");
		
		type = "Student";
		
		PrintWriter out = resp.getWriter();
		
		try {
			Connection conn;
			Statement stmt = null;
			ResultSet r = null;
			int res;
			String sql;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				
				sql = "SELECT * FROM users WHERE collegeid='"+collegeid+"'";
				r = stmt.executeQuery(sql);
				if(r.next()) {
					System.out.println("User Exists");
					resp.sendRedirect("index.html?Error=UserExists");
				}
				else {
					sql = "INSERT INTO users(name,type,collegeid,course,branch,semester,password) values('"+name+"','"+type+"','"+collegeid+"','"+course+"','"+branch+"','"+semester+"','"+password+"')";
					res = stmt.executeUpdate(sql);
					if(res == 0) {
						System.out.println("Could Not Create User");
					}
					else {
						System.out.println("User Created");
						resp.sendRedirect("index.html?Success=UserCreated");
					}
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
