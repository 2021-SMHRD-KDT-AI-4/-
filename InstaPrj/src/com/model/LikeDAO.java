package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	int cnt = 0;
	
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

	public int upload(LikeDTO dto) {
		getConnection();
		String sql = "insert into PRED_LIKE values(PRED_LIKE_NUM_SEQ.nextval,?,?,?,?,?,?,?,SYSDATE)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(2, dto.getPred_insta_id());
			psmt.setString(3, dto.getUpload_day());
			psmt.setString(4, dto.getUpload_time());
			psmt.setString(5, dto.getHashtag());
			psmt.setString(6, dto.getFile_name());
			psmt.setInt(7, dto.getAccount_tag());
			psmt.setInt(8, dto.getPlace_tag());
			psmt.setString(9, dto.getPred_date());
			
			cnt = psmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;		

	}
	
	
	
	


}