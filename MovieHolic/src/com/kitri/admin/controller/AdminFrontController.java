package com.kitri.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.MoveUrl;

@WebServlet("/admin")
public class AdminFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String act = request.getParameter("act");
		
		System.out.println("메인에서 들어옴");
		
		String path = "/page/admin/management.jsp";

			
			if ("alllist".equals(act)) {
				
				System.out.println("alllist");
				
				int cnt = 1;
				path = AdminController.getAdminController().selectByUserAll(request, response, cnt);
				MoveUrl.forward(request, response, path);
				
				
				
			}else if ("inactiveList".equals(act)) {
				
//				System.out.println("inactiveList");
				int cnt = 2;
				path = AdminController.getAdminController().selectByUserAll(request, response, cnt);
				MoveUrl.forward(request, response, path);
				
			}else if ("unsubscribelist".equals(act)) {
				
//				System.out.println("unsubscribelist");
				int cnt = 3;
				path = AdminController.getAdminController().selectByUserAll(request, response, cnt);
				MoveUrl.forward(request, response, path);
				
			}
//			else if (condition) {
//				
//				
//				
//			}else if (){
//				
//			}else if () {
//				
//			}else {
//				
//			}
			

		

	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("management에서 FrontController post로 들어옴.");
		
		doGet(request, response);
	}

}
