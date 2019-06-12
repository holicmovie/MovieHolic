package com.kitri.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.user.dto.UsersDto;
import com.kitri.user.service.UsersService;

public class UsersController {
	
	private static UsersController usersController;
	
	static {
		usersController = new UsersController();
	}

	private UsersController() {}
	
	public static UsersController getUsersController() {
		return usersController;
	}
	
	
	
	
	
	
	
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
	    String pass = request.getParameter("pass");
	    int i = 0;
	    
	    UsersDto usersDto = UsersService.getUsersService().login(userid, pass);
	    
	    HttpSession session = request.getSession();
	    session.removeAttribute("loginInfo");
	    
		if (usersDto.getPass().equals(pass)) { // 아이디 검사 안하는 이유는 dto 넣을때 그 아이디로 넣어줬기 때문
			System.out.println("성공");
			session.setAttribute("loginInfo", userid);
		}else {
			System.out.println("실패");
		}
	    
	    
		String path = "/page/admin/management.jsp";
		
		return path;
		
	}
	
	
	
	
	
	
	
	

}

















