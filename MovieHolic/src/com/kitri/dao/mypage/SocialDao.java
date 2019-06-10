package com.kitri.dao.mypage;

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
	
	private SocialDao(){};
	
	public static SocialDao getSocialDao() {
		
		return socialDao;
	}
	
	
	

//	게시해야하는 TotalCnt 구하는 메소드
	public static int selectTotalCnt() {
		String selectTotalCntSQL = "select count(*)\r\n" + 
				"from (select rownum no, social.followingid, social.name, social.list_count, social.best_count\r\n" + 
				"        from(select ms.followingid, mu.name, mu.list_count, mu.best_count\r\n" + 
				"        from mh_social ms, mh_user mu\r\n" + 
				"        where ms.userid = 'a196@gmail.com'\r\n" + 
				"        and mu.enable = 1\r\n" + 
				"        and ms.followingid = mu.userid\r\n" + 
				"        order by best_count DESC) social)";
		int totalCnt = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectTotalCntSQL);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt =rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return totalCnt;
	}

	public static List<SocialDto> selectByRows(int startRow, int endRow) {

		List<SocialDto> list = new ArrayList<>();
		String selectByRowsSQL = "select *\r\n" + 
				"from(select rownum no, social.followingid, social.name, social.list_count, social.best_count\r\n" + 
				"        from(select ms.followingid, mu.name, mu.list_count, mu.best_count\r\n" + 
				"        from mh_social ms, mh_user mu\r\n" + 
				"        where ms.userid = 'a196@gmail.com'\r\n" + 
				"        and mu.enable = 1\r\n" + 
				"        and ms.followingid = mu.userid\r\n" + 
				"        order by best_count DESC) social)\r\n" + 
				"where no between ? and ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectByRowsSQL);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//검색 결과를  RepBoard 객체에 대입
				SocialDto socialDto= new SocialDto();
				
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
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
		
	}

	
	
	public static int selectTotalCnt2() {
		String selectTotalCntSQL = "select count(*)\r\n" + 
				"from (select rownum no, social.userid, social.name, social.list_count, social.best_count\r\n" + 
				"        from(select ms.userid, mu.name, mu.list_count, mu.best_count\r\n" + 
				"        from mh_social ms, mh_user mu\r\n" + 
				"        where ms.followingid = 'a196@gmail.com'\r\n" + 
				"        and mu.enable = 1\r\n" + 
				"        and ms.userid = mu.userid\r\n" + 
				"        order by best_count DESC) social)";
		int totalCnt = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectTotalCntSQL);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt =rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return totalCnt;
	}

	public static List<SocialDto> selectByRows2(int startRow, int endRow) {

		List<SocialDto> list = new ArrayList<>();
		String selectByRowsSQL = "select *\r\n" + 
				"from(select rownum no, social.userid, social.name, social.list_count, social.best_count\r\n" + 
				"        from(select ms.userid, mu.name, mu.list_count, mu.best_count\r\n" + 
				"        from mh_social ms, mh_user mu\r\n" + 
				"        where ms.followingid = 'a196@gmail.com'\r\n" + 
				"        and mu.enable = 1\r\n" + 
				"        and ms.userid = mu.userid\r\n" + 
				"        order by best_count DESC) social)\r\n" + 
				"where no between ? and ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectByRowsSQL);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//검색 결과를  RepBoard 객체에 대입
				SocialDto socialDto= new SocialDto();
				
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
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
		
	}

	public static List<WishlistDto> selectByRows3(int startRow, int endRow) {
		List<WishlistDto> list = new ArrayList<>();
		String selectByRowsSQL = "select code, moviecodenaver, moviecodeyoung\\r\\n\" + \r\n" + 
				"				\"    from mh_wishlist\\r\\n\" + \r\n" + 
				"				\"    where userid = 'a179@gmail.com'\\r\\n\" + \r\n" + 
				"				\"    order by postdate DESC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectByRowsSQL);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//검색 결과를  RepBoard 객체에 대입
				WishlistDto wishlistDto= new WishlistDto();
				
				wishlistDto.setCode(rs.getInt("code"));
				wishlistDto.setMovieCodeNaver(rs.getString("moviecodenaver"));
				wishlistDto.setMovieCodeYoung(rs.getString("moviecodeyoung"));
				wishlistDto.setPostDate(rs.getString("postdate"));
//				wishlistDto.setUserId(rs.getString("userid")); session에서 받아온 userid값 등록
				list.add(wishlistDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
		
	}

	public static int selectTotalCnt3() {
		String selectTotalCntSQL = "select count(*)\r\n" + 
				"from (\r\n" + 
				"    select code, moviecodenaver, moviecodeyoung\r\n" + 
				"    from mh_wishlist\r\n" + 
				"    where userid = 'a179@gmail.com'\r\n" + 
				"    order by postdate DESC)";
		int totalCnt = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(selectTotalCntSQL);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt =rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return totalCnt;
	}

//	public int updateUnable() {
//		int cnt =-1;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			conn = DBConnection.makeConnection();
//			StringBuffer sql = new StringBuffer();
//			sql.append(
//					
//					
//					);
//			
//			
//			pstmt = conn.prepareStatement(sql);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		return cnt;
//	}


	


}
