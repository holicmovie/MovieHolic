package com.kitri.dao.list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kitri.dto.BoardDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class ListDao {
	
//	#### singleTone ####
	private static ListDao listDao;
	static {
		listDao = new ListDao();
	}
	private ListDao() {}
	public static ListDao getListDao() {
		return listDao;
	}
	
	
//	#### List테이블에 insert ####
	public String insertList(BoardDto board) {
		String seq = null;
		String name = "";
		String young = "";
		String naver = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			// list타입의 영화정보를 ||로 연결하여 String으로 변환
			int len = board.getMovieName().size();
			for(int i=0; i<len; i++) {
				name += board.getMovieName().get(i) + "||";
				young += board.getMovieCodeYoung().get(i) + "||";
				naver += board.getMovieCodeNaver().get(i) + "||";
			}
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MH_BOARD (SEQ, USERID, BOARDCODE, SUBJECT, POSTDATE, CONTENT, MOVIENAME, MOVIECODEYOUNG, MOVIECODENAVER, ENABLE) \n");
			sql.append("VALUES (SEQ.NEXTVAL, ?, 2, ?, SYSDATE, ?, ?, ?, ?, 1)");
			String seqArr[] = {"seq"};	// 글번호 컬럼이름
			pstmt = conn.prepareStatement(sql.toString(), seqArr);	//insert 후 sequence 받아오기
			
			int idx = 0;
			pstmt.setString(++idx, board.getUserId());
			pstmt.setString(++idx, board.getSubject());
			pstmt.setString(++idx, board.getContent());
			pstmt.setString(++idx, name);
			pstmt.setString(++idx, young);
			pstmt.setString(++idx, naver);
			
			pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();	//insert 후 sequence 받아오기
            
            rs.next();
            seq = rs.getString(1);	// 받아온 글번호 return
            
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return seq;
	}
}
