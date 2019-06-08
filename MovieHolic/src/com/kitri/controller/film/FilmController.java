package com.kitri.controller.film;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.FilmDto;
import com.kitri.dto.film.PageBean;
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
		
		System.out.println("현재 페이지 게시글 수 = " + totalCnt);
		String url = "film";  // ??? 뭐지

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
						
		String url = "film";  // ??? 뭐지

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
	
}
