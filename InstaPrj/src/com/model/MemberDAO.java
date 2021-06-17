package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO{
   
   private Connection conn;
   private PreparedStatement psmt;
   private ResultSet rs;
   
private void conn() {
      
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
         if(rs!=null){
            rs.close();
         }
         if(psmt!=null){
            psmt.close();
         }
         if(conn!=null){
            conn.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   
   public int join(MemberDTO dto) {
      
      int cnt = 0;

      conn();
      
      try {
         
         String sql = "insert into USER_TB values(?,?,?)";
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getUSER_ID());
         psmt.setString(2, dto.getUSER_PW());
         psmt.setString(3, dto.getINSTA_ID());
         
         cnt = psmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      
      return cnt;
   }
   

      
   public MemberDTO login(MemberDTO dto) {
      MemberDTO info = null;
      
      conn();
      
      try {
         
         String sql = "select * from USER_TB where USER_ID=? and USER_PW=?";
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, dto.getUSER_ID());
         psmt.setString(2, dto.getUSER_PW());
         
         
         rs = psmt.executeQuery();
         
         if(rs.next()) {
            String USER_ID = rs.getString(1);
            String USER_PW = rs.getString(2);
            String INSTA_ID = rs.getString(3);
            info = new MemberDTO(INSTA_ID);
         }
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         close();
      }
      
      return info;
   }
}


