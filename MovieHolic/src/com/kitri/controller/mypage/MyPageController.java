package com.kitri.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.SocialDto;
import com.kitri.dto.WishlistDto;
import com.kitri.dto.mypage.PageBean;
import com.kitri.service.mypage.MyPageService;

public class MyPageController {

	private static MyPageController myPageController;

	static {
		myPageController = new MyPageController();
	}

	private MyPageController() {
	}

	public static MyPageController getMyPageController() {
		return myPageController;
	}

	public String showFollowings(HttpServletRequest request, HttpServletResponse response) {
		String cp = request.getParameter("followingpage");
//		System.out.println("C : following , 페이지 : " + cp);
		int currentPage = 1; // 보여줄 현재페이지
		if (cp != null) {
			currentPage = Integer.parseInt(cp);

		}
		int cntPerPage = 5;// 페이지별 보여줄 목록수
		int totalCnt = MyPageService.getTotalCnt();
		int cntPerPageGroup = 5;// 페이지 그룹에 보여 줄 페이지수
		String url = "/MovieHolic/mypage?page=social&followingpage=";

		PageBean pb = new PageBean(currentPage, cntPerPage, cntPerPageGroup, totalCnt, url);

		List<SocialDto> list = MyPageService.findByRows(pb.getStartRow(), pb.getEndRow());
		pb.setList(list);
		request.setAttribute("pb", pb);

		String test = "following";
		request.setAttribute("test", test);

		String path = "/page/mypage/result/followingresult.jsp";
		return path;
	}

	public String showFollowers(HttpServletRequest request, HttpServletResponse response) {
		String cp = request.getParameter("followerpage");
//		System.out.println("C : followers , 페이지 : " + cp);
		int currentPage = 1; // 보여줄 현재페이지
		if (cp != null) {
			currentPage = Integer.parseInt(cp);

		}
		int cntPerPage = 5;// 페이지별 보여줄 목록수
		int totalCnt = MyPageService.getTotalCnt2();
//		System.out.println("팔로워 수 : " + totalCnt);
		int cntPerPageGroup = 5;// 페이지 그룹에 보여 줄 페이지수
		String url = "/MovieHolic/mypage?tab=followers&followingpage=";

		PageBean pbf = new PageBean(currentPage, cntPerPage, cntPerPageGroup, totalCnt, url);

		List<SocialDto> list = MyPageService.findByRows2(pbf.getStartRow(), pbf.getEndRow());
		pbf.setList(list);
		request.setAttribute("pbf", pbf);
		String test = "follower";
		request.setAttribute("test", test);

		String path = "/page/mypage/result/followerresult.jsp";
		return path;
	}

	public void deleteFollowings(HttpServletRequest request, HttpServletResponse response) {
		String followingid = request.getParameter("deletefollowing");
		System.out.println(followingid);
		MyPageService.getMyPageService().deleteFollowingId(followingid);
			
	}
	
	public void addFollower(HttpServletRequest request, HttpServletResponse response) {
		String followid =request.getParameter("follow");
		System.out.println(followid);
		MyPageService.getMyPageService().addFollowId(followid);
	}
	
	
	
	
	
	
	//----------------------------wishlist-----------------------------------------
	public String showWishList(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = "a125@gmail.com";
		List<WishlistDto> list = MyPageService.getMyPageService().showWishlist(userid);
//		System.out.println("c : " + list);

		request.setAttribute("wishlist", list);

		String path = "/page/mypage/result/wishlistresult.jsp";
		return path;
	}
	
	
	public String searchWishList(HttpServletRequest request, HttpServletResponse response) {
		String path = "page/mypage/result/wishlistsearch.jsp";
		
		String srchKey = request.getParameter("srchKey");
		String userid = "a125@gmail.com";
		List<WishlistDto> list = MyPageService.getMyPageService().showSearchedWishlist(userid, srchKey);
		System.out.println("C : " + list);
		request.setAttribute("searchwishlist", list);
		return path;
	}
	
	
	
//----------------------------------mypage-------------------------------------------
	
	
	public String showMine(HttpServletRequest request, HttpServletResponse response) {
		String path = "/page/mypage/result/mine.jsp";
		
		return path;
	}

	

}
