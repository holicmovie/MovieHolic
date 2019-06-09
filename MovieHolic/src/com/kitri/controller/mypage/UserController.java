package com.kitri.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import com.kitri.dto.*;
import com.kitri.service.mypage.UserService;

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
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		String path = "/page/mypage/mypage.jsp";
		
		request.setAttribute("writereview", list);
		
		return path;
		
	}
	
	public void ReviewList(HttpServletRequest request, HttpServletResponse response) {
		
		List<BoardDto> list = UserService.getUserService().reviewlist("movieName");
		
		request.setAttribute("reviewList", list);
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
	public void ReviewComment(HttpServletRequest request, HttpServletResponse response) {
		String seq = request.getParameter("seq");
		List<CommentDto> list = UserService.getUserService().findByCo(seq);
		request.setAttribute("reviewcomment", list);
	}
	public void settingUser(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		UserDto list = UserService.getUserService().selectById(page);
		request.setAttribute("setting", list);
	}
}
