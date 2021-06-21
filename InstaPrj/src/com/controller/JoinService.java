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

      String user_id = request.getParameter("user_id");
      String pw = request.getParameter("user_pw");
      String insta_id = request.getParameter("insta_id");
   
      MemberDTO dto = new MemberDTO(user_id, pw, insta_id);
      MemberDAO dao = new MemberDAO();
      
      int cnt = dao.join(dto);
      
      if(cnt>0){
         System.out.println("회원가입 성공");
         response.sendRedirect("main?insta_id="+insta_id+".jsp");
      }else{
         System.out.println("회원가입실패");
         response.sendRedirect("main.jsp");
         
      }
      
      
//      response.sendRedirect("http://localhost:9000/joinservice/crawling?insta_id='abcdef");
      
   }

}