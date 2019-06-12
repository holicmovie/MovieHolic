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

		System.out.println("FilmFrontConteroller : 서블릿 들어옴");
		
		String act = request.getParameter("act"); 			// [ 파라미터 변수 ]
		String path = "/index.jsp"; 			  					// [ 기본 경로 ]

		// [ act에 따른 경로 이동 ]
		
		// #1
		// Home 눌릴때 || localhost/MovieHolic/film 링크 검색 시(첫 화면)
		if (act == null) {
			System.out.println("FilmFrontConteroller : act=null");
			
			// 경로 get 				 		  		   	(C -> FC)
			// request(setted 박스오피스 & 추천영화목록) get  (C -> FC)
			path = FilmController.getUserController().getBoxOffice(request, response);	// attr1    : box
			FilmController.getUserController().getFavoriteFilm(request, response);		// attr2, 3 : favoritefilm, favoritefilm2 (로그인)
			FilmController.getUserController().getVariousFilm(request, response);		// attr4, 5 : variousfilm, variousfilm2   (비로그인)
			
			
			MoveUrl.forward(request, response, path);
		}
		// #2
		// 주간 인기 영화 목록 출력
		else if("viewbestfilmlist".equals(act)) {
			System.out.println("FilmFrontConteroller : act=viewbestfilmlist");

			// 경로 get 				 		  						(C -> FC)
			// request(setted 주간 인기 영화목록) get    	(C -> FC)
			path = FilmController.getUserController().getWeekBestFilmList(request, response); // attr : bestfilmlist
			
			MoveUrl.forward(request, response, path);
		}
		// #3
		// 영화 목록 출력
		else if ("viewfilmlist".equals(act)) {
			System.out.println("FilmFrontConteroller : act=viewfilmlist");
	
			// 경로 get 				 		  					(C -> FC)
			// request(setted 장르별 영화목록) get    	(C -> FC)
			path = FilmController.getUserController().getFilmList(request, response);	// attr : filmlist
			
			MoveUrl.forward(request, response, path);
		}
		// #4
		// 영화 검색
		else if ("searchfilm".equals(act)) {
			System.out.println("FilmFrontConteroller : act=searchfilm");
			
			// 경로 get 				 		  					(C -> FC)
			// request(setted 검색된 영화목록) get    	(C -> FC)
			path = FilmController.getUserController().getSearchedFilmList(request, response); // attr : searchedFilmList
			
			MoveUrl.forward(request, response, path);
		} 
		// #5
		// 영화 상세정보 조회
		else if ("viewfilmdetail".equals(act)) {
			System.out.println("FilmFrontConteroller : act=viewfilmdetail");
			
			// 경로 get 				 		  					(C -> FC)
			// request(setted 선택된 영화 상세정보, 리뷰들) get    	(C -> FC)
			path = FilmController.getUserController().getFilmInfo(request, response); // attr : filmInfo, reviews
						
			MoveUrl.forward(request, response, path);
		} 
		// #6
		// 리뷰 페이지 클릭
		else if ("viewreviewlist".equals(act)) {
			System.out.println("FilmFrontConteroller : act=viewreviewlist");
			
			// 경로 get
			// request(setted 선택된 페이지의 리뷰 목록) get
			path = FilmController.getUserController().getReviewList(request, response); // attr : pagedreviews
			
			MoveUrl.forward(request, response, path);
		}
		// #7
		// 위시리스트 추가
		else if ("addwishlist".equals(act)) {
			System.out.println("FilmFrontConteroller : act=addwishlist");
			
			// 경로 get
			// request(setted 위시리스트 추가 여부) get	(C -> FC)
			path = FilmController.getUserController().addWishList(request, response); // attr : isWished
			
			MoveUrl.forward(request, response, path);
			
		}
		// else if end

		
		
	} //doGet end

	
	// [doPost]
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	} //doPost end

} // class end
