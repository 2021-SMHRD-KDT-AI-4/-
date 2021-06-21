package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/IdCheckService")
public class IdCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String user_id = request.getParameter("join_id");
	      
	      MemberDAO dao = new MemberDAO();
	      
	      boolean check = dao.idCheck(user_id);
	      
	      PrintWriter out = response.getWriter();
	      if (check==true) {
	    	  out.println("<script>alert('있는아이디임다!');history.go(-1);</script>");
	      }else {
	    	  out.println("<script>alert('없는아이디임다!');history.go(-1);</script>");
	      }
	      out.print(check);
	   
	   }
	}


