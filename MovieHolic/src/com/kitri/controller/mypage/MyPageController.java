package com.kitri.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.dto.BoardDto;
import com.kitri.dto.FilmDto;
import com.kitri.dto.LogDto;
import com.kitri.dto.SocialDto;
import com.kitri.dto.WishlistDto;
import com.kitri.dto.mypage.PageBean;
import com.kitri.service.list.ListService;
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


	
	
	
	
	
//-----------------------------[Social기능]----------------------
	public String showFollowings(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
		
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

		List<SocialDto> list = MyPageService.findByRows(userid, pb.getStartRow(), pb.getEndRow());
		pb.setList(list);
		request.setAttribute("pb", pb);

		String test = "following";
		request.setAttribute("test", test);

		String path = "/page/mypage/result/followingresult.jsp";
		return path;
	}

	public String showFollowers(HttpServletRequest request, HttpServletResponse response) {
		String cp = request.getParameter("followerpage");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
//		System.out.println("C : followers , 페이지 : " + cp);
		int currentPage = 1; // 보여줄 현재페이지
		if (cp != null) {
			currentPage = Integer.parseInt(cp);

		}
		int cntPerPage = 5;// 페이지별 보여줄 목록수
		int totalCnt = MyPageService.getTotalCnt2(userid);
//		System.out.println("팔로워 수 : " + totalCnt);
		int cntPerPageGroup = 5;// 페이지 그룹에 보여 줄 페이지수
		String url = "/MovieHolic/mypage?tab=followers&followingpage=";

		PageBean pbf = new PageBean(currentPage, cntPerPage, cntPerPageGroup, totalCnt, url);

		List<SocialDto> list = MyPageService.findByRows2(userid, pbf.getStartRow(), pbf.getEndRow());
		pbf.setList(list);
		request.setAttribute("pbf", pbf);
		String test = "follower";
		request.setAttribute("test", test);

		String path = "/page/mypage/result/followerresult.jsp";
		return path;
	}

	public void deleteFollowings(HttpServletRequest request, HttpServletResponse response) {
		String followingid = request.getParameter("deletefollowing");
//		System.out.println(followingid);
		MyPageService.getMyPageService().deleteFollowingId(followingid);

	}

	public String addFollower(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
		String followid = request.getParameter("follow");
//		System.out.println(followid);
		
		String path = "/page/mypage/result/followresult.jsp";
		String checkedId = "이미 팔로우하고 있는 아이디입니다.";
		int checkId = MyPageService.getMyPageService().checkFollowId(followid);
		if(checkId ==0) {
			MyPageService.getMyPageService().addFollowId(userid, followid);
			checkedId = followid+"님을 팔로우합니다.";
		}
		
		request.setAttribute("checkedId", checkedId);
		return path;
	}

	
	
	
	// ----------------------------wishlist-----------------------------------------
	public String showWishList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
		List<WishlistDto> list = MyPageService.getMyPageService().showWishlist(userid);
//		System.out.println("c : " + list);

		request.setAttribute("wishlist", list);

		String path = "/page/mypage/result/wishlistresult.jsp";
		return path;
	}

	
	public void deleteWishList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
		String wishlistdelete[] = request.getParameterValues("wishlistdelete");
		MyPageService.getMyPageService().deleteWishList(userid, wishlistdelete);
//		if (wishlistdelete != null) {
//			for (int i = 0; i < wishlistdelete.length; i++) {
//				System.out.println("C 체크한 영화 코드 : " + wishlistdelete[i]);
//			}
//		}
	}



	public String searchWishList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
		
		String path = "page/mypage/result/wishlistsearch.jsp";
		String srchKey = request.getParameter("srchKey");
		
		List<WishlistDto> list = MyPageService.getMyPageService().showSearchedWishlist(userid, srchKey);
//		System.out.println("C : " + list);
		request.setAttribute("searchwishlist", list);
		return path;
	}


	//-----------------------[mypage기능]-----------------------------
	//	wishlist 보여주기
		public String showMine(HttpServletRequest request, HttpServletResponse response) {
			String path = "/page/mypage/result/mine.jsp";
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("loginInfo");
			List<WishlistDto> list = MyPageService.getMyPageService().showMineWishList(userid);
			request.setAttribute("minewishlist", list);
//			System.out.println("C : " + list);
			return path;
		}
		
	//	review 보여주기 	
		public void mypageReview(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("loginInfo");
			List<BoardDto> list = MyPageService.getMyPageService().showMineReview(userid);
			
			
			request.setAttribute("mineReview", list);
		}
		
		

		public void mypageList(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("loginInfo");
			List<BoardDto> list = MyPageService.getMyPageService().showMineList(userid);
//			System.out.println("imgsrc넣은 C: "+ list);
			request.setAttribute("mineList", list);
		}
	

		
//		활동로그
		public String mypageFollowing(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("loginInfo");
			String path = "/page/mypage/result/mypagefollowing.jsp";
			List<LogDto> list = MyPageService.getMyPageService().showLog(userid);
			
			request.setAttribute("followingLog", list);
			return path;
		}
	

}
