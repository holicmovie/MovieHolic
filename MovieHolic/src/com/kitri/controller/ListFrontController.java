package com.kitri.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.controller.list.ListController;
import com.kitri.util.MoveUrl;

@WebServlet("/list")
public class ListFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		
		if("srchMV".equals(act)) {		// #### makelist.jsp의 모달 : 영화 검색 ####
			String path = ListController.getListController().srchMVbyName(request, response);
			MoveUrl.forward(request, response, path);
		} else if("saveList".equals(act)) {	// #### makelist.jsp의 저장 버튼 : List 저장 ####
			int result = ListController.getListController().saveList(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	

}
