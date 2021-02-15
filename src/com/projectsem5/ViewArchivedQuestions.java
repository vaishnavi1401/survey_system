package com.projectsem5;
import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

public class ViewArchivedQuestions extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
		PrintWriter out = resp.getWriter();
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
				sql = "SELECT * FROM archived_questions";
				res = stmt.executeQuery(sql);
				if(!res.next()) {
					System.out.println("Could Not Fetch Questions");
				}
				else {
					System.out.println("Questions Fetched");
					 do {
						//question = question + res.getString("qid") + "-" + res.getString("question") + "|";
						 JSONObject obj = new JSONObject();
						 obj.put("qid", res.getString("qid"));
						 obj.put("question", res.getString("question"));
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
					//question = question.substring(0, question.length()-1);
					
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
