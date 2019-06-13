package com.kitri.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kitri.user.dto.UsersDto;
import com.kitri.util.DBConnection;

public class UsersDao {
	
	
	
	private static UsersDao usersDao;
	
	static {
		usersDao = new UsersDao();
	}

	private UsersDao() {}
	
	public static UsersDao getUsersDao () {
		return usersDao;
	}
			
	
	
	
	
	// 로그인
	public UsersDto selectById(String userid){
		// exception을 넘길때는 상대방도 Exception을 상속받아야뎀.
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto ud = new UsersDto();

		try {
			
			conn = DBConnection.makeConnection();
			
			//SQL구문 DB서버로 송신 : executeQuery();
			//결과수신 : rs
			String selectByIdSQL = "select * from mh_user where userid = ?";
			pstmt = conn.prepareStatement(selectByIdSQL);
			
			pstmt.setString(1, userid);
			pstmt.executeQuery();
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ud.setUserId(userid);
				ud.setPass(rs.getString("pass"));
				ud.setName(rs.getString("name"));
			}
			
			
		} catch (SQLException e) { // 원글 - catch (ClassNotFoundException e) 
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		return ud;
	}
	

	
	
	
	
	
	
	
	
	
	
	

}












