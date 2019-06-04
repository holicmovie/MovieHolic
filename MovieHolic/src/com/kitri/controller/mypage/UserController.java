package com.kitri.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import com.kitri.dto.BoardDto;
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
		
		request.setAttribute("review", list);
		
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
}
