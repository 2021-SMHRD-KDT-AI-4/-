package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UnfollowDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	int cnt = 0;
	String past_date = "";
	
	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	  public int insert(UnfollowDTO dto) {
		  
		  getConnection();
		      
		  String sql = "INSERT INTO PAST_F4F VALUES(?,?,SYSDATE)";
		  try {
			  List<String> list = dto.getPast_f4f_list();
			  for (int i = 0; i < list.size(); i++) {
				  psmt = conn.prepareStatement(sql);
				  psmt.setString(1, dto.getPast_user_id());
				  psmt.setString(2, list.get(i));	
				  cnt = psmt.executeUpdate();
			  }
			  
		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		      close();
		   }
		      
		   return cnt;
	}	
	  
	public List<String> select(String user_id){
		
		ArrayList<String> past_f4f_list = new ArrayList<String>();
		
		getConnection();
		
		String sql = "SELECT PAST_F4F_ID,PAST_DATE FROM PAST_F4F WHERE PAST_USER_ID = ?";
		try {
			

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String past_f4f_id = rs.getString("PAST_F4F_ID");
				past_date = rs.getString("PAST_DATE");
				past_f4f_list.add(past_f4f_id);
			}
			past_f4f_list.add(past_date);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return past_f4f_list;
		
	}
	
	
	public int delete(String user_id) {
		getConnection();
		String sql = "DELETE FROM PAST_F4F WHERE PAST_USER_ID=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	} 

	
	
}

