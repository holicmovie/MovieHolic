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
//		String inactiveList = request.getParameter("inactiveList");
//		String unsubscribelist = request.getParameter("unsubscribelist");
		
		
		
		String path = "/page/admin/management.jsp";

//		  path = admin.getAdminController().register(request,response);
//		  null값이뜸. 어디든 갈 수 있음. MoveUrl.forwared(request, response, path);
		
			
			if ("alllist".equals(act)) {
				
				System.out.println("alllist");
				
				System.out.println("1");
				path = AdminController.getAdminController().selectByUserAll(request, response);
				System.out.println("2");
				System.out.println(path);
				MoveUrl.forward(request, response, path);
				
				System.out.println("3");
				
				
			}else if ("inactiveList".equals(act)) {
				
				System.out.println("inactiveList");
				
			}else if ("unsubscribelist".equals(act)) {
				
				
			}else {
				
			}
			

		

	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("management에서 FrontController post로 들어옴.");
		
		doGet(request, response);
	}

}
