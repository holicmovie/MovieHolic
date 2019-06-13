package com.kitri.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.MoveUrl;


@WebServlet("/UsersFrontController")
public class UsersFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String act = request.getParameter("act");
		System.out.println(act);

		if ("login".equals(act)) {
			
			int result = UsersController.getUsersController().login(request,response);
			PrintWriter out = response.getWriter();
			out.print(result);
			
		} else if ("logout".equals(act)) {
			
			String path = UsersController.getUsersController().logout(request,response);
			MoveUrl.redirect(request, response, path);
			//MoveUrl.forward(request, response, path);
			//System.out.println("유저니아러니ㅏㅇ러ㅣㅏ");
			
		} else if ("register".equals(act)) {
			
//			String path = AdminChartController.getAdminChartController().ageGroup(request, response);
//			MoveUrl.forward(request, response, path);
			
		} else if ("".equals(act)) {
			
//			String path = AdminChartController.getAdminChartController().ageGroup(request, response);
//			MoveUrl.forward(request, response, path);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
		
	}

}
