package com.kitri.dao;

import java.sql.*;
import java.util.*;

import com.kitri.dto.BoardDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;
import com.sun.xml.internal.ws.api.pipe.NextAction;

public class ReviewAddDao{

	private static ReviewAddDao reviewAdd;
	
	static {
		reviewAdd = new ReviewAddDao();
	}
	private  ReviewAddDao() {
		
	}
	public static ReviewAddDao getReviewAdd() {
		return reviewAdd;
		
	}
	
	public int reviewAdd(BoardDto boardDto) {
		int cnt=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert \n");
			sql.append("	into holic_board (seq,userId,boardCode,subject,postDate, content, starPoint,movieName,movieCodeNaver,movieCodeYoung,category,enable) \n");
			sql.append("	values(seq.nextval,?,1,?,sysdate,?,?,?,?,?,?,1 ) \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setInt(++idx, boardDto.getSeq());
			pstmt.setString(++idx, boardDto.getUserId());
			pstmt.setInt(++idx, boardDto.getBoardCode());
			pstmt.setString(++idx,boardDto.getSubject());
			pstmt.setString(++idx, boardDto.getPostDate());
			pstmt.setString(++idx, boardDto.getContent());
			pstmt.setInt(++idx, boardDto.getStarPoint());
			pstmt.setString(++idx, boardDto.getMovieName().toString());
			pstmt.setString(++idx, boardDto.getDirector().toString());
			pstmt.setString(++idx, boardDto.getMovieCodeYoung().toString());
			pstmt.setString(++idx, boardDto.getCategory());
			pstmt.setInt(++idx, boardDto.getEnable());
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
	}
	public List<BoardDto> reviewlist(String movieName){
		List<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select 	movieCodeNaver,postDate,starPoint,movieName \n");
			sql.append("from 	holic_board \n");
			sql.append("order by postDate desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, movieName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();

				boardDto.setMovieCodeNaver(rs.getString("movieCodeNaver"));
				boardDto.setPostDate(rs.getString("postDate"));
				boardDto.setStarPoint(rs.getInt("starPoint"));
				boardDto.setMovieName(rs.getString("movieName"));
			
				list.add(boardDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
