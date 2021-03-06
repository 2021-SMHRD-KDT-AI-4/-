package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			psmt.setString(1, dto.getPred_insta_id());
			psmt.setString(2, dto.getUpload_day());
			psmt.setString(3, dto.getUpload_time());
			psmt.setString(4, dto.getHashtag());
			psmt.setString(5, dto.getFile_name());
			psmt.setInt(6, dto.getAccount_tag());
			psmt.setInt(7, dto.getPlace_tag());
			
			cnt = psmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;		

	}

	public ArrayList<LikeDTO> pred_like_view(String insta_id) {
		ArrayList<LikeDTO> pred_view = new ArrayList<LikeDTO>();
		
		getConnection();
		
		try {
			String sql = "select PRED_LIKE_NUM from PRED_LIKE WHERE PRED_INSTA_ID =?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,insta_id );
			
			while(rs.next()) {
				int pred_like_num = rs.getInt("PRED_LIKE_NUM");
				String pred_insta_id = rs.getString("PRED_INSTA_ID");
				String upload_day = rs.getString("UPLOAD_DAY");
				String upload_time = rs.getString("UPLOAD_TIME");
				String hashtag = rs.getString("HASH_TAG");
				String file_name = rs.getString("FILE_NAME");
				int pred_date = rs.getInt("PRED_DATE");
				int account_tag = rs.getInt("ACCOUNT_TAG");
				int place_tag = rs.getInt("PLACE_TAG");
				
				LikeDTO dto = new LikeDTO(pred_like_num, pred_insta_id, upload_day, upload_time, hashtag, file_name, account_tag, place_tag, pred_date);
				pred_view.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return pred_view;
	}
	
	
	
	


}
