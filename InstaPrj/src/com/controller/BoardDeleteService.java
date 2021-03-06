package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.MemberDTO;

/**
 * Servlet implementation class BoardDeleteService
 */
@WebServlet("/BoardDeleteService")
public class BoardDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String writer = "test2";
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = (String)info.getUSER_ID();
		System.out.println(writer);
		System.out.println(num);
		System.out.println(writer);
		BoardDTO dto = new BoardDTO(num, writer);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.delete(dto);
		
		if (cnt > 0) {
			System.out.println("게시글삭제완료");
			response.sendRedirect("forumList.jsp");
		}else {
			System.out.println("게시글삭제실패");
			response.sendRedirect("forumList.jsp");
		}
	}

}
