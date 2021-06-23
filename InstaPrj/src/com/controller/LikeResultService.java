package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.LikeDAO;
import com.model.LikeDTO;
import com.model.MemberDTO;

/**
 * Servlet implementation class LikeResultService
 */
@WebServlet("/LikeResultService")
public class LikeResultService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String insta_id = info.getINSTA_ID();
		LikeDAO dao = new LikeDAO();
		ArrayList<LikeDTO> pred_view = dao.pred_like_view(insta_id);
		
	}

}
