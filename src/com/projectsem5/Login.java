package com.projectsem5;
import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

public class Login extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String collegeid, password;
		
		HttpSession session = req.getSession();
		collegeid = req.getParameter("collegeid");
		password = req.getParameter("password");
		
		PrintWriter out = resp.getWriter();
		
		if((collegeid.length() != 0) && (password.length() != 0)) {
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
						String pass = res.getString(8);
						if(pass.compareTo(password) != 0) {
							System.out.println(res.getString(8));
							System.out.println("Wrong Password");
							resp.sendRedirect("/MiniProject/index.html?Error=WrongPassword");
						}
						else {
							System.out.println("Login Successfull");
							String type = res.getString(3);
							//If user is admin redirect to admin dashboard else user dashboard
							if(type.compareTo("Admin") == 0) {
								session.setAttribute("collegeid", res.getString("collegeid"));
								session.setAttribute("name", res.getString("name"));
								resp.sendRedirect("/MiniProject/admin_profile.jsp");
							}
							else {
								session.setAttribute("name", res.getString("name"));
								session.setAttribute("collegeid", res.getString("collegeid"));
								session.setAttribute("course", res.getString("course"));
								session.setAttribute("branch", res.getString("branch"));
								session.setAttribute("semester", res.getString("semester"));
								resp.sendRedirect("/MiniProject/user_profile.jsp");
							}
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
