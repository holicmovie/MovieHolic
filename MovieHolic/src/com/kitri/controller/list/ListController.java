package com.kitri.controller.list;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.BoardDto;
import com.kitri.dto.FilmDetailDto;
import com.kitri.dto.FilmDto;
import com.kitri.service.list.ListService;

public class ListController {

//	#### singleTone ####
	private static ListController listController;
	static {
		listController = new ListController();
	}
	private ListController() {}
	public static ListController getListController() {
		return listController;
	}
	
	
	
//	#### 제목으로 영화 검색 ####
	public String srchMVbyName(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. request에서 검색어 받아옴
		String title = request.getParameter("srchTitle").trim();
		String path = "/page/list/result/srchMVResult.jsp";
		
		// 2. service에서 검색 결과를 MovieDto타입의 List로 받아옴
		List<FilmDetailDto> list = ListService.getListService().srchMVbyName(title);
		if(list != null) {
			request.setAttribute("list", list);
		}
		
		return path;
	}
	
	
//	#### 작성한 List DB에 insert #### 
	public int saveList(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		BoardDto board = new BoardDto();
		
//		1. request에서 ID, 글제목, 글내용, 선택한 영화정보 받아옴
		board.setUserId(request.getSession().getAttribute("userID").toString());
		board.setSubject(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		// param으로 전달된 영화 정보를 String[]로 받음
		List<String> name = new ArrayList<String>(Arrays.asList(request.getParameterValues("movieNm")));
		List<String> young = new ArrayList<String>(Arrays.asList(request.getParameterValues("movieCdYoung")));
		List<String> naver = new ArrayList<String>(Arrays.asList(request.getParameterValues("movieCdNaver")));
		
		// 각 list를 dto의 해당 필드에 set
		board.setMovieName(name);
		board.setMovieCodeYoung(young);
		board.setMovieCodeNaver(naver);
		
		System.out.println(name.get(0));
		System.out.println(name.get(1));
		
//		2. BoardDto에 담아서 service로 전달하고 result 받음
		result = ListService.getListService().saveList(board);

		return result;
	}
	
	
}
