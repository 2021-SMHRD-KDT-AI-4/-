package com.model;

public class MemberDTO {

   
   private String user_id;
   private String user_pw ;
   private String insta_id ;
   
   public MemberDTO(String iNSTA_ID) {
      insta_id = iNSTA_ID;
   }
   
   public MemberDTO(String uSER_ID, String uSER_PW) {
      user_id = uSER_ID;
      user_pw = uSER_PW;
   }
   
   public MemberDTO(String uSER_ID, String uSER_PW, String iNSTA_ID) {
      user_id = uSER_ID;
      user_pw = uSER_PW;
      insta_id = iNSTA_ID;
   }


   public String getUSER_ID() {
      return user_id;
   }


   public void setUSER_ID(String uSER_ID) {
      user_id = uSER_ID;
   }


   public String getUSER_PW() {
      return user_pw;
   }


   public void setUSER_PW(String uSER_PW) {
      user_pw = uSER_PW;
   }


   public String getINSTA_ID() {
      return insta_id;
   }


   public void setINSTA_ID(String iNSTA_ID) {
      insta_id = iNSTA_ID;
   }
}
