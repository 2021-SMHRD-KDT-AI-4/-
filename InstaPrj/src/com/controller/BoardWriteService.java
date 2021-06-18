package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
 
/**
 * Servlet implementation class BoardWriteService
 */
@WebServlet("/BoardWriteService")
public class BoardWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		int maxSize = 5*500*500;
		
		String encoding = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
//		String writer = multi.getParameter("writer");
		String filename = URLEncoder.encode(multi.getFilesystemName("filename"), "EUC-KR");
		String content = multi.getParameter("content");
		String writer = "test2";
		System.out.println("title : " + title);
		System.out.println("writer : " + writer);
		System.out.println("filename : " + filename);
		System.out.println("content : " + content);
		
		BoardDTO dto =  new BoardDTO(title, writer, filename, content);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.upload(dto);
		
		if(cnt > 0) {
			System.out.println("게시물작성성공");
			response.sendRedirect("BoardList.jsp");
		}else {
			System.out.println("게시물작성실패");
			response.sendRedirect("WriteBoard");
		}
		
	}

}
