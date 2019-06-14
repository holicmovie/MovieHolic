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
	
	
//	#### 제목으로 영화 검색 ####
	public String navSrchMVbyName(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. request에서 검색어 받아옴
		String title = request.getParameter("srchKey").trim();
		String path = "/page/searchresult.jsp";
		
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
		board.setUserId(request.getSession().getAttribute("loginInfo").toString());
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
			List<CommentDto> comment = ListService.getListService().selCommentBySeq(seq, true);
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
		
		
		// DB에서 select해서 BoardDto로 받아옴
		List<BoardDto> boardList = ListService.getListService().selListBySeq(seq, null, null);
		BoardDto board = boardList.get(0);
		
		
		if(board != null) {
			// 영화 이미지 가져오기
			List<FilmDto> film = ListService.getListService().getMvImg(board);
			
			if(film != null) {
				// 이미지 정보와 리스트 정보를 각각 받아와야 하기에 controller에서 처리함
				request.setAttribute("film", film);
				request.setAttribute("board", board);
				path = "/page/list/modifylist.jsp";
			}
		}
		
		return path;
	}
	
//	#### 리스트 수정 ####
	public int modifyList(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		BoardDto board = new BoardDto();
		
//		1. request에서 ID, 글제목, 글내용, 선택한 영화정보 받아옴
		board.setUserId(request.getSession().getAttribute("loginInfo").toString());
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
		String id = (String) session.getAttribute("loginInfo");
		result = ListService.getListService().deleteList(seq, postDate, cnt, id);
		
		return result;
	}
	
	
//	#### list 좋아요&싫어요 update ####
	public int evaluate(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;	// 화면에 뿌릴 좋아요&싫어요 수
		String btnStr = request.getParameter("btnStr");
		String seq = request.getParameter("seq");
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString();
		
		result = ListService.getListService().evaluate(btnStr, seq, id);
		
		return result;
	}
	
	
//	#### list 신고 ####
	public int notify(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String seq = request.getParameter("seq");
		result = ListService.getListService().notify(seq);
		return result;
	}
	
	
//	#### 댓글 저장 & log update ####
	public int saveComment(HttpServletRequest request, HttpServletResponse response) {
		String content = request.getParameter("content");
		String seq = request.getParameter("seq");
		String subject = request.getParameter("subject");
		String writerId = request.getParameter("writerId");
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString();
		
		return ListService.getListService().saveComment(id, seq, content, subject, writerId);
	}
	
	
	
//	#### 댓글만 조회 ####
	public String selComment(HttpServletRequest request, HttpServletResponse response) {
		String path = "/error.jsp";
		String seq = request.getParameter("seq");
		
//		1. 댓글 내용 가져오기
		List<CommentDto> comment = ListService.getListService().selCommentBySeq(seq, false);
		
		if(comment != null) {
		
//			2. 유저 프로필사진 가져오기	(0번은 리스트 유저, 이후 댓글 유저)
			
			
			List<UserDto> user = ListService.getListService().selProfileById(null, comment);
			if(user != null) {
				path = "/page/list/result/commentResult.jsp";
				request.setAttribute("comment", comment);
				request.setAttribute("user", user);
			} // if문 종료
		} // if문 종료

		return path;
	}
	
	
	
//	#### 댓글 삭제 ####
	public int delComment(HttpServletRequest request, HttpServletResponse response) {
		String postDate = request.getParameter("postDate");
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString(); 
		
		return ListService.getListService().delComment(id, postDate);
	}
	
	
//	#### 댓글 수정 ####
	public String modCommment(HttpServletRequest request, HttpServletResponse response) {
		String postDate = request.getParameter("postDate");
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString(); 
		return ListService.getListService().modCommment(id, postDate);
	}
	
	
//	#### 댓글 수정 완료 ####
	public int updateComment(HttpServletRequest request, HttpServletResponse response) {
		String content = request.getParameter("content");
		String postDate = request.getParameter("postDate");
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString();
		
		return ListService.getListService().updateComment(content, postDate, id);
	}
	
	
	
//	#### list 최신순 정렬 ####
	public String sortLatest(HttpServletRequest request, HttpServletResponse response) {
		String path = "/error.jsp";
		List<List<FilmDto>> flList = null;
		
		// DB에서 select해서 BoardDto로 받아옴
		List<BoardDto> boardList = ListService.getListService().selListBySeq(null, "*", null);
		
		if(boardList != null) {
			flList = new ArrayList<List<FilmDto>>();
			int len = boardList.size();
			for(int i=0; i<len; i++) {	// 리스트 개수만큼 반복
				// 영화 이미지 가져오기
				BoardDto board = boardList.get(i);	// i번째 리스트
				int cnt = board.getMovieCodeNaver().size();	// i번째 리스트의 영화목록이 4개가 넘는경우, 이미지는 4개만 가져옴
				if(cnt > 4) {
					cnt = 4;
				}
				List<FilmDto> filmList = ListService.getListService().getMvImg(board, cnt);	//i번째 리스트에 포함된 영화목록의 각 이미지
				
				flList.add(filmList);
			}
			if(flList != null) {
				// 이미지 정보와 리스트 정보를 각각 받아와야 하기에 controller에서 처리함
				request.setAttribute("flList", flList);
				request.setAttribute("boardList", boardList);
				path = "/page/list/result/sortLatestResult.jsp";
			}
		}
		
		return path;
	}
	
	
//	#### list 인기순 정렬 ####	
	public String sortPopular(HttpServletRequest request, HttpServletResponse response) {
		String path = "/error.jsp";
		List<List<FilmDto>> flList = null;
		
		// DB에서 select해서 BoardDto로 받아옴
		List<BoardDto> boardList = ListService.getListService().selListBySeq(null, "**", null);
		
		if(boardList != null) {
			flList = new ArrayList<List<FilmDto>>();
			int len = boardList.size();
			for(int i=0; i<len; i++) {	// 리스트 개수만큼 반복
				// 영화 이미지 가져오기
				BoardDto board = boardList.get(i);	//i번째 리스트
				List<FilmDto> filmList = ListService.getListService().getMvImg(board, 1);	//i번째 리스트에 포함된 영화목록의 각 이미지
				
				flList.add(filmList);
			}
			if(flList != null) {
				// 이미지 정보와 리스트 정보를 각각 받아와야 하기에 controller에서 처리함
				request.setAttribute("flListP", flList);
				request.setAttribute("boardListP", boardList);
				path = "/page/list/movielist.jsp";
			}
		}
		
		return path;
	}
	
	
//	#### 리스트 검색 ####
	public String srchList(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		String srchList = request.getParameter("srchStr");
		List<List<FilmDto>> flList = null;
		
		// DB에서 select해서 BoardDto로 받아옴
		List<BoardDto> boardList = ListService.getListService().selListBySeq(null, "***", srchList);
		
		if(boardList != null) {
			flList = new ArrayList<List<FilmDto>>();
			int len = boardList.size();
			for(int i=0; i<len; i++) {	// 리스트 개수만큼 반복
				// 영화 이미지 가져오기
				BoardDto board = boardList.get(i);	// i번째 리스트
				int cnt = board.getMovieCodeNaver().size();	// i번째 리스트의 영화목록이 4개가 넘는경우, 이미지는 4개만 가져옴
				if(cnt > 4) {
					cnt = 4;
				}
				List<FilmDto> filmList = ListService.getListService().getMvImg(board, cnt);	//i번째 리스트에 포함된 영화목록의 각 이미지
				
				flList.add(filmList);
			}
			if(flList != null) {
				// 이미지 정보와 리스트 정보를 각각 받아와야 하기에 controller에서 처리함
				request.setAttribute("flList", flList);
				request.setAttribute("boardList", boardList);
				path = "/page/list/result/sortLatestResult.jsp";
			}
		}
		
		return path;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
