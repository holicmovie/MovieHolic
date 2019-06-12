package com.kitri.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.MoveUrl;

@WebServlet("/mypage")
public class MyPageFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("서블릿진입");
		String page = request.getParameter("page");
		String tab = request.getParameter("tab");
		String path = "";
		String wishlist = request.getParameter("wishlist");
//		String wishlistdelete[] = request.getParameterValues("wishlistdelete");
//		
//		if(wishlistdelete != null) {
//			for(int i = 0; i < wishlistdelete.length;i++) {
//			System.out.println("FC 체크한 영화 코드 : " + wishlistdelete[i]);
//			}
//		}
//----------------------------------[mypage]----------------------------------------
		if ("mypage".equals(page)) {
			path = MyPageController.getMyPageController().showMine(request, response);
			MoveUrl.forward(request, response, path);
			
			
			
//--------------------------------[취향 분석]-----------------------------------------------
			
		} else if ("preference".equals(page)) {
			MoveUrl.forward(request, response, "/page/mypage/preference.jsp");
			
			
			
			
//			-----------------------[wishlist]---------------------------------------
		} else if ("wishlist".equals(page)) {
			path = MyPageController.getMyPageController().showWishList(request, response);
			MyPageController.getMyPageController().deleteWishList(request, response);
			MoveUrl.forward(request, response, path);
			
			
		} else if ("search".equals(wishlist)) {	
			path = MyPageController.getMyPageController().searchWishList(request, response);
			MoveUrl.forward(request, response, path);
			

			
			
			
//			-----------------------[diary]---------------------------------------
			
		} else if ("diary".equals(page)) {
			UserController.getUserController().ReviewList(request, response);
			MoveUrl.forward(request, response, "/page/mypage/diary.jsp");
			
			
			
//			-----------------------[social]---------------------------------------
			
		} else if ("social".equals(page)) {
			path = MyPageController.getMyPageController().showFollowings(request, response);
			MyPageController.getMyPageController().deleteFollowings(request, response);
			MoveUrl.forward(request, response, path);
			
			
			
			
//			-----------------------[setting]---------------------------------------
		} else if ("setting".equals(page)) {
			UserController.getUserController().settingUser(request, response);
			UserController.getUserController().settingProfile(request, response);
			MoveUrl.forward(request, response, "/page/mypage/setting.jsp");
			
			
			
			
			
//			-----------------------[review작성]---------------------------------------
		} else if("writereview".equals(page)) {
			UserController.getUserController().ReviewRegister(request, response);
			MoveUrl.forward(request, response, "/page/mypage/writereview.jsp");
			
			
			
			
			
//			-----------------------[review 상세 확인]---------------------------------------
			
		}  else if("reviewdetail".equals(page)) {
			UserController.getUserController().ReviewDetail(request, response);
			MoveUrl.forward(request, response, "/page/mypage/diaryDetail.jsp");
			
			
			
			
			
//			-----------------------[review 댓글]---------------------------------------
		} else if("reviewcomment".equals(page)) {
			UserController.getUserController().ReviewComment(request, response);
			MoveUrl.forward(request, response, "/page/mypage/diaryDetail.jsp");
			
			
			
			
//			-----------------------[소셜-follower기능]---------------------------------------
		} else if ("followers".equals(tab)) {
			path = MyPageController.getMyPageController().showFollowers(request, response);
			MyPageController.getMyPageController().addFollower(request, response);
			MoveUrl.forward(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
			
					
		doGet(request, response);
	}

}
