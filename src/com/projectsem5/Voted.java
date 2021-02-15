package com.projectsem5;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class Voted extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String id;
		
		id = req.getParameter("id");
		PrintWriter out=resp.getWriter();
		JSONObject jobj = new JSONObject();
		
		try {
			Connection conn;
			Statement stmt = null;
			ResultSet res;
			String sql;
			int i = 0;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsem5","root","");
			if(conn != null) {
				System.out.println("Connection Successful !");
				stmt = conn.createStatement();
				sql = "SELECT * FROM voted_questions WHERE collegeid='"+id+"';";
				res = stmt.executeQuery(sql);
				if(!res.next()) {
					System.out.println("Could Not Fetch Questions");
					jobj.put("-1", "");
					out.println(jobj);
				}
				else {
					System.out.println("Questions Fetched");
					 do {
						 JSONObject obj = new JSONObject();
						 obj.put("qid", res.getString("qid"));
						 obj.put("question", res.getString("question"));
						 obj.put("vote", res.getString("vote"));
						 obj.put("category", res.getString("category"));
						 obj.put("course", res.getString("course"));
						 obj.put("branch", res.getString("branch"));
						 obj.put("semester", res.getString("semester"));
						 obj.put("date", res.getString("date"));
						 String key = Integer.toString(i);
						 jobj.put(key, obj);
						 i++;
					 }
					while(res.next());
					 out.println(jobj);
					
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
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
