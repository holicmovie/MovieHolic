package com.kitri.admin.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

				//System.out.println(adminDto.getOutdate());

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
		
		sql.append(" select r, seq, boardName, userId, subject, content, postDate, notify");
		sql.append(" from(select rownum r,  seq, mc.boardName, mb.userId, mb.subject, mb.content, mb.postDate, mb.notify");
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
			
			
//			순서
//			rownum,mc.boardName,mb.userId,mb.subject,mb.content,mb.postDate,mb.notify
				
				
			while (rs.next()) {
					
				NotifyDto notifyDto = new NotifyDto();
				
				notifyDto.setSeq(rs.getInt("seq"));
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
	
	
	
	
	
	
	// 회원 탈퇴 갱신.
	public void deletUser(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		// 만약 탈퇴할때 그사람의 행을 지울려면 부모자식간을 모두 간섭해야뎀.
		// 지금 경우는 탈퇴하는 사람은 sysdate 주기.
		// 체크박스 눌렀을때 탈퇴되어있는 사람이면 경고표시.
		sql.append(" UPDATE mh_user"); 
		sql.append(" SET outdate = sysdate");
		sql.append(" WHERE userid = ?");
		
		String checkArr[] = request.getParameterValues("ap_checkbox");
		int len = checkArr.length;
		
		try {
		
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());

			
			if(checkArr != null) {
				
				for(int i=0; i<len; i++) {
					
					String result = checkArr[i].toString();
					pstmt.setString( 1 , result);
					pstmt.executeUpdate();
					
				}
				
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}
	
	
	
	
	// 휴면 설정
	// 휴면 값 0일땐 활동 1일땐 휴면
	// 1. 휴면값이 0으로 들어오면 1로 들어오면 0으로 바꿔줘야뎀.
	// 휴면 설정
	public void dormancy() {
		
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		StringBuffer sql = new StringBuffer();
		
		if (cnt == 0) {
			sql.append(" UPDATE mh_user"); 
			sql.append(" SET outdate = sysdate");
			sql.append(" WHERE userid = ?");
		} else if (cnt == 1) {
			
		} else {
			// 실패
		}
	
	}
	
	
	
	
	
	
	// 신고 게시물 댓글 삭제
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" delete from mh_board"); 
		sql.append(" where seq = ?");
		
		String checkArr[] = request.getParameterValues("np_checkbox");
		int len = checkArr.length;
		
		
		try {
		
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());

			
			if(checkArr != null) {
				
				for(int i=0; i<len; i++) {
					String result = checkArr[i].toString();
					pstmt.setString( 1 , result);
					pstmt.executeUpdate();
					
				}
				
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}
	
	
	
	
	
		// 신고 게시물 삭제
		// 이름을 가지고 해당 게시물을 null or 0으로 변환해주기.
		// 게시물의 분류로 뭐가 들어가는지 쓸때 삽입시 어떤것이 들어가는지 물어보기.
		public void deleteBoard(HttpServletRequest request, HttpServletResponse response) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			StringBuffer sql = new StringBuffer();
			
			sql.append(" delete from mh_comment"); 
			sql.append(" where seq = ?");
			
			String checkArr[] = request.getParameterValues("np_checkbox");
			int len = checkArr.length;
			
			
			try {
			
				conn = DBConnection.makeConnection();
				pstmt = conn.prepareStatement(sql.toString());

				
				if(checkArr != null) {
					
					for(int i=0; i<len; i++) {
						String result = checkArr[i].toString();
						pstmt.setString( 1 , result);
						pstmt.executeUpdate();
						
					}
					
				}		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt);
			}
			
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
//		System.out.println(adminDao.selectByRows(1, 5, 1));
		
//		int cnt = adminDao.NFselectTotalCnt();
//		System.out.println(cnt);
		
		
//		System.out.println(adminDao.NFselectByRows(1, 49));
		
	}
	
	
}












