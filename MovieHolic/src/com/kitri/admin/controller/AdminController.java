package com.kitri.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.service.AdminService;

public class AdminController {
	
	private static AdminController adminController; // 2번째 전역변수 만들기
	
	static {
		adminController = new AdminController(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminController() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminController getAdminController() { // 4번째 getter 만들기.
		
		return adminController;
	}
	
	
	
	
	
	public String selectByUserAll(HttpServletRequest request, HttpServletResponse response){
		
		List<AdminDto> list = new ArrayList<>();
		
		list = AdminService.getAdminService().selectByUserAll();
		
		
		// request로 주소값을 가짐 거기다가 setting해줌.
		request.setAttribute("AdminDto", list);
		
		
		String path = "/page/admin/managementAlllist.jsp"; //서버딴에서 움직이면 앞에 / =Webcontent 클라이언트에서 / =Movieholic부터.
		
		return path;
	}
	

	


}
