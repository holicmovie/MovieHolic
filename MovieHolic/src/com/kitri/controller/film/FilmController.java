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
	// 1
	// 박스오피스 get
	public String getBoxOffice(HttpServletRequest request, HttpServletResponse response) {
		
		String path = "/index.jsp";
		
		// 박스오피스 목록 get  (S -> C)
		List<FilmDto> list = FilmService.getFilmService().getBoxOffice();
		
		// 박스오피스 set 		(C -> FC)
		request.setAttribute("box", list);
		
		// 경로 return 		(C -> FC)
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

}
