package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.dto.AdminNotifyPageDto;
import com.kitri.admin.dto.AdminPageDto;
import com.kitri.admin.dto.NotifyDto;
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

	
	
	
	
	
	// 회원게시물 페이징처리
	public String selectByUserList(HttpServletRequest request, HttpServletResponse response, int cnt) {

		
		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");

		int currentPage = 1; // 보여줄 현재 페이지.

		// System.out.println("cp = " + cp);

		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}

		int cntPerPage = 7; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().getTotalCnt(cnt);

		int cntPerPageGroup = 5;
		String url = "/MovieHolic/admin";

		AdminPageDto ap = new AdminPageDto(cntPerPage, totalCnt, cntPerPageGroup, url, currentPage);

		// System.out.println(ap.getStartRow() + " end : " + ap.getEndRow());

		List<AdminDto> list = AdminService.getAdminService().findByRows(ap.getStartRow(), ap.getEndRow(), cnt);

		ap.setList(list);
		int num = 0;
		
		request.setAttribute("ap", ap);

		String path = "/page/admin/management.jsp";

		if (cnt == 1) {
			path = "/page/admin/mgAlllist.jsp";
		} else if (cnt == 2) {
			path = "/page/admin/mgInactiveList.jsp";
		} else if (cnt == 3) {
			num = 1;
			request.setAttribute("num", num);
			path = "/page/admin/mgUnsubscribelist.jsp";
		} else if (cnt == 4) {
			path = "/page/admin/management.jsp";
		}

		return path;

	}

	
	
//	------------------------------------------------------------------------------------------------------
	
	
	
	
	// 신고게시물 페이징처리
	public String NFselectByList(HttpServletRequest request, HttpServletResponse response) {

		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");

//		System.out.println("cp = " + cp);
		
		int currentPage = 1; // 보여줄 현재 페이지.

		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}

		int cntPerPage = 7; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().NFselectTotalCnt();

		int cntPerPageGroup = 5;
		String url = "/MovieHolic/admin";

		AdminNotifyPageDto np = new AdminNotifyPageDto(cntPerPage, totalCnt, cntPerPageGroup, url, currentPage);

//		System.out.println(np.getStartRow() + "   end : " + np.getEndRow());

		List<NotifyDto> list = AdminService.getAdminService().NFselectByRows(np.getStartRow(), np.getEndRow());

		np.setList(list);

		request.setAttribute("np", np);

		String path = "/page/admin/npAlllist.jsp";

		return path;

	}

	
	
//	------------------------------------------------------------------------------------------------------	
	
	
	
	
	// 처음 전체 항목 띄워줄때
	public String NFandAll(HttpServletRequest request, HttpServletResponse response, int cnt) {

		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");
		
//		----------------------------------------------------------------------------------------------------------------------
//		----------------------------------------------------------------------------------------------------------------------
		String cntN = request.getParameter("cnt");
		System.out.println(cntN);
		
		if (cntN != null) {
			cnt = Integer.parseInt(cntN);
		}
//		----------------------------------------------------------------------------------------------------------------------
//		----------------------------------------------------------------------------------------------------------------------		
		int currentPage = 1; // 보여줄 현재 페이지.

		int cntPerPage = 7; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().getTotalCnt(cnt);

		int cntPerPageGroup = 5;

//		String url = "/MovieHolic/admin"; // 한번만 보여주고 그안에서 돌아갈 것이라 필요없음

		AdminPageDto ap = new AdminPageDto(cntPerPage, totalCnt, cntPerPageGroup, currentPage);

		List<AdminDto> list = AdminService.getAdminService().findByRows(ap.getStartRow(), ap.getEndRow(), cnt);

		ap.setList(list);
		request.setAttribute("ap", ap);

//		----------------------------------------------------------------------------------------------------

		int totalCnt2 = AdminService.getAdminService().NFselectTotalCnt();

		AdminNotifyPageDto np = new AdminNotifyPageDto(cntPerPage, totalCnt2, cntPerPageGroup, currentPage);

		List<NotifyDto> list2 = AdminService.getAdminService().NFselectByRows(np.getStartRow(), np.getEndRow());

		np.setList(list2);

		request.setAttribute("np", np);

		//System.out.println(np.getList());

		String path = "/page/admin/management.jsp";

		return path;

	}
	
	
	
// ----------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	// 검색화면에서 휴면 눌렀을때 다시 페이징 처리하기 위해서 만듬
	public String searchPage(HttpServletRequest request, HttpServletResponse response) {

		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");

//		System.out.println("cp = " + cp);
						
		int currentPage = 1; // 보여줄 현재 페이지.

		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}

		int cntPerPage = 7; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().searchTotal(request,response);

		int cntPerPageGroup = 5;
		String url = "/MovieHolic/admin";

		AdminPageDto ap = new AdminPageDto(cntPerPage, totalCnt, cntPerPageGroup, url, currentPage);

//		System.out.println(np.getStartRow() + "   end : " + np.getEndRow());

		List<AdminDto> list = AdminService.getAdminService().search(request,response,ap.getStartRow(), ap.getEndRow());

		ap.setList(list);

		request.setAttribute("ap", ap);


//		----------------------------------------------------------------------------------------------------

		int totalCnt2 = AdminService.getAdminService().NFselectTotalCnt();

		AdminNotifyPageDto np = new AdminNotifyPageDto(cntPerPage, totalCnt2, cntPerPageGroup, currentPage);

		List<NotifyDto> list2 = AdminService.getAdminService().NFselectByRows(np.getStartRow(), np.getEndRow());

		np.setList(list2);

		request.setAttribute("np", np);

		//System.out.println(np.getList());

		String path = "/page/admin/searchpageresult.jsp";

		return path;

	}
	
	
	
	
	
	
	
	// 휴면페이지에서 휴면 눌렀을때 다시 페이징 처리하기 위해서 만듬
	public String inactivePage(HttpServletRequest request, HttpServletResponse response, int cnt) {

		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");
			
//		----------------------------------------------------------------------------------------------------------------------
//		----------------------------------------------------------------------------------------------------------------------
		/*
		 * String cntN = request.getParameter("cnt"); System.out.println(cntN);
		 * 
		 * if (cntN != null) { cnt = Integer.parseInt(cntN); }
		 */
//		----------------------------------------------------------------------------------------------------------------------
//		----------------------------------------------------------------------------------------------------------------------		
		int currentPage = 1; // 보여줄 현재 페이지.

		int cntPerPage = 7; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().getTotalCnt(cnt);

		int cntPerPageGroup = 5;

//		String url = "/MovieHolic/admin"; // 한번만 보여주고 그안에서 돌아갈 것이라 필요없음

		AdminPageDto ap = new AdminPageDto(cntPerPage, totalCnt, cntPerPageGroup, currentPage);

		List<AdminDto> list = AdminService.getAdminService().findByRows(ap.getStartRow(), ap.getEndRow(), cnt);

		ap.setList(list);
		request.setAttribute("ap", ap);

//		----------------------------------------------------------------------------------------------------

		int totalCnt2 = AdminService.getAdminService().NFselectTotalCnt();

		AdminNotifyPageDto np = new AdminNotifyPageDto(cntPerPage, totalCnt2, cntPerPageGroup, currentPage);

		List<NotifyDto> list2 = AdminService.getAdminService().NFselectByRows(np.getStartRow(), np.getEndRow());

		np.setList(list2);

		request.setAttribute("np", np);

		//System.out.println(np.getList());

		String path = "/page/admin/mgInactiveresult.jsp";

		return path;

	}
	
	
	
	
	
	
	
	
//	------------------------------------------------------------------------------------------------------	
	
	
	
	// 회원 탈퇴 갱신
	public String deletUser(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService.getAdminService().deletUser(request,response);
		String path = "/page/admin/management.jsp";
		
		return path;
	}

	
//	------------------------------------------------------------------------------------------------------		
	
	
	// 신고 게시물 삭제
	public String deleteBoard(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService.getAdminService().deleteComment(request, response);
		AdminService.getAdminService().deleteBoard(request, response);
		String path = "/page/admin/management.jsp";
		
		return path;
	}

	
	
	// 전체에서 휴면 설정 후 다시 전체화면 설정
	public String dormancy(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService.getAdminService().dormancy(request, response);
		String path = "/admin?act=alllist&notify=notify&cnt=1"; // cnt값 추가함 나중에 쓸모없으면 고치기.
		
		return path;
		
	}
	
	// 휴면화면에서 휴면설정 후 다시 휴면화면 설정
	public String dormancyinactive(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService.getAdminService().dormancy(request, response);
		String path = "/admin?act=inactive&notify=notify&cnt=2";
		
		return path;
		
	}
	
	
	// 검색화면에서 휴면설정 후 다시 휴면화면 설정
	public String dormancysearch(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService.getAdminService().dormancy(request, response);
		String path = "/admin?act=search&notify=notify"; // cnt값 추가함 나중에 쓸모없으면 고치기.
		
		return path;
		
	}
	
	
	

	
//	------------------------------------------------------------------------------------------------------		
	
	
	
	// 회원 게시물 검색 and 페이징처리
	public String search(HttpServletRequest request, HttpServletResponse response) {

		// 요청전달 데이터 없으면 1페이지
		String cp = request.getParameter("currentPage");

//		System.out.println("cp = " + cp);
				
		int currentPage = 1; // 보여줄 현재 페이지.

		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}

		int cntPerPage = 7; // 페이지별 보여줄 목록수

		int totalCnt = AdminService.getAdminService().searchTotal(request,response);

		int cntPerPageGroup = 5;
		String url = "/MovieHolic/admin";

		AdminPageDto ap = new AdminPageDto(cntPerPage, totalCnt, cntPerPageGroup, url, currentPage);

//		System.out.println(np.getStartRow() + "   end : " + np.getEndRow());

		List<AdminDto> list = AdminService.getAdminService().search(request,response,ap.getStartRow(), ap.getEndRow());

		ap.setList(list);

		request.setAttribute("ap", ap);

		String path = "/page/admin/searchresult.jsp";

		return path;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}











