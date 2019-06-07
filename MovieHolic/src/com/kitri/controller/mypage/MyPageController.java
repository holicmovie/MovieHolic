package com.kitri.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.dto.AdminPageDto;
import com.kitri.admin.service.AdminService;
import com.kitri.dto.SocialDto;
import com.kitri.dto.mypage.PageBean;
import com.kitri.dto.mypage.SocialPageDto;
import com.kitri.service.mypage.MyPageService;

public class MyPageController {
	
	private static MyPageController myPageController;
	
	static {
		myPageController = new MyPageController();
	}
	
	private MyPageController() {}
	
	public static MyPageController getMyPageController() {
		return myPageController;
	}
	

	public String showFollowings(HttpServletRequest request, HttpServletResponse response, String cp) {
		
		int currentPage = 1; // 보여줄 현재페이지
		if (cp != null) {
			currentPage = Integer.parseInt(cp);

		}
		int cntPerPage = 5;// 페이지별 보여줄 목록수
		int totalCnt = MyPageService.getTotalCnt();
		int cntPerPageGroup = 5;// 페이지 그룹에 보여 줄 페이지수
		String url = "/MovieHolic/mypage";
		
		PageBean pb = new PageBean(currentPage, 
									cntPerPage, 
									cntPerPageGroup, 
									totalCnt, 
									url
									);

		List<SocialDto> list = 
				MyPageService.findByRows(pb.getStartRow(), 
								pb.getEndRow());
		pb.setList(list);
		request.setAttribute("pb", pb);

		String path = "/page/mypage/social.jsp";
		return path;
	}
	

public String showFollowers(HttpServletRequest request, HttpServletResponse response, String cp) {
		
		int currentPage = 1; // 보여줄 현재페이지
		if (cp != null) {
			currentPage = Integer.parseInt(cp);

		}
		int cntPerPage = 5;// 페이지별 보여줄 목록수
		int totalCnt = MyPageService.getTotalCnt();
		int cntPerPageGroup = 5;// 페이지 그룹에 보여 줄 페이지수
		String url = "/MovieHolic/mypage";
		
		PageBean pbf = new PageBean(currentPage, 
									cntPerPage, 
									cntPerPageGroup, 
									totalCnt, 
									url
									);

		List<SocialDto> list = 
				MyPageService.findByRows(pbf.getStartRow(), 
								pbf.getEndRow());
		pbf.setList(list);
		request.setAttribute("pbf", pbf);

		String path = "/page/mypage/social.jsp";
		return path;
	}
	
	
	
	
	
	
//	public String deleteFollowings(HttpServletRequest request, HttpServletResponse response) {
//		String path = "page/mypage/social.jsp";
//		int result = MyPageService.getMyPageService().deleteFollowingId();
//		
//		return path;
//	}
	
	
}
