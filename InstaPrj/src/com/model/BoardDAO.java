package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BoardDAO {
	
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

	public int upload(BoardDTO dto) {
		getConnection();
		String sql = "insert into BOARD values(BOARD_NUM.nextval,?,?,?,?,SYSDATE)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getWriter());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getFilename());
			cnt = psmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	public ArrayList<BoardDTO> showBoard() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		getConnection();
		
		String sql = "SELECT * FROM BOARD ORDER BY BOARD_DATE DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("BOARD_NUM");
				String title = rs.getString("BOARD_TITLE");
				String writer = rs.getString("BOARD_USER_ID");
				String filename = rs.getString("BOARD_FILE_NAME");
				String content = rs.getString("BOARD_CONTENT");
				String day = rs.getString("BOARD_DATE");
				
				BoardDTO dto = new BoardDTO(num, title, writer, filename, content, day);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public BoardDTO showOne(int choiceNum) {
		BoardDTO dto = null;
		
		getConnection();
		
		String sql = "SELECT * FROM BOARD WHERE BOARD_NUM = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, choiceNum);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt("BOARD_NUM");
				String title = rs.getString("BOARD_TITLE");
				String writer = rs.getString("BOARD_USER_ID");
				String fileName = rs.getString("BOARD_FILE_NAME");
				String content = rs.getString("BOARD_CONTENT");
				String day = rs.getString("BOARD_DATE");
				
				dto = new BoardDTO(num, title, writer, fileName, content, day);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}

	public int delete(BoardDTO dto) {
		getConnection();
		String sql = "delete  from BOARD where BOARD_USER_ID =? and BOARD_NUM=? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getWriter());
			psmt.setInt(2, dto.getNum());
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
