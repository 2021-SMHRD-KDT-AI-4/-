package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ResultDAO {

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

	public ArrayList<ResultDTO> view(String insta_id){
		ArrayList<ResultDTO> list = new ArrayList<ResultDTO>();
		getConnection();
		try {
			String sql = "select * from (select A.FILE_NAME, A.UPLOAD_DAY, A.UPLOAD_TIME, A.ACCOUNT_TAG, A.PLACE_TAG, B.REC_HASHTAG, B.RESULT_LIKE from PRED_LIKE A, RESULT_TB B where A.PRED_LIKE_NUM = B.RESULT_NUM and A.PRED_INSTA_ID = ? order by A.PRED_LIKE_NUM desc) where ROWNUM <= 6";

				    	
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, insta_id);
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			String upload_day = rs.getString("UPLOAD_DAY");
			String upload_time = rs.getString("UPLOAD_TIME");
			String rec_hash_tag = rs.getString("REC_HASHTAG");
			String file_name = rs.getString("FILE_NAME");
			int account_tag = rs.getInt("ACCOUNT_TAG");
			int place_tag = rs.getInt("RESULT_LIKE");
			int result_like = rs.getInt("RESULT_LIKE");
			ResultDTO dto = new ResultDTO(upload_day, upload_time, rec_hash_tag, file_name, account_tag, place_tag, result_like);
			
			list.add(dto);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}	
		
		
		return list;
	}
}
