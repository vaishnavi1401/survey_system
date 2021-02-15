package com.projectsem5;
import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

public class Logout extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String collegeid;
		
		HttpSession session = req.getSession();
		collegeid = req.getParameter("id");
		System.out.println(collegeid);
		
		PrintWriter out = resp.getWriter();
		
		if((collegeid.length() != 0)) {
			try {
				Connection conn;
				Statement stmt = null;
				ResultSet res = null;
				String sql;
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
				if(conn != null) {
					System.out.println("Connection Successful !");
					stmt = conn.createStatement();
					sql = "SELECT * FROM users WHERE collegeid='"+collegeid+"'";
					res = stmt.executeQuery(sql);
					while(res.next()) {
						String type = res.getString(3);
						if(type.compareTo("Admin") != 0) {
							session.removeAttribute("collegeid");
							session.removeAttribute("name");
							System.out.println("Admin Logout Successful");
						}
						else {
							session.removeAttribute("collegeid");
							session.removeAttribute("name");
							session.removeAttribute("course");
							session.removeAttribute("branch");
							session.removeAttribute("semester");
							System.out.println("User Logout Successful");
						}
					}
				}
				res.close();
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

}
