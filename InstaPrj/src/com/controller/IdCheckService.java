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
		String USER_ID = request.getParameter("email");
	      
	      MemberDAO dao = new MemberDAO();
	      boolean check = dao.idCheck(USER_ID);
	      
	      PrintWriter out = response.getWriter();
	      
	      out.print(check);
	   
	   }
	}


