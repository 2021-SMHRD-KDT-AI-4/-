package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.LikeDAO;
import com.model.LikeDTO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class likeService
 */
@WebServlet("/likeService")
public class likeService extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String savePath = request.getServletContext().getRealPath("lijeimg");
		System.out.println(savePath);
		
		// 파일 크기 15MB로 제한
		int maxSize = 1024*1024*15;
		  
		String encoding = "EUC-KR";
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String pred_insta_id = info.getINSTA_ID();
		String file_name = URLEncoder.encode(multi.getFilesystemName("file_name"), "EUC-KR");
		String upload_day = multi.getParameter("upload_day");
		String upload_time = multi.getParameter("upload_time");
		String hashtag = multi.getParameter("hashtag");
		String account_tag_ =  multi.getParameter("account_tag");
		if (account_tag_==null) {
			account_tag_="0";
		}
		int account_tag = Integer.parseInt(account_tag_);
		String place_tag_ = request.getParameter("place_tag");
		if ( place_tag_ == null) {
			place_tag_ = "0";
		}
		int place_tag =Integer.parseInt(place_tag_);
		
		System.err.println("insta_id : "+ pred_insta_id);
		System.out.println("filename : " + file_name);
		System.out.println("upload_day : " + upload_day);
		System.out.println("upload_time : " + upload_time);
		System.out.println("hashtag : " + hashtag);
		System.out.println("account_tag : " + account_tag);  
		System.out.println("place_tag : " + place_tag);  
		
		LikeDTO dto = new LikeDTO(pred_insta_id, upload_day, upload_time, hashtag, file_name, account_tag, place_tag);
		LikeDAO dao = new LikeDAO();
		int cnt = dao.upload(dto);
		
		if(cnt > 0) {
			System.out.println("좋아요예측누름");
			response.sendRedirect("likeResult.html");
		}else {
			System.out.println("좋아요예측실패");
			response.sendRedirect("main.jsp");
		}
		
	}
	
	
}
