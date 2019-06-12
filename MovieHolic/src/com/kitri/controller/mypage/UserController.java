package com.kitri.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import com.kitri.dto.*;
import com.kitri.dto.mypage.PageBean;
import com.kitri.service.mypage.UserService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javafx.scene.control.Alert;

public class UserController {
	
	private static UserController userController;
	
	static {
		userController = new UserController();
	}
	
	private UserController(){
		
	}
	
	public static UserController getUserController() {
		return userController;
	}
	
	
	public String ReviewRegister(HttpServletRequest request , HttpServletResponse response) {
		List<String> name = new ArrayList<String>();
		String str = request.getParameter("moviename");
		StringTokenizer st = new StringTokenizer(str, "||");
		String a = st.nextToken();
		name.add(a);
		String path = "/page/mypage/writereview.jsp";
		BoardDto boardDto = new BoardDto();
		
		boardDto.setUserId(request.getParameter("userid"));
		boardDto.setSeq(Integer.parseInt(request.getParameter("seq")));
		boardDto.setBoardCode(Integer.parseInt(request.getParameter("boardcode")));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setPostDate(request.getParameter("postdate"));
		boardDto.setContent(request.getParameter("content"));
		boardDto.setStarPoint(Integer.parseInt(request.getParameter("starpoint")));
		boardDto.setMovieName(name);
		boardDto.setEnable(Integer.parseInt(request.getParameter("enable")));
		
		int cnt = UserService.getUserService().writeReview(boardDto);
		if(cnt != 0) {
			request.setAttribute("writereview", boardDto);
			path = "/page/mypage/diary.jsp";
		}else {
			path = "/page/mypage/writereview.jsp";
		}
		return path;
		
	}
	
	public String ReviewList(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;  					// 보여줄 현재 페이지
		String path = "/page/mypage/diary.jsp";
		String cp = request.getParameter("currentPage");
		if(cp != null) {
			currentPage = Integer.parseInt(cp);
		}
		String id = "a125@gmail.com";
		int cntPerPage = 5;  					// 페이지 별 보여줄 목록 수
		int totalCnt = UserService.getUserService().getTotalpage(id);  // 총 게시글 수
		int cntPerPageGroup = 5;                // 그룹 페이지 수
		
		String url = "diary";

		PageBean pb = new PageBean(currentPage,
								   cntPerPage,
								   cntPerPageGroup,
								   totalCnt,
								   url);
		
		List<BoardDto> list =UserService.getUserService().reviewlist(pb.getStartRow(), pb.getEndRow(), id);
		
		pb.setBoard(list);
		System.out.println(totalCnt);
		request.setAttribute("reviewList", pb);
		
		return path;
	}
	public String ReviewPage(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;  					// 보여줄 현재 페이지
		String path = "/page/mypage/result/diaryresult.jsp";
		String cp = request.getParameter("currentPage");
		if(cp != null) {
			currentPage = Integer.parseInt(cp);
		}
		String id = "a125@gmail.com";
		int cntPerPage = 5;  					// 페이지 별 보여줄 목록 수
		int totalCnt = UserService.getUserService().getTotalpage(id);  // 총 게시글 수
		int cntPerPageGroup = 5;                // 그룹 페이지 수
		
		String url = "mypage";

		PageBean pb = new PageBean(currentPage,
								   cntPerPage,
								   cntPerPageGroup,
								   totalCnt,
								   url);
		
		List<BoardDto> list =UserService.getUserService().reviewlist(pb.getStartRow(), pb.getEndRow(), id);
		System.out.println(list.size() + "페이지일때");
		pb.setBoard(list);
		System.out.println(totalCnt);
		request.setAttribute("reviewList2", pb);
		
		return path;
	}
	public String getSearchReview(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;  					// 보여줄 현재 페이지
		String path = "/page/mypage/result/searchreview.jsp";
		String cp = request.getParameter("currentPage");
		if(cp != null) {
			currentPage = Integer.parseInt(cp);
		}
		String id = "a125@gmail.com";
		String search = request.getParameter("searchReview");
		int cntPerPage = 5;  					// 페이지 별 보여줄 목록 수
		int totalCnt = UserService.getUserService().getSearchReview(search,id);  // 총 게시글 수
		int cntPerPageGroup = 5;                // 그룹 페이지 수
		
		String url = "mypage";

		PageBean pb = new PageBean(currentPage,
								   cntPerPage,
								   cntPerPageGroup,
								   totalCnt,
								   url);
		
		List<BoardDto> list =UserService.getUserService().selectSearchReview(pb.getStartRow(), pb.getEndRow(), id, search);
		System.out.println(list.size() + "페이지일때");
		pb.setBoard(list);
		System.out.println(totalCnt);
		System.out.println(search);
		request.setAttribute("reviewList3", pb);
		request.setAttribute("searchKey", search);
		
		return path;
	}
	public void listList(HttpServletRequest request, HttpServletResponse response) {
		List<BoardDto> list = UserService.getUserService().listList("content");
		request.setAttribute("listList", list);
	}
	public void ReviewDetail(HttpServletRequest request, HttpServletResponse response) {
		String seq = request.getParameter("seq");
		BoardDto result = UserService.getUserService().selectByNo(seq);
		request.setAttribute("reviewdetail", result);
	}
	public void deleteReview(HttpServletRequest request, HttpServletResponse response) {
		String userid = "a125@gmail.com";
		String reviewdelete[] = request.getParameterValues("reviewdelete");
		UserService.getUserService().deleteReview(userid, reviewdelete);
	}
	public void ReviewComment(HttpServletRequest request, HttpServletResponse response) {
		String seq = request.getParameter("seq");
		List<CommentDto> list = UserService.getUserService().findByCo(seq);
		request.setAttribute("reviewcomment", list);
	}
	public void settingUser(HttpServletRequest request, HttpServletResponse response){
		String page = request.getParameter("page");
		UserDto list = UserService.getUserService().selectById(page);
		
	
	
		request.setAttribute("setting", list);
	}
	public void settingProfile(HttpServletRequest request, HttpServletResponse response) {
		MultipartRequest mr;
		String saveDirectory = "F:\\javadata\\workspace\\web\\MovieHolic-myy\\MovieHolic\\WebContent\\images";
		int maxPostSize = 100*1024;
		String encoding="UTF-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		try {
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			String a = mr.getParameter("a");
			File f1 = mr.getFile("f1");
			System.out.println("a=" + a);
			System.out.println("fileName=" + f1.getName());
		} catch (IOException e) {
			e.printStackTrace();
		}
//		String path = "/uploadresult.jsp";
//		RequestDispatcher rd = request.getRequestDispatcher(path);
//		rd.forward(request, response);
	}
}
