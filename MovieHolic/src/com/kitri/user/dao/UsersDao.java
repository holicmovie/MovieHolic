package com.kitri.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kitri.user.dto.UsersDto;
import com.kitri.util.DBClose;
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
	

	
	
	
	public int registerMember(UsersDto usersDto) {
		
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			
			
			
//			private String userid;		//ID
//			private String pass;		//PW
//			private String name;		//이름
//			private String birth;		//생년월일
//			private String gender;		//성별
//			private String phoneFirst;	//폰1
//			private String phoneMid;	//폰2
//			private String phoneLast;	//폰3
//			insert into mh_user (userid, name, pass, phoneFirst, phoneMid, phoneLast, gender, joindate) 
//			values ('qjawns0618@naver.com', '권준범','1234', '010','5555' , '6666', '남' , sysdate);
			
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into mh_user");
			sql.append(" (userid, name, pass, birth, phoneFirst, phoneMid, phoneLast, gender, joindate) ");
			sql.append(" values\n");
			sql.append(" ( ?, ?, ?, ?, ?, ?, ?, ?, sysdate)\n");
			pstmt = conn.prepareStatement(sql.toString());
			
			int idx = 0;
			
			pstmt.setString(++idx, usersDto.getUserId());
			pstmt.setString(++idx, usersDto.getName());
			pstmt.setString(++idx, usersDto.getPass());
			pstmt.setString(++idx, usersDto.getBirth());
			pstmt.setString(++idx, usersDto.getPhoneFirst());
			pstmt.setString(++idx, usersDto.getPhoneMid());
			pstmt.setString(++idx, usersDto.getPhoneLast());
			pstmt.setString(++idx, usersDto.getGender());
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}
	
	
	
	
	public int idCheck(String id) {

		int cnt = 1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select count(userid) \n");
			sql.append("from mh_user \n");
			sql.append("where userid = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1); // ?
			
		} catch (SQLException e) {
			cnt = 1;
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return cnt;
	}
	
	
	
	
	
	
	

}












