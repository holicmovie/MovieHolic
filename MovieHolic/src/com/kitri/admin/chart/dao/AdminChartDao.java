package com.kitri.admin.chart.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.chart.dto.AdminChartDto;
import com.kitri.admin.dto.AdminDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class AdminChartDao {
	
	private static AdminChartDao chartDao; // 2번째 전역변수 만들기
	
	static {
		chartDao = new AdminChartDao(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private AdminChartDao() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static AdminChartDao getChartDao () { // 4번째 getter 만들기.
		return chartDao;
	}

	
	
	
	
	// 년도별로 20대 구하기
	public void ageGroupTwenties(HttpServletRequest request, HttpServletResponse response) {
		
		String barnewlyyearS = request.getParameter("barnewlyyear");
		String baroldyearS = request.getParameter("baroldyear");
		int barnewlyyear = Integer.parseInt(barnewlyyearS);
		int baroldyear = Integer.parseInt(baroldyearS);
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<AdminChartDto> list = new ArrayList<AdminChartDto>();

		StringBuffer sql = new StringBuffer();
		
		// 그 년도에 20대 가입한 총 인원 - 그년도에 20대 탈퇴한 총 인원 대신  / 그 년도에 탈퇴한 포함 안함.  
		sql.append(" select (select COUNT(*) count");
		sql.append(" from mh_user");
		sql.append(" where to_char(joindate,'yyyy') = ?"); // 찾을 년도
		sql.append(" and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30)");
		sql.append(" -");
		sql.append(" (select COUNT(*)");
		sql.append(" from mh_user");
		sql.append(" where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30");
		sql.append(" and to_number(to_char(outdate,'yyyy')) = ?)");
		sql.append(" from dual");
		
		
		try {
			
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());			
			
			AdminChartDto adminChartDto = new AdminChartDto();
			
			for (int i = 0; i < (barnewlyyear - baroldyear); i++) {
				
				pstmt.setString(1, Integer.toString(baroldyear+i));
				pstmt.setString(2, Integer.toString(baroldyear+i));
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					adminChartDto.setTwenties(rs.getString(1));
					System.out.println(adminChartDto.getTwenties());
					
				}
				
			}
				
		} catch (SQLException e) {
				
			e.printStackTrace();
				
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
	}
	
	
	
	
	public static void main(String[] args) {
		
		
		
	}
	
	
	
	
	
	
}














