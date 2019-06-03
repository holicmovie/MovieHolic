package com.kitri.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.controller.AdminController;
import com.kitri.admin.dao.AdminDao;
import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.dto.NotifyDto;

public class AdminService {

	
	
	
	private static AdminService adminService; // 2번째 전역변수 만들기
	
	static {
		adminService = new AdminService(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminService() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminService getAdminService() { // 4번째 getter 만들기.
		return adminService;
	}
	
	
	
	
	
	
	// 페이징처리
	public List<AdminDto> findByRows(int startRow, int endRow, int cnt){
		return AdminDao.getAdminDao().selectByRows(startRow, endRow, cnt);
	}
	

	// 페이징처리
	public int getTotalCnt(int cnt) {
		return AdminDao.getAdminDao().selectTotalCnt(cnt);
	}
	
	
	// 신고게시물 페이징처리
	public List<NotifyDto> NFselectByRows(int startRow, int endRow){
		return AdminDao.getAdminDao().NFselectByRows(startRow, endRow);
	}
		

	// 신고게시물 페이징처리
	public int NFselectTotalCnt() {
		return AdminDao.getAdminDao().NFselectTotalCnt();
	}
	
	
	
	
}











