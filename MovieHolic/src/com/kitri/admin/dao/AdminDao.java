package com.kitri.admin.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitri.admin.dto.AdminDto;
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

	

	public List<AdminDto> selectByUserAll() {
		

		List<AdminDto> list = new ArrayList<AdminDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn = DBConnection.makeConnection();

			StringBuffer sql = new StringBuffer();

			sql.append("select");
			sql.append(" userId,");
			sql.append(" name,");
			sql.append(" birth,");
			sql.append(" phoneFirst,");
			sql.append(" phoneMid,");
			sql.append(" phoneLast,");
			sql.append(" gender,");
			sql.append(" joinDate,");
			sql.append(" outDate");
			sql.append(" from holic_user");
//			if (condition) {
//				sql.append(" where outDate is null;");
//			}

			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AdminDto adminDto = new AdminDto();
//				UserDto.setZipcode(rs.getString("zipcode"));
				adminDto.setUserId(rs.getString("userId"));
				adminDto.setName(rs.getString("name"));
				adminDto.setBirth(rs.getString("birth"));
				adminDto.setPhoneFirst(rs.getString("phoneFirst"));
				adminDto.setPhoneMid(rs.getString("phoneMid"));
				adminDto.setPhoneLast(rs.getString("phoneLast"));
				adminDto.setGender(rs.getString("gender"));
				adminDto.setJoinDate(rs.getDate("joinDate"));
				adminDto.setOutdate(rs.getDate("outDate"));

				list.add(adminDto);
			}
			

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return list;

	}

//	public static void main(String[] args) {
//		
//		AdminDao adminDao = new AdminDao();
//		System.out.println(adminDao.selectByUserAll().get(1));
//		
//	}
	
	
}
