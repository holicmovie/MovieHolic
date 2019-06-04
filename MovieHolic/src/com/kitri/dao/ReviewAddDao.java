package com.kitri.dao;

import java.sql.*;
import java.util.*;

import com.kitri.dto.BoardDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class ReviewAddDao {

	private static ReviewAddDao reviewAdd;

	static {
		reviewAdd = new ReviewAddDao();
	}

	private ReviewAddDao() {

	}

	public static ReviewAddDao getReviewAdd() {
		return reviewAdd;

	}

	// 리뷰쓰기
	public int reviewAdd(BoardDto boardDto) {
		int cnt = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert \n");
			sql.append(
					"	into holic_board (seq,userId,boardCode,subject,postDate, content, starPoint,movieName,movieCodeNaver,movieCodeYoung,category,enable) \n");
			sql.append("	values(seq.nextval,?,1,?,sysdate,?,?,?,?,?,?,1 ) \n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setInt(++idx, boardDto.getSeq());
			pstmt.setString(++idx, boardDto.getUserId());
			pstmt.setInt(++idx, boardDto.getBoardCode());
			pstmt.setString(++idx, boardDto.getSubject());
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
		} finally {
			DBClose.close(conn, pstmt);
		}

		return cnt;
	}

	// 리뷰목록
	public List<BoardDto> reviewlist(String movieName) {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select movieName,content,starPoint,postDate d1, to_char(postDate, 'YYYY') d2, to_char(postDate, 'MM-DD') d3\n");
			sql.append("from mh_board \n");
			sql.append("where boardCode = 1 \n");
			sql.append("order by postDate desc \n");
			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, movieName);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
					
				List<String> name = new ArrayList<String>();
				String str = rs.getString("movieName");
				StringTokenizer st = new StringTokenizer(str, "||");
				String a = st.nextToken();
				
				name.add(a);
				boardDto.setPostDate(rs.getString("d1"));
				boardDto.setPostDateY(rs.getString("d2"));
				boardDto.setPostDateM(rs.getString("d3"));
				boardDto.setStarPoint(rs.getInt("starPoint"));
				boardDto.setMovieName(name);
				boardDto.setContent(rs.getString("content"));

				list.add(boardDto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}

		return list;
	}
	//리스트목록
public List<BoardDto> listList(String content) {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select subject,content \n");
			sql.append("from mh_board \n");
			sql.append("where boardCode =2 \n");
			sql.append("order by postDate desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setContent(rs.getString("content"));

				list.add(boardDto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}

		return list;
	}
	
	// 페이징 처리

	public List<BoardDto> selectByRows(int startRow, int endRow) {

		List<BoardDto> list = new ArrayList<BoardDto>();

		return list;
	}

	public int selectTotalCnt() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer(); 
		
		sql.append("select count(*) from mh_board");
		
		int totalCnt = -1;

		try {

			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return totalCnt;
	}
	
	public static void main(String[] args) {
		
		System.out.println(getReviewAdd().reviewlist("movieName"));
		System.out.println(getReviewAdd().listList("content"));
	}
}
