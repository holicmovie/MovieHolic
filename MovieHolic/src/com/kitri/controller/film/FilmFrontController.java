package com.kitri.controller.film;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.MoveUrl;

// FC
// ① C 호출
// ② forward

@WebServlet("/film")
public class FilmFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// [doGet]
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String act = request.getParameter("act"); 	// *파라미터 변수
		String path = "/index.jsp"; 			  			// *기본 경로

		// *act에 따른 경로 이동
		// 1
		// Home 눌릴때 || localhost/MovieHolic/film 링크 검색 시(첫 화면)
		if ("showBox".equals(act)||act==null) {
			// 메인 페이지 띄우기
			// 경로 get 				 		  		   	(C -> FC)
			// request(setted 박스오피스) get    (C -> FC)
			path = FilmController.getUserController().getBoxOffice(request, response);
			
			// 경로로 go (FC -> V)
			MoveUrl.forward(request, response, path);
		}
		// 2
		// 
		else if ("".equals(act)) {
			
		}

	} //doGet end

	
	// [doPost]
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	} //doPost end

}
