package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String email = request.getParameter("email");
      String pw = request.getParameter("pw");
      String SNSIns = request.getParameter("SNSIns");
   
      MemberDTO dto = new MemberDTO(email, pw, SNSIns);
      MemberDAO dao = new MemberDAO();
      
      int cnt = dao.join(dto);
      
      if(cnt>0){
         response.sendRedirect("Main.jsp");
         System.out.println("회원가입 성공");
      }else{
         response.sendRedirect("Join.jsp");
         System.out.println("가입실패!!!!!!!");
         // 가입 실패했을 때
      }
            
   }

}