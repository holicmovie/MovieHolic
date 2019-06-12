package com.kitri.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.chart.controller.AdminChartController;
import com.kitri.dto.UserDto;
import com.kitri.util.MoveUrl;

@WebServlet("/UsersFrontController")
public class UsersFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String act = request.getParameter("act");
		System.out.println(act);

		if ("login".equals(act)) {
			
			String path = UsersController.getUsersController().login(request,response);
			MoveUrl.forward(request, response, path);
			
		} else if ("".equals(act)) {
			
			String path = AdminChartController.getAdminChartController().ageGroup(request, response);
			MoveUrl.forward(request, response, path);
			
		} else if ("".equals(act)) {
			
			String path = AdminChartController.getAdminChartController().ageGroup(request, response);
			MoveUrl.forward(request, response, path);
			
		} else if ("".equals(act)) {
			
			String path = AdminChartController.getAdminChartController().ageGroup(request, response);
			MoveUrl.forward(request, response, path);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
		
	}

}
