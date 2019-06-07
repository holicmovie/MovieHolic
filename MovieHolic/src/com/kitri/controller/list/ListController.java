package com.kitri.controller.list;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	
	
//	#### 영화명으로 영화 검색 ####
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
	public String saveList(HttpServletRequest request, HttpServletResponse response) {
		
		String result = "";
		
		// 1. request에서 글제목, 글내용, 선택한 영화정보 받아옴
		String listTitle = request.getParameter("title");
		String listContent = request.getParameter("content");
		String[] movieNmArr = request.getParameterValues("movieNm");
		
		int len = movieNmArr.length;
		for(int i=0; i<len; i++)
			System.out.println(movieNmArr[i]);

		return result;
	}
	
	
	
}
