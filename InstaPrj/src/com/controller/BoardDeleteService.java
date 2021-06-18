package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;

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
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		System.out.println(num);
		System.out.println(writer);
		BoardDTO dto = new BoardDTO(num, writer);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.delete(dto);
		
		if (cnt > 0) {
			System.out.println("게시글삭제완료");
			response.sendRedirect("BoardList.jsp");
		}else {
			System.out.println("게시글삭제실패");
		}
	}

}
