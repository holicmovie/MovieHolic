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

	public MyPageFrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("서블릿");
		String page = request.getParameter("page");
		String path = "/page/mypage/mypage.jsp";
		String cp = request.getParameter("followingpage");
		String cpf = request.getParameter("followerpage");
		String choice = request.getParameter("choice");
		System.out.println(choice);
		if ("mypage".equals(page)) {
			path = "/page/mypage/mypage.jsp";
			MoveUrl.forward(request, response, path);
		} else if ("preference".equals(page)) {
			MoveUrl.forward(request, response, "/page/mypage/preference.jsp");
		} else if ("wishlist".equals(page)) {
			MoveUrl.forward(request, response, "/page/mypage/wishlist.jsp");
		} else if ("diary".equals(page)) {
			UserController.getUserController().ReviewList(request, response);
			MoveUrl.forward(request, response, "/page/mypage/diary.jsp");
		} else if ("social".equals(page)) {
			path = MyPageController.getMyPageController().showFollowings(request, response, cp);
			MoveUrl.forward(request, response, path);
			
//			path = MyPageController.getMyPageController().showFollowers(request, response, cp);
//			MoveUrl.forward(request, response, path);
			
		} else if ("setting".equals(page)) {
			UserController.getUserController().settingUser(request, response);
			MoveUrl.forward(request, response, "/page/mypage/setting.jsp");
		} 

		else if("writereview".equals(page)) {
			UserController.getUserController().ReviewRegister(request, response);
			MoveUrl.forward(request, response, "/page/mypage/writereview.jsp");
		} else if("reviewdetail".equals(page)) {
			UserController.getUserController().ReviewDetail(request, response);
			MoveUrl.forward(request, response, "/page/mypage/diaryDetail.jsp");
		} else if("reviewcomment".equals(page)) {
			UserController.getUserController().ReviewComment(request, response);
			MoveUrl.forward(request, response, "/page/mypage/diaryDetail.jsp");
		} else if ("genre".equals(choice)) {
			System.out.println(choice);
		}else if ("year".equals(choice)) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
