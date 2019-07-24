package com.kitri.admin.chart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.chart.dao.AdminChartDao;
import com.kitri.admin.chart.dto.AdminChartDto;

public class AdminChartService {
	
	private static AdminChartService adminChartService; // 2번째 전역변수 만들기
	
	static {
		adminChartService = new AdminChartService(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminChartService() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminChartService getAdminChartService () { // 4번째 getter 만들기.
		return adminChartService;
	}
	
	
	
	
	
	public List<AdminChartDto> ageGroup(HttpServletRequest request, HttpServletResponse response, int age) {
		
		return AdminChartDao.getChartDao().ageGroup(request, response, age);
		
	}
	
	
	public int totalPeople(int cnt) {
		
		int people = 0;
		people = AdminChartDao.getChartDao().totalPeople(cnt);
		
		return people;
	}
	
	
	
	
	
}






