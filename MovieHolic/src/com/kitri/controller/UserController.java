package com.kitri.controller;

import javax.servlet.http.*;

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
		return null;
		
	}
}
