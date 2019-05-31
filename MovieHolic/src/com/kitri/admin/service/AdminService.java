package com.kitri.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.controller.AdminController;
import com.kitri.admin.dao.AdminDao;
import com.kitri.admin.dto.AdminDto;

public class AdminService {

	
	
	
	private static AdminService adminService; // 2번째 전역변수 만들기
	
	static {
		adminService = new AdminService(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminService() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminService getAdminService() { // 4번째 getter 만들기.
		return adminService;
	}
	
	// 목록
	public List<AdminDto> selectByUserAll(int cnt) {

		return AdminDao.getAdminDao().selectByUserAll(cnt);
	}
	
	
	// 페이징처리
	public List<AdminDto> findByRows(int startRow, int endRow){
		
		return AdminDao.getAdminDao().selectByRows(startRow, endRow);
	}
	

	public int getTotalCnt() {
		
		return AdminDao.getAdminDao().selectTotalCnt();
	}
	
	
}












