package com.kitri.dao.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.SocialDto;
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
	
	
	public static List<SocialDto> selectFollowingId(String userId) {
		List<SocialDto> list = new ArrayList<SocialDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			userId = "a196@gmail.com";
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select ms.followingid, mu.name, mu.list_count, mu.best_count\r\n" + 
					"    from mh_social ms, mh_user mu\r\n" + 
					"    where ms.userid = ? \r\n" + 
					"    and ms.followingid = mu.userid");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SocialDto socialDto = new SocialDto();
				
				socialDto.setFollowingId(rs.getString("followingId"));
				socialDto.setName(rs.getString("name"));
				socialDto.setList_count(rs.getInt("list_count"));
				socialDto.setBest_count(rs.getInt("best_count"));
				
				list.add(socialDto);
			}
			
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}

	public static void main(String[] args) {
		List<SocialDto> result = new ArrayList<SocialDto>();
		String userId = "'a196@gmail.com'";
		result = SocialDao.selectFollowingId(userId);
		System.out.println(result);
	}
	
}
