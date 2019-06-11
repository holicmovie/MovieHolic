package com.kitri.admin.chart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.chart.service.AdminChartService;

public class AdminChartController {

	private static AdminChartController adminChartController; // 2번째 전역변수 만들기
	
	static {
		adminChartController = new AdminChartController(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminChartController() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminChartController getAdminChartController () { // 4번째 getter 만들기.
		return adminChartController;
	}
	
	
	
	
	
	
	// 막대그래프 인원 그래프
	public void ageGroup(HttpServletRequest request, HttpServletResponse response) {
		
		AdminChartService.getAdminChartService().ageGroupTwenties(request, response);
		
	}
	
	
	
	
	
	
}












