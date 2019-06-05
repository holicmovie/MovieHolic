package com.kitri.admin.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitri.admin.dto.AdminDto;
import com.kitri.admin.dto.NotifyDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class AdminDao  {

	
	private static AdminDao adminDao; // 2번째 전역변수 만들기
	
	static {
		adminDao = new AdminDao(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminDao() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminDao getAdminDao () { // 4번째 getter 만들기.
		return adminDao;
	}

	
	
	
//	페이징 처리 -----------------------------------------------------------
	
	
	// 목록 불러오기.
	public List<AdminDto> selectByRows(int startRow, int endRow, int cnt){
		
		List<AdminDto> list = new ArrayList<AdminDto>();

		StringBuffer sql = new StringBuffer();
		
		sql.append(" select");
		sql.append(" userid, name, birth,");
		sql.append(" phoneFirst, phoneMid, phoneLast,");
		sql.append(" gender, joinDate, outDate, enable");
		
		sql.append(" from");
		sql.append(" ( select rownum r, userid, name, birth,");
		sql.append(" phoneFirst, phoneMid, phoneLast,");
		sql.append(" gender, joinDate, outDate, enable");
		sql.append(" from mh_user");
		if (cnt == 2) {
			sql.append(" where enable = 1");
		}else if (cnt == 3) {
			sql.append(" where outDate is not null");
		}
		sql.append(" )");
		sql.append(" where r between ? and ?");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				AdminDto adminDto = new AdminDto();
				
				adminDto.setUserId(rs.getString("userId"));
				adminDto.setName(rs.getString("name"));
				adminDto.setBirth(rs.getString("birth"));
				adminDto.setPhoneFirst(rs.getString("phoneFirst"));
				adminDto.setPhoneMid(rs.getString("phoneMid"));
				adminDto.setPhoneLast(rs.getString("phoneLast"));
				adminDto.setGender(rs.getString("gender"));
				adminDto.setJoinDate(rs.getDate("joinDate"));
				adminDto.setOutdate(rs.getDate("outDate"));
				adminDto.setEnable(rs.getInt("enable"));
				

				list.add(adminDto);
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		
		
		return list;


	}
	


	
	
	
	
//	--------------------------------------------	
	
	// 토탈수
	public int selectTotalCnt(int cnt) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select COUNT(*)");
		sql.append(" from (select userId,name,birth,");
		sql.append(" phoneFirst,phoneMid,phoneLast,");
		sql.append(" gender,joinDate,outDate,enable from mh_user");
		if (cnt == 2) {
			sql.append(" where enable = 1");
		}else if (cnt == 3) {
			sql.append(" where outDate is not null");
		}
		sql.append(" )");

		
		int totalCnt = -1;
		
		try {
			
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		

		return totalCnt;
	}
	
	
	
	
	
	
	

	
	
	
	// 목록 불러오기.
		public List<NotifyDto> NFselectByRows(int startRow, int endRow){
			
			List<NotifyDto> list = new ArrayList<NotifyDto>();

			StringBuffer sql = new StringBuffer();
			
			sql.append(" select r, boardName, userId, subject, content, postDate, notify");
			sql.append(" from(select rownum r,  mc.boardName, mb.userId, mb.subject, mb.content, mb.postDate, mb.notify");
			sql.append(" from mh_board mb, mh_category mc");
			sql.append(" where mb.boardcode = mc.boardcode");
			sql.append(" and notify != 0");
			sql.append(" order by seq desc)");
			sql.append(" where r between ? and ?");
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				conn = DBConnection.makeConnection();
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rs = pstmt.executeQuery();
				
				
//				순서
//				rownum,mc.boardName,mb.userId,mb.subject,mb.content,mb.postDate,mb.notify
				
				
				while (rs.next()) {
					
					NotifyDto notifyDto = new NotifyDto();
					
					notifyDto.setBoardName(rs.getString("boardName"));
					notifyDto.setUserId(rs.getString("userId"));
					notifyDto.setSubject(rs.getString("subject"));
					notifyDto.setContent(rs.getString("content"));
					notifyDto.setPostDate(rs.getDate("postDate"));
					notifyDto.setNotify(rs.getInt("notify"));
					notifyDto.setRow(rs.getInt("r"));

					list.add(notifyDto);
				}
				

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt, rs);
			}
			
			
			
			return list;


		}
	
	
	
	
		// 토탈수
		public int NFselectTotalCnt() {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			StringBuffer sql = new StringBuffer();
			
			sql.append(" select count(*)");
			sql.append(" from mh_board mb, mh_category mc");
			sql.append(" where mb.boardcode = mc.boardcode");
			sql.append(" and notify != 0");
			sql.append(" order by notify desc");

			
			int totalCnt = -1;
			
			try {
				
				conn = DBConnection.makeConnection();
				pstmt = conn.prepareStatement(sql.toString());			
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					totalCnt = rs.getInt("count(*)"); //  = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				
			} finally {
				DBClose.close(conn, pstmt, rs);
			}
			

			return totalCnt;
		}
	
	
	
	
	

	public static void main(String[] args) {
		
		AdminDao adminDao = new AdminDao();
//		int cnt = 1;
//		System.out.println(adminDao.selectByUserAll(cnt).get(0));
//		
//		총 로우 갯수
//		int cnt = adminDao.selectTotalCnt(1);
//		System.out.println(cnt);
		
//		로우 ? ~ ? 까지 뽑아내는것
//		System.out.println(adminDao.selectByRows(1, 4, 2));
		
//		int cnt = adminDao.NFselectTotalCnt();
//		System.out.println(cnt);
		
	}
	
	
}












