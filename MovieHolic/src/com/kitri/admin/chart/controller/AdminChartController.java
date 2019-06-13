package com.kitri.admin.chart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.chart.dto.AdminChartDto;
import com.kitri.admin.chart.service.AdminChartService;

public class AdminChartController {

	
	
	
	private static AdminChartController adminChartController; // 2번째 전역변수 만들기

	static {
		adminChartController = new AdminChartController(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminChartController() {
	} // 1번째 외부에서 생성 못하게 만듬.

	public static AdminChartController getAdminChartController() { // 4번째 getter 만들기.
		return adminChartController;
	}
	
	
	

	
	// 막대그래프 인원 그래프
	public String ageGroup(HttpServletRequest request, HttpServletResponse response) {

		List<AdminChartDto> listteen = ageGroupTeens(request, response);
		List<AdminChartDto> listtwenties = ageGroupTwenties(request, response);
		List<AdminChartDto> listthirties = ageGroupThirties(request, response);
		List<AdminChartDto> listfourties = ageGroupFourties(request, response);
		List<AdminChartDto> listfifties = ageGroupFifties(request, response);
		
		AdminChartDto acdte = new AdminChartDto(); // dto의 list는 한개이므로 총 5개를 만들어야뎀.
		AdminChartDto acdtw = new AdminChartDto();
		AdminChartDto acdth = new AdminChartDto();
		AdminChartDto acdfo = new AdminChartDto();
		AdminChartDto acdfi = new AdminChartDto();
		
		//acdte.setList(listteen);
		request.setAttribute("acdte", listteen);
		
		//acdtw.setList(listteen);
		request.setAttribute("acdtw", listtwenties);
		
		//acdth.setList(listteen);
		request.setAttribute("acdth", listthirties);
		
		//acdfo.setList(listteen);
		request.setAttribute("acdfo", listfourties);
		
		//acdfi.setList(listteen);
		request.setAttribute("acdfi", listfifties);
		
		String path = "/page/adminchart/statistics.jsp";
		
		if (listteen.size() != 0) {
			for (int i = 0; i < listteen.size(); i++) {
				System.out.println("listteen = " + listteen.get(i));
			}
		}
		if (listtwenties.size() != 0) {
			for (int i = 0; i < listtwenties.size(); i++) {
				System.out.println("listtwenties = " + listtwenties.get(i));
			}
		}
		if (listthirties.size() != 0) {
			for (int i = 0; i < listthirties.size(); i++) {
				System.out.println("listthirties = " + listthirties.get(i));
			}
		}
		if (listfourties.size() != 0) {
			for (int i = 0; i < listfourties.size(); i++) {
				System.out.println("listfourties = " + listfourties.get(i));
			}
		}
		if (listfifties.size() != 0) {
			for (int i = 0; i < listfifties.size(); i++) {
				System.out.println("listfifties = " + listfifties.get(i));
			}
		}
		
		
		
		
		
		
		return path;
		
	}

	
	
	// 10대 이하 년도별 인원
	public List<AdminChartDto> ageGroupTeens(HttpServletRequest request, HttpServletResponse response) {
		int age = 1;
		return AdminChartService.getAdminChartService().ageGroup(request, response, age);
	}

	// 20대 년도별 인원
	public List<AdminChartDto> ageGroupTwenties(HttpServletRequest request, HttpServletResponse response) {
		int age = 2;
		return AdminChartService.getAdminChartService().ageGroup(request, response, age);
	}

	// 30대 년도별 인원
	public List<AdminChartDto> ageGroupThirties(HttpServletRequest request, HttpServletResponse response) {
		int age = 3;
		return AdminChartService.getAdminChartService().ageGroup(request, response, age);
	}

	// 40대 년도별 인원
	public List<AdminChartDto> ageGroupFourties(HttpServletRequest request, HttpServletResponse response) {
		int age = 4;
		return AdminChartService.getAdminChartService().ageGroup(request, response, age);
	}

	// 50대 이상 년도별 인원
	public List<AdminChartDto> ageGroupFifties(HttpServletRequest request, HttpServletResponse response) {
		int age = 5;
		return AdminChartService.getAdminChartService().ageGroup(request, response, age);
	}

	
//	-------------------------------------------------------------------------------------------------------------------------------
	
	
}
