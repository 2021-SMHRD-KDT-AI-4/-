package com.model;

public class MemberDTO {

   
   private String USER_ID;
   private String USER_PW ;
   private String INSTA_ID ;
   
   public MemberDTO(String iNSTA_ID) {
      INSTA_ID = iNSTA_ID;
   }
   
   public MemberDTO(String uSER_ID, String uSER_PW) {
      USER_ID = uSER_ID;
      USER_PW = uSER_PW;
   }
   
   public MemberDTO(String uSER_ID, String uSER_PW, String iNSTA_ID) {
      USER_ID = uSER_ID;
      USER_PW = uSER_PW;
      INSTA_ID = iNSTA_ID;
   }


   public String getUSER_ID() {
      return USER_ID;
   }


   public void setUSER_ID(String uSER_ID) {
      USER_ID = uSER_ID;
   }


   public String getUSER_PW() {
      return USER_PW;
   }


   public void setUSER_PW(String uSER_PW) {
      USER_PW = uSER_PW;
   }


   public String getINSTA_ID() {
      return INSTA_ID;
   }


   public void setINSTA_ID(String iNSTA_ID) {
      INSTA_ID = iNSTA_ID;
   }
}
