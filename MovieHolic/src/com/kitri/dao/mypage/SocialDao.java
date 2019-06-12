package com.kitri.dao.mypage;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.SocialDto;
import com.kitri.dto.WishlistDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class SocialDao {

	private static SocialDao socialDao;

	static {
		socialDao = new SocialDao();
	}

	private SocialDao() {
	};

	public static SocialDao getSocialDao() {

		return socialDao;
	}

//	게시해야하는 TotalCnt 구하는 메소드
	public static int selectTotalCnt() {
		String selectTotalCntSQL = "select count(*)\r\n"
				+ "from (select rownum no, social.followingid, social.name, social.list_count, social.best_count\r\n"
				+ "        from(select ms.followingid, mu.name, mu.list_count, mu.best_count\r\n"
				+ "        from mh_social ms, mh_user mu\r\n" + "        where ms.userid = 'a196@gmail.com'\r\n"
				+ "        and mu.enable = 1\r\n" + "        and ms.followingid = mu.userid\r\n"
				+ "        order by best_count DESC) social)";
		int totalCnt = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectTotalCntSQL);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return totalCnt;
	}

	public static List<SocialDto> selectByRows(int startRow, int endRow) {

		List<SocialDto> list = new ArrayList<>();
		String selectByRowsSQL = "select *\r\n"
				+ "from(select rownum no, social.followingid, social.name, social.list_count, social.best_count\r\n"
				+ "        from(select ms.followingid, mu.name, mu.list_count, mu.best_count\r\n"
				+ "        from mh_social ms, mh_user mu\r\n" + "        where ms.userid = 'a196@gmail.com'\r\n"
				+ "        and mu.enable = 1\r\n" + "        and ms.followingid = mu.userid\r\n"
				+ "        order by best_count DESC) social)\r\n" + "where no between ? and ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectByRowsSQL);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 검색 결과를 RepBoard 객체에 대입
				SocialDto socialDto = new SocialDto();

				socialDto.setNo(rs.getInt("no"));
				socialDto.setFollowingId(rs.getString("followingId"));
				socialDto.setName(rs.getString("name"));
				socialDto.setList_count(rs.getInt("list_count"));
				socialDto.setBest_count(rs.getInt("best_count"));
				list.add(socialDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;

	}

	public static int selectTotalCnt2() {
		String selectTotalCntSQL = "select count(*)\r\n"
				+ "from (select rownum no, social.userid, social.name, social.list_count, social.best_count\r\n"
				+ "        from(select ms.userid, mu.name, mu.list_count, mu.best_count\r\n"
				+ "        from mh_social ms, mh_user mu\r\n" + "        where ms.followingid = 'a196@gmail.com'\r\n"
				+ "        and mu.enable = 1\r\n" + "        and ms.userid = mu.userid\r\n"
				+ "        order by best_count DESC) social)";
		int totalCnt = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectTotalCntSQL);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return totalCnt;
	}

	public static List<SocialDto> selectByRows2(int startRow, int endRow) {

		List<SocialDto> list = new ArrayList<>();
		String selectByRowsSQL = "select *\r\n"
				+ "from(select rownum no, social.userid, social.name, social.list_count, social.best_count\r\n"
				+ "        from(select ms.userid, mu.name, mu.list_count, mu.best_count\r\n"
				+ "        from mh_social ms, mh_user mu\r\n" + "        where ms.followingid = 'a196@gmail.com'\r\n"
				+ "        and mu.enable = 1\r\n" + "        and ms.userid = mu.userid\r\n"
				+ "        order by best_count DESC) social)\r\n" + "where no between ? and ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectByRowsSQL);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 검색 결과를 RepBoard 객체에 대입
				SocialDto socialDto = new SocialDto();

				socialDto.setNo(rs.getInt("no"));
				socialDto.setUserId(rs.getString("userid"));
				socialDto.setName(rs.getString("name"));
				socialDto.setList_count(rs.getInt("list_count"));
				socialDto.setBest_count(rs.getInt("best_count"));
				list.add(socialDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;

	}

	public void deleteFollowing(String followingid) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			String sql = "delete mh_social\r\n" + "where followingid = ?";
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, followingid);
			pstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(followingid + " 삭제를 실패했습니다.");
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println(followingid + "가 삭제되었습니다.");
		}

	}

	public void addFollow(String followid) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			String sql = "insert into mh_social values(?,?,sysdate)";
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "a196@gmail.com");
			pstmt.setString(2, followid);
			pstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(followid + " 추가를 실패했습니다.");
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println(followid + " 추가를 성공했습니다.");
		}

	}

	// ------------------------------wishilist---------------------------


	public List<WishlistDto> selectWishlist(String userid) {
		List<WishlistDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			StringBuffer SQL = new StringBuffer();
			SQL.append("select * "); 
			SQL.append("from mh_films f, mh_wishlist w "); 
			SQL.append("where f.moviecodenaver = w.moviecodenaver ");
			SQL.append("and w.userid = ? "); 
			SQL.append("order by w.postdate DESC ");
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(SQL.toString());
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//검색 결과를  RepBoard 객체에 대입
				WishlistDto wishlistDto= new WishlistDto();
				
				wishlistDto.setUserId(rs.getString("userid")); //session에서 받아온 userid값 등록
				wishlistDto.setCode(rs.getInt("code"));
				wishlistDto.setMovieCodeNaver(rs.getString("moviecodenaver"));
				wishlistDto.setMovieCodeYoung(rs.getString("moviecodeyoung"));
				wishlistDto.setPostDate(rs.getString("postdate"));
				wishlistDto.setMovieNm(rs.getString("moviename"));
				wishlistDto.setPrdtYear(rs.getString("prdtyear"));
				wishlistDto.setCategory(rs.getString("category"));
				list.add(wishlistDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
//		System.out.println("dao : " + list);
		return list;
		
	}

	public List<WishlistDto> selectSearchedWishlist(String userid, String srchKey) {
		List<WishlistDto>list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \r\n" + 
					"from mh_films f, mh_wishlist w \n" + 
					"where f.moviecodenaver = w.moviecodenaver \n" + 
					"and w.userid = ? \n" + 
					"and movieName like '%'||?||'%' \n" + 
					"order by w.postdate DESC"); 

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			pstmt.setString(2, srchKey);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WishlistDto wishlistDto = new WishlistDto();
				wishlistDto.setUserId(rs.getString("userid")); //session에서 받아온 userid값 등록
				wishlistDto.setCode(rs.getInt("code"));
				wishlistDto.setMovieCodeNaver(rs.getString("moviecodenaver"));
				wishlistDto.setMovieCodeYoung(rs.getString("moviecodeyoung"));
				wishlistDto.setPostDate(rs.getString("postdate"));
				wishlistDto.setMovieNm(rs.getString("moviename"));
				wishlistDto.setPrdtYear(rs.getString("prdtyear"));
				wishlistDto.setCategory(rs.getString("category"));
				list.add(wishlistDto);		
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		System.out.println("dao : " + list);
		return list;
	}


}
