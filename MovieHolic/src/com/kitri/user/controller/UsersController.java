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
	
	
	
	
	
	
	
	public int login(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
	    String pass = request.getParameter("pass");
	    int result = 0;
	    
	    UsersDto usersDto = UsersService.getUsersService().login(userid);
	    
	    HttpSession session = request.getSession();
	    session.removeAttribute("loginInfo");
	    session.removeAttribute("name");
	    
		if (usersDto.getPass().equals(pass)) { // 아이디 검사 안하는 이유는 dto 넣을때 그 아이디로 넣어줬기 때문
			//System.out.println("성공");
			result = 1;
			session.setAttribute("loginInfo", userid);
			session.setAttribute("name", usersDto.getName() );
		}else {
			//System.out.println("실패");
			result = -1;
		}
	    
		return result;
		
	}
	
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginInfo");
	    session.removeAttribute("name");
		String path = "/film";
		
		return path;
		
	}

	
	
	
	
	
	

}

















