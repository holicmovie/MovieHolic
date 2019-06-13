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

	
	
	
	
	// 년도별로 나이대 인원 구하기
	public List<AdminChartDto> ageGroup(HttpServletRequest request, HttpServletResponse response, int age) {
		
		
		String barnewlyyearS = request.getParameter("barnewlyyear");
		String baroldyearS = request.getParameter("baroldyear");
		int barnewlyyear = 0; // for문에서 계속 생성되니 밖에 빼줘야뎀.
		int baroldyear = 0;
		
		//for (int age = 1; age <= 5; age++) { // 10~50대 구분하기 위해 사용 아니면 메소드 5개 만들어야뎀. 결론 꼬임 안됌. 못씀 젠장
		
			barnewlyyear = Integer.parseInt(barnewlyyearS);
			baroldyear = Integer.parseInt(baroldyearS);
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<AdminChartDto> list = new ArrayList<AdminChartDto>();
			
			StringBuffer sql = new StringBuffer();

			// 그 년도에 20대 가입한 총 인원 - 그년도에 20대 탈퇴한 총 인원 대신  / 그 년도에 탈퇴한 포함 안함.
			// <= 인 이유는 총인원에서 탈퇴한 사람을 빼야 남아있는 사람이 됌.
			sql.append(" select ((select COUNT(*)");
			sql.append(" from mh_user");
			sql.append(" where to_char(joindate,'yyyy') <= ?"); // 찾을 년도
			if (age == 1) {
				sql.append(" and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 20)");
			} else if (age == 2) {
				sql.append(" and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30)");
			} else if (age == 3) {
				sql.append(" and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 30 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 40)");
			} else if (age == 4) {
				sql.append(" and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 40 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 50)");
			} else if (age == 5) {
				sql.append(" and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) > 50)");
			}
			sql.append(" -");
			sql.append(" (select COUNT(*)");
			sql.append(" from mh_user");
			if (age == 1) {
				sql.append(" where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 20");
			} else if (age == 2) {
				sql.append(" where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30");
			} else if (age == 3) {
				sql.append(" where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 30 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 40");
			} else if (age == 4) {
				sql.append(" where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 40 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 50");
			} else if (age == 5) {
				sql.append(" where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) > 50");
			}
			sql.append(" and to_number(to_char(outdate,'yyyy')) <= ?))");
			sql.append(" from dual");
			
			
			try {
				
				conn = DBConnection.makeConnection();
				pstmt = conn.prepareStatement(sql.toString());			
				
				
				for (int i = 0; i < (barnewlyyear - baroldyear) + 1; i++) {

					AdminChartDto adminChartDto = new AdminChartDto(); // 안에있어야뎀. 할때마다 생성해야지 아니면 덮어쓰게됨.
					
					pstmt.setString(1, Integer.toString(baroldyear+i));
					pstmt.setString(2, Integer.toString(baroldyear+i));
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						
						if (age == 1) {
							adminChartDto.setTeens(rs.getString(1));
							list.add(adminChartDto);
						} else if (age == 2) {
							adminChartDto.setTwenties(rs.getString(1));
							list.add(adminChartDto);
						} else if (age == 3) {
							adminChartDto.setThirties(rs.getString(1));
							list.add(adminChartDto);
						} else if (age == 4) {
							adminChartDto.setFourties(rs.getString(1));
							list.add(adminChartDto);
						} else if (age == 5) {
							adminChartDto.setFifties(rs.getString(1));
							list.add(adminChartDto);
						}
						
					}
					
				}
					
			} catch (SQLException e) {
					
				e.printStackTrace();
					
			} finally {
				DBClose.close(conn, pstmt, rs);
			}
			
		//}
			
			return list;
	
	}
	
	
	
	public static void main(String[] args) {
		
		
		
	}
	
	
	
	
	
	
}














