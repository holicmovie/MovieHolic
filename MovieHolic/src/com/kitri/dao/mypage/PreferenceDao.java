package com.kitri.dao.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.FilmDto;
import com.kitri.dto.mypage.PreferenceDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class PreferenceDao {

	private static PreferenceDao preferenceDao;

	static {
		preferenceDao = new PreferenceDao();
	}

	private PreferenceDao() {

	}

	public static PreferenceDao getPreferenceDao() {
		return preferenceDao;

	}

	
	// [메소드]
	
	// 1
	// 리뷰 수
	public int selectReviewCount(String userid) {
		
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) cnt \n");
			sql.append("from mh_board \n");
			sql.append("where boardcode = 1 \n");
			sql.append("and userid = ?");
		
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				cnt = rs.getInt("cnt");
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return cnt;
	}

	// 2
	// 선호 장르
	public List<PreferenceDto> selectUserCategory(String userid) {
		
		List<PreferenceDto> list = new ArrayList<PreferenceDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.category, round(f.perr,1) per \n");
			sql.append("		from (select category , count(*) * 100 / (select count(*) from mh_board where userid = ? and category is not null and boardcode = 1) perr \n");
			sql.append("				from mh_board \n");
			sql.append("				where userid = ? \n");
			sql.append("				and boardcode =  1 \n");
			sql.append("				and category is not null \n");
			sql.append("				group by category \n");
			sql.append("				order by count(*) desc) f) \n");
			sql.append("where r < 6");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			pstmt.setString(2, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PreferenceDto dto = new PreferenceDto();

				dto.setCategory(rs.getString("category"));
				dto.setPercent(rs.getString("per"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}

	// 3
	// 선호 배우
	public List<PreferenceDto> selectUserActors(String userid) {

		List<PreferenceDto> list = new ArrayList<PreferenceDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.actor1, f.score \n");
			sql.append("		from (select to_char(actor1) actor1, sum(starpoint)*count(*) score \n");
			sql.append("				from mh_board \n");
			sql.append("				where userid = ? \n");
			sql.append("				and actor1 is not null \n");
			sql.append("				and boardcode = 1 \n");
			sql.append("				group by to_char(actor1) \n");
			sql.append("				order by count(*) desc) f ) \n");
			sql.append("where r < 6");
	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PreferenceDto dto = new PreferenceDto();

				dto.setActor(rs.getString("actor1"));
				dto.setActorScore(rs.getInt("score"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;

	}

	// 4
	// 선호 감독
	public List<PreferenceDto> selectUserDirectors(String userid) {

		List<PreferenceDto> list = new ArrayList<PreferenceDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.director, f.score \n");
			sql.append("		from (select to_char(director) director , sum(starpoint)*count(*) score \n");
			sql.append("				from mh_board \n");
			sql.append("				where userid = ? \n");
			sql.append("				and director is not null \n");
			sql.append("				and boardcode = 1 \n");
			sql.append("				group by to_char(director) \n");
			sql.append("				order by count(*) desc) f ) \n");
			sql.append("where r < 6");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PreferenceDto dto = new PreferenceDto();

				dto.setDirector(rs.getString("director"));
				dto.setDirectorScore(rs.getInt("score"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}

	// 5
	// 별점 분포
	public List<Integer> selectUserStars(String userid) {

		List<Integer> list = new ArrayList<Integer>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select starpoint, count(*) cnt \n");
			sql.append("from mh_board \n");
			sql.append("where userid=? \n");
			sql.append("and starpoint is not null \n");
			sql.append("and boardcode = 1 \n");
			sql.append("group by starpoint \n");
			sql.append("order by starpoint");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {

				list.add(rs.getInt("cnt"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}
	
	
	
	
	
	
}
