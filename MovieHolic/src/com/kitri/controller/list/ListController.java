package com.kitri.controller.list;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.dto.BoardDto;
import com.kitri.dto.CommentDto;
import com.kitri.dto.FilmDetailDto;
import com.kitri.dto.FilmDto;
import com.kitri.dto.UserDto;
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
		
//		2. BoardDto에 담아서 service로 전달하고 result 받음
		result = ListService.getListService().saveList(board);

		return result;
	}
	
	
	
//	#### 리스트 상세 페이지 ####
	public String listDetail(HttpServletRequest request, HttpServletResponse response) {
		String path = "/error.jsp";
		String seq = request.getParameter("seq");
		
//		1. 리스트  내용 가져오고, 조회수 올리기	(0번은 리스트, 이후 댓글)
		BoardDto board = ListService.getListService().selBoardBySeq(seq);
		if(board != null) {
			
//			2. 댓글 내용 가져오기
			List<CommentDto> comment = ListService.getListService().selCommentBySeq(seq);
			if(comment != null) {
			
//				3. 유저 프로필사진 가져오기	(0번은 리스트 유저, 이후 댓글 유저)
				List<UserDto> user = ListService.getListService().selProfileById(board, comment);
				if(user != null) {
					
//					4. 영화 이미지 가져오기
					List<FilmDto> film = ListService.getListService().getMvImg(board);
					
					path = "/page/list/listdetail.jsp";
					request.setAttribute("board", board);
					request.setAttribute("comment", comment);
					request.setAttribute("user", user);
					request.setAttribute("film", film);
				} // if문 종료
			} // if문 종료
		} // if문 종료

		return path;
	}
	
	
	
//	#### 리스트 가져오기(수정 페이지) ####
	public String selListBySeq(HttpServletRequest request, HttpServletResponse response) {
		String path = "/error.jsp";
		String seq = request.getParameter("seq");
		BoardDto board = ListService.getListService().selListBySeq(seq);
		
		if(board != null) {
			List<FilmDto> film = ListService.getListService().getMvImg(board);
			
			if(film != null) {
				request.setAttribute("film", film);
				request.setAttribute("board", board);
				path = "/page/list/modifylist.jsp";
			}
		}
		
		return path;
	}
	
	
	public int modifyList(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		BoardDto board = new BoardDto();
		
//		1. request에서 ID, 글제목, 글내용, 선택한 영화정보 받아옴
		board.setUserId(request.getSession().getAttribute("userID").toString());
		board.setSubject(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setSeq(Integer.parseInt(request.getParameter("seq")));
		board.setPostDate(request.getParameter("postDate"));
		
		// param으로 전달된 영화 정보를 String[]로 받음
		List<String> name = new ArrayList<String>(Arrays.asList(request.getParameterValues("movieNm")));
		List<String> young = new ArrayList<String>(Arrays.asList(request.getParameterValues("movieCdYoung")));
		List<String> naver = new ArrayList<String>(Arrays.asList(request.getParameterValues("movieCdNaver")));
		
		// 각 list를 dto의 해당 필드에 set
		board.setMovieName(name);
		board.setMovieCodeYoung(young);
		board.setMovieCodeNaver(naver);
		
//		2. BoardDto에 담아서 service로 전달하고 result 받음
		result = ListService.getListService().modifyList(board);
		
		return result;
	}
	
	
	
//	#### list 삭제 ####
	public int deleteList(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		String seq = request.getParameter("seq");
		String postDate = request.getParameter("postDate");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userID");
		result = ListService.getListService().deleteList(seq, postDate, cnt, id);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
