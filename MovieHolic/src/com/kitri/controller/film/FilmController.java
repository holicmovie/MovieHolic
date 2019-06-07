package com.kitri.controller.film;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.FilmDto;
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
		
		// 장르별 영화 목록 get
		List<FilmDto> list = FilmService.getFilmService().getFilmList(category);
		// 장르별 영화 목록 set
		request.setAttribute("filmlist", list);
		
		return path;
	}

	
	// 5
	// 검색된 영화 목록 get
	public String getSearchedFilmList(HttpServletRequest request, HttpServletResponse response) {
			
		String path = "/page/film/result/searchfilmresult.jsp";
			
		String srchKey = request.getParameter("srchKey"); // 검색어

		// 검색 결과 목록 get
		List<FilmDto> list = FilmService.getFilmService().getSearchedFilmList(srchKey);
		// 검색 결과 목록 set
		request.setAttribute("searchedFilmList", list);
			
		return path;
	}
	
	
	
	
	// ------------------------------------------------------- [ moviedetail.jsp ] -------------------------------------------------------
	
}
