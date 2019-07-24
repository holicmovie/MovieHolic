package com.kitri.admin.chart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.util.MoveUrl;

@WebServlet("/chart")
public class AdminChartFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String act = request.getParameter("act");
		
		
		if ("chart".equals(act)) {
			
			String path = AdminChartController.getAdminChartController().ageGroup(request, response);
			MoveUrl.forward(request, response, path);
			
		}
	
		
		
		
		
		
	}

	

	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
}







