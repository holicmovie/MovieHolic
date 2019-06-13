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
		} else if("listDetail".equals(act)) {	// #### List목록에서 상세페이지로 넘기기 ####
			String path = ListController.getListController().listDetail(request, response);
			MoveUrl.forward(request, response, path);
		} else if("selList".equals(act)) {
			String path = ListController.getListController().selListBySeq(request, response);
			MoveUrl.forward(request, response, path);
		} else if("modifyList".equals(act)) {
			int result = ListController.getListController().modifyList(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("delete".equals(act)) {
			int result = ListController.getListController().deleteList(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("evaluate".equals(act)) {
			int result = ListController.getListController().evaluate(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("notify".equals(act)) {
			int result = ListController.getListController().notify(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("saveComment".equals(act)) {
			int result = ListController.getListController().saveComment(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("selComment".equals(act)) {
			String path = ListController.getListController().selComment(request, response);
			MoveUrl.forward(request, response, path);
		} else if("delComment".equals(act)) {
			int result = ListController.getListController().delComment(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("modCommment".equals(act)) {
			String result = ListController.getListController().modCommment(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("updateComment".equals(act)) {
			int result = ListController.getListController().updateComment(request, response);
			response.setContentType("text/plain; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.print(result);
		} else if("sortList".equals(act)) {
			String path = ListController.getListController().sortPopular(request, response);
			MoveUrl.forward(request, response, path);
		} else if("sortLatest".equals(act)) {
			String path = ListController.getListController().sortLatest(request, response);
			MoveUrl.forward(request, response, path);
		} else if("srchList".equals(act)) {
			String path = ListController.getListController().srchList(request, response);
			MoveUrl.forward(request, response, path);
		} else if("navSrch".equals(act)) {
			String path = ListController.getListController().navSrchMVbyName(request, response);
			MoveUrl.forward(request, response, path);
		} else if("".equals(act)) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	

}
