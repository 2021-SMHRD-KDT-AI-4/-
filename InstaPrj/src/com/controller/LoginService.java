package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
       
	  PrintWriter out = response.getWriter();
	   
      String USER_ID  = request.getParameter("email");
      String USER_PW  = request.getParameter("pw");
   
      MemberDTO dto = new MemberDTO(USER_ID, USER_PW );
      MemberDAO dao = new MemberDAO();
      
      MemberDTO info = dao.login(dto);

      if(info!=null) {
         HttpSession session = request.getSession();
         
         session.setAttribute("info", info);
         System.out.println("로그인 성공");

            
      } else {
         System.out.println("");
         out.println("<script>alert('로그인 실패하셨습니다.');history.go(-1);</script>"); 
         out.close();
         
      }    
      response.sendRedirect("Main.jsp");
      
 
   }

}