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

//	public String deleteFollowings(HttpServletRequest request, HttpServletResponse response) {
//		String path = "page/mypage/social.jsp";
//		int result = MyPageService.getMyPageService().deleteFollowingId();
//		
//		return path;
//	}
	
	
}
