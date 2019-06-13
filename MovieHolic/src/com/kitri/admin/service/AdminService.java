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
	
	
	
	
	
	
	// 페이징처리 row
	public List<AdminDto> findByRows(int startRow, int endRow, int cnt){
		return AdminDao.getAdminDao().selectByRows(startRow, endRow, cnt);
	}
	

	// 페이징처리 totalcnt
	public int getTotalCnt(int cnt) {
		return AdminDao.getAdminDao().selectTotalCnt(cnt);
	}
	
	
	// 신고게시물 페이징처리 row
	public List<NotifyDto> NFselectByRows(int startRow, int endRow){
		return AdminDao.getAdminDao().NFselectByRows(startRow, endRow);
	}
		

	// 신고게시물 페이징처리 totalcnt
	public int NFselectTotalCnt() {
		return AdminDao.getAdminDao().NFselectTotalCnt();
	}
	
	
	// 회원 탈퇴 갱신
	public void deletUser(HttpServletRequest request, HttpServletResponse response) {
		AdminDao.getAdminDao().deletUser(request,response);
	}
	
	
	// 신고 게시물 댓글 삭제
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) {
		AdminDao.getAdminDao().deleteComment(request, response);
	}
	
	
	// 신고 게시물 본글 삭제
	public void deleteBoard(HttpServletRequest request, HttpServletResponse response) {
		AdminDao.getAdminDao().deleteBoard(request, response);
	}
	
	
	// 휴면 설정.
	public void dormancy(HttpServletRequest request, HttpServletResponse response) {
		AdminDao.getAdminDao().dormancy(request, response);
	}
	
	
	// 검색 totalcnt
	public int searchTotal(HttpServletRequest request, HttpServletResponse response) {
		return AdminDao.getAdminDao().searchTotal(request,response);
	}

	
	// 회원 게시판 검색 찾기.
	public List<AdminDto> search(HttpServletRequest request, HttpServletResponse response, int startRow, int endRow) {
		return AdminDao.getAdminDao().search(request,response,startRow,endRow);
	}
	
	
	
	
}












