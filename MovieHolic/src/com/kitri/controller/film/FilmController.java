package com.kitri.controller.film;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.*;
import com.kitri.dto.film.PageBean;
import com.kitri.dto.film.PageBeanReview;
import com.kitri.service.film.FilmService;

// C
// ① request.setAttribute

public class FilmController {
	
	// [싱글톤 패턴 객체]
	private static FilmController filmController;
	static {
		filmController = new FilmController();
	}
	private FilmController() {}
	public static FilmController getUserController() {
		return filmController;
	}
	
	
	// [메소드]
	
	// ------------------------------------------------------- [ index.jsp ] -------------------------------------------------------
	
	// 1
	// 박스오피스 get
	public String getBoxOffice(HttpServletRequest request, HttpServletResponse response) {
				
		String path = "/index.jsp";
		
		// 박스오피스 목록 get  (S -> C)
		List<FilmDto> list = FilmService.getFilmService().getBoxOffice();
		
		// 박스오피스 set 		(C -> FC)
		request.setAttribute("box", list);
		
		return path;
	}
	
	
	// 2
	// 선호 장르 영화 목록 get
	public void getFavoriteFilm(HttpServletRequest request, HttpServletResponse response) {
		
		// 선호 장르 영화 목록 get
		List<FilmDto> list = FilmService.getFilmService().getFavoriteFilm("액션");
		
		// 선호 장르 영화 목록 set
		request.setAttribute("favoritefilm", list);
		
	}
	
	
	
	
	// ------------------------------------------------------- [ moviefilm.jsp ] -------------------------------------------------------
	
	// 3
	// 주간 인기 영화 목록 get
	public String getWeekBestFilmList(HttpServletRequest request, HttpServletResponse response) {
		
		String path = "/page/film/result/bestfilmlistresult.jsp";
		
		// 주간 인기 영화 목록 get
		List<FilmDto> list = FilmService.getFilmService().getWeekBestFilmList();
		// 주간 인기 영화 목록 set
		request.setAttribute("bestfilmlist", list);
		
		return path;
				
	}
	
	// 4
	// 장르별 영화 목록 get
	public String getFilmList(HttpServletRequest request, HttpServletResponse response) {

		String path = "/page/film/result/filmlistresult.jsp";
		String category = request.getParameter("category"); // 선택된 장르 메뉴
		
		// #1 페이징 처리
		String cp = request.getParameter("currentPage1");
		int currentPage = 1;  // 기본은 1페이지
				
		if(cp != null) {
			currentPage = Integer.parseInt(cp); // 페이지 눌린 값있다면, 해당 페이지
		}
				
		int cntPerPage = 20;  										 			// 페이지 별 보여줄 목록 수
		int totalCnt = FilmService.getFilmService().getTotalPage(category); 	// 총 게시글 수
		int cntPerPageGroup = 5;                					 			// 그룹 페이지 수
		
		String url = "film";

		PageBean pb = new PageBean(currentPage,
									cntPerPage,
									cntPerPageGroup,
									totalCnt,
									url);

		// 장르별 영화 목록 get
		List<FilmDto> list = FilmService.getFilmService().getFilmList(category, pb.getStartRow(), pb.getEndRow());
				
		// 페이지에 맞는 장르별 영화 목록 set
		pb.setList(list);
		request.setAttribute("filmlist", pb);
		request.setAttribute("cate", category);
					
		return path;
	}

	
	// 5
	// 검색된 영화 목록 get
	public String getSearchedFilmList(HttpServletRequest request, HttpServletResponse response) {
			
		String path = "/page/film/result/searchfilmresult.jsp";
			
		String srchKey = request.getParameter("srchKey"); // 검색어

		// #1 페이징 처리
		String cp = request.getParameter("currentPage2");
		int currentPage = 1;  // 기본은 1페이지
						
		if(cp != null) {
			currentPage = Integer.parseInt(cp); // 페이지 눌린 값있다면, 해당 페이지
		}
						
		int cntPerPage = 20;  										 				// 페이지 별 보여줄 목록 수
		int totalCnt = FilmService.getFilmService().getSearchTotalPage(srchKey); 	// 총 게시글 수
		int cntPerPageGroup = 5;                					 				// 그룹 페이지 수
						
		String url = "film";

		PageBean pb = new PageBean(currentPage,
									cntPerPage,
									cntPerPageGroup,
									totalCnt,
									url);
		
		// 검색 결과 목록 get
		List<FilmDto> list = FilmService.getFilmService().getSearchedFilmList(srchKey, pb.getStartRow(), pb.getEndRow());
		// 페이지에 맞는 검색 결과 목록 set
		pb.setList(list);
		request.setAttribute("searchedFilmList", pb);
		request.setAttribute("srchKey", srchKey);
			
		return path;
	}
	
	
		
	// ------------------------------------------------------- [ moviedetail.jsp ] -------------------------------------------------------
	
	
	// 6
	// 선택된 영화 상세정보 get
	public String getFilmInfo(HttpServletRequest request, HttpServletResponse response) {

		String path = "/page/film/moviedetail.jsp";
		String movieCdYoung = request.getParameter("movieCdYoung");
		String movieCdNaver = request.getParameter("movieCdNaver");
		
		System.out.println("C : 상세페이지 볼 영화 코드(영진원) : " + movieCdYoung);
		System.out.println("C : 상세페이지 볼 영화 코드(네이버) : " + movieCdNaver);
		
		// 영화 상세정보 get		(S -> C)
		FilmDetailDto list = FilmService.getFilmService().getFilmInfo(movieCdYoung, movieCdNaver);
		int starPoint = FilmService.getFilmService().getStarPoint(movieCdYoung);
		
		list.setStarPoint(starPoint);
		
		// #1 페이징 처리
		String cp = request.getParameter("currentPage");
		int currentPage = 1;  // 기본은 1페이지
								
		if(cp != null) {
			currentPage = Integer.parseInt(cp); // 페이지 눌린 값있다면, 해당 페이지
		}
								
		int cntPerPage = 5;  										 					// 페이지 별 보여줄 목록 수
		int totalCnt = FilmService.getFilmService().getReviewTotalPage(movieCdYoung); 	// 총 게시글 수
		int cntPerPageGroup = 5;                					 					// 그룹 페이지 수
								
		String url = "film";  // ??? 뭐지

		PageBeanReview pb = new PageBeanReview(currentPage,
											cntPerPage,
											cntPerPageGroup,
											totalCnt,
											url);
				
		// 영화 리뷰 get (S -> C)
		List<BoardDto> reviews = FilmService.getFilmService().getReviews(movieCdYoung, pb.getStartRow(), pb.getEndRow());

		// 페이지에 맞는 리뷰 목록 set
		pb.setList(reviews);
		request.setAttribute("reviews", pb);
		
		// 영화 상세정보 set			(C -> FC)
		request.setAttribute("filmInfo", list);
		
		// 영화 영진원 코드, 네이버 코드 set (C -> FC)
		request.setAttribute("movieCdYoung", movieCdYoung);
		request.setAttribute("movieCdNaver", movieCdNaver);
	
		return path;
		
	}
	
	// 7
	// 선택된 페이지의 리뷰 get
	
	public String getReviewList(HttpServletRequest request, HttpServletResponse response) {

		String path = "/page/film/result/reviewresult.jsp";
		String movieCdYoung = request.getParameter("movieCdYoung");
		
		System.out.println("C : 눌린 페이지의 상세페이지 볼 영화 코드(영진원) : " + movieCdYoung);
		
		// #1 페이징 처리
		String cp = request.getParameter("currentPage");
		
		int currentPage = 1;  // 기본은 1페이지
		
		if(cp != null) {
			currentPage = Integer.parseInt(cp); // 페이지 눌린 값있다면, 해당 페이지
		}
								
		int cntPerPage = 5;  										 					// 페이지 별 보여줄 목록 수
		int totalCnt = FilmService.getFilmService().getReviewTotalPage(movieCdYoung); 	// 총 게시글 수
		int cntPerPageGroup = 5;                					 					// 그룹 페이지 수
								
		String url = "film";  // ??? 뭐지

		PageBeanReview pb = new PageBeanReview(currentPage,
											cntPerPage,
											cntPerPageGroup,
											totalCnt,
											url);
				
		// 영화 리뷰 get (S -> C)
		List<BoardDto> reviews = FilmService.getFilmService().getReviews(movieCdYoung, pb.getStartRow(), pb.getEndRow());

		// 페이지에 맞는 리뷰 목록 set
		pb.setList(reviews);
		request.setAttribute("reviews", pb);
		
		// 영화 영진원 코드, 네이버 코드 set (C -> FC)
		request.setAttribute("movieCdYoung", movieCdYoung);
		
		return path;
	}
	
	// 8
	// 위시리스트 추가
	public String addWishList(HttpServletRequest request, HttpServletResponse response) {

		String path = "/page/film/result/addwishlistresult.jsp";
		String isWished = "이미 위시리스트에 추가된 영화입니다.";

		String movieCdYoung = request.getParameter("movieCdYoung");
		String movieCdNaver = request.getParameter("movieCdNaver");
			
		// 세션에서 id 얻기로 바꾸기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		String id = "a125@gmail.com";
			
		// 위시리스트 추가 여부 확인
		int isWishedBefore = FilmService.getFilmService().isWished(movieCdYoung, id);
		if(isWishedBefore == 0) {
			// 등록 완료
			FilmService.getFilmService().insertWishList(movieCdYoung, movieCdNaver, id);
			isWished = "위시리스트에 등록되었습니다.";
		}
			
		// 위시리스트 추가 완료 여부 set (C -> FC)
		request.setAttribute("isWished", isWished);
			
		return path;
	}
	
}
