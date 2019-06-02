package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.dto.AdminPageDto;
import com.kitri.admin.service.AdminService;

public class AdminController {

	private static AdminController adminController; // 2번째 전역변수 만들기

	static {
		adminController = new AdminController(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminController() {
	} // 1번째 외부에서 생성 못하게 만듬.

	public static AdminController getAdminController() { // 4번째 getter 만들기.

		return adminController;
	}

	public String selectByUserList(HttpServletRequest request, HttpServletResponse response, int cnt) {

		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");

		int currentPage = 1; // 보여줄 현재 페이지.
		
		System.out.println("cp = " + cp);
		
		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}
		
		int cntPerPage = 5; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().getTotalCnt(cnt);

		int cntPerPageGroup = 5;
		String url = "/MovieHolic/admin";

		AdminPageDto ap = new AdminPageDto(cntPerPage, totalCnt, cntPerPageGroup, url, currentPage);

		//System.out.println(ap.getStartRow() + "   end : " + ap.getEndRow());

		List<AdminDto> list = AdminService.getAdminService().findByRows(ap.getStartRow(), ap.getEndRow(), cnt);

		ap.setList(list);
		request.setAttribute("ap", ap);

		String path = "/page/admin/management.jsp";
		
		if (cnt == 1) {
			path = "/page/admin/mgAlllist.jsp";
		} else if (cnt == 2) {
			path = "/page/admin/mgInactiveList.jsp";
		} else if (cnt == 3) {
			path = "/page/admin/mgUnsubscribelist.jsp";
		}

		return path;
		
	}
	
	
	
}
