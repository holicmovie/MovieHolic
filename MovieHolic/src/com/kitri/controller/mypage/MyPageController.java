package com.kitri.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.dto.AdminPageDto;
import com.kitri.admin.service.AdminService;
import com.kitri.dto.SocialDto;
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
	
	public String findFollowings(HttpServletRequest request, HttpServletResponse response) {
		String userId = "'a196@gmail.com'";
		String path = "/page/mypage/social.jsp";
		List<SocialDto> list = new ArrayList<SocialDto>();
		list = MyPageService.getMyPageService().selectFollowing(userId);
		request.setAttribute("followinglist", list);
		return path;
	}
	
	public String findTotalCnt(int currentPage) {
		
		String path = "/page/mypage/social.jsp";
		
		currentPage = 1; // 보여줄 현재페이지
		if (currentPage != null) {
			currentPage = Integer.parseInt(currentPage);

		}
		int cntPerPage = 5;// 페이지별 보여줄 목록수
		int totalCnt = MyPageService.getMyPageService().selectTotalCnt(currentPage);
		int cntPerPageGroup = 3;// 페이지 그룹에 보여 줄 페이지수
		String url = "boardlist";
		
		SocialPageDto spd = new SocialPageDto(currentPage, 
									cntPerPage, 
									cntPerPageGroup, 
									totalCnt
									);

		List<SocialPageDto> list = 
				MyPageService.getMyPageService().selectTotalCnt(spd.getStartRow(), 
						spd.getEndRow());
		spd.setList(list);


		return path;
	}
}
