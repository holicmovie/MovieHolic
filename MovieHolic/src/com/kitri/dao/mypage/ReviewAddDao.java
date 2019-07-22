package com.kitri.dao.mypage;

import java.sql.*;
import java.util.*;

import com.kitri.dto.*;
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

	

	
	
	// 리뷰writepage
	public FilmDto reviewAdd(String moviecodeyoung) {
		FilmDto filmDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select movieName, movieCodeYoung, movieCodeNaver,movieImage \n");
			sql.append("from mh_films \n");
			sql.append("where moviecodeyoung = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, moviecodeyoung);
			rs = pstmt.executeQuery();
			System.out.println("writepage ohm");
			if(rs.next()) {
				filmDto = new FilmDto();
				filmDto.setMovieNm(rs.getString("moviename"));
				filmDto.setMovieCdNaver(rs.getString("moviecodenaver"));
				filmDto.setMovieCdYoung(rs.getString("moviecodeyoung"));
				filmDto.setMovieImage(rs.getString("movieimage"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		return filmDto;
	}
	//registerbutton
	public int registerReview(BoardDto boardDto) {
		System.out.println(boardDto);
			int cnt = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DBConnection.makeConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("insert  \n");
				sql.append("	into mh_board (seq,userid,boardcode,subject,postdate,content,starpoint,moviename,director,actor1,actor2,category,moviecodeyoung,moviecodenaver,best,worst,notify,enable,viewcount) \n");
				sql.append("	values(seq.nextval,?,1,?,sysdate,?,?,?,?,?,?,?,?,?,0,0,0,?,0) \n");
				pstmt = conn.prepareStatement(sql.toString());
				int idx = 0;
				pstmt.setInt(++idx, boardDto.getSeq());
				pstmt.setString(++idx, boardDto.getUserId());
				pstmt.setInt(++idx, boardDto.getBoardCode());
				pstmt.setString(++idx, boardDto.getSubject());
				pstmt.setString(++idx, boardDto.getPostDate());
				pstmt.setString(++idx, boardDto.getContent());
				pstmt.setInt(++idx, boardDto.getStarPoint());
				pstmt.setString(++idx, boardDto.getMovieName2());
				pstmt.setString(++idx, boardDto.getDirector2());
				pstmt.setString(++idx, boardDto.getActor1());
				pstmt.setString(++idx, boardDto.getActor2());
				pstmt.setString(++idx, boardDto.getCategory());
				pstmt.setString(++idx, boardDto.getMovieCodeYoung2().toString());
				pstmt.setString(++idx, boardDto.getMovieCodeNaver2().toString());
				pstmt.setInt(++idx, boardDto.getBest());
				pstmt.setInt(++idx, boardDto.getWorst());
				pstmt.setInt(++idx, boardDto.getNotify());
				pstmt.setInt(++idx, boardDto.getEnable());
				pstmt.setInt(++idx, boardDto.getViewCount());
				
				cnt = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt);
			}
			return cnt;
		}
	
	// 리뷰목록
	public List<BoardDto> reviewlist(int startRow, int endRow, String userid) {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, d.seq, d.userid, d.movieName, d.content, d.starPoint, d.d1,  d.d2,  d.d3 , d.viewcount, d.enable, d.moviecodeyoung, d.moviecodenaver  \n");
			sql.append("        from(select b.seq, b.userid, b.movieName,b.content,b.starPoint,b.postDate d1, to_char(b.postDate, 'YYYY') d2, to_char(b.postDate, 'MM-DD') d3 , b.viewcount,b.enable,b.moviecodeyoung, b.moviecodenaver \n");
			sql.append("				from mh_board b \n");
			sql.append("				where b.boardCode = 1 \n");
			sql.append("				and b.userid = ? \n");
			sql.append("				order by b.postDate desc) d \n");
			sql.append("		order by rownum ) \n");
			sql.append("where r between ? and ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
					
				String useid = rs.getString("userid");
				StringTokenizer userid2 = new StringTokenizer(useid,"@");
				String id = userid2.nextToken();
				String[] name = rs.getString("moviename").split("\\|\\|");
				String[] young = rs.getString("moviecodeyoung").split("\\|\\|");
				String[] naver = rs.getString("moviecodenaver").split("\\|\\|");
				String movieName = name[0];
				String movieCodeYoung = young[0];
				String movieCodeNaver = naver[0];
				boardDto.setSeq(rs.getInt("seq"));
				boardDto.setUserId(id);
				boardDto.setViewCount(rs.getInt("viewcount"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setStarPoint(rs.getInt("starPoint"));
				boardDto.setMovieName2(movieName);
				boardDto.setMovieCodeNaver2(movieCodeNaver);
				boardDto.setMovieCodeYoung2(movieCodeYoung);
				boardDto.setPostDate(rs.getString("d1"));
				boardDto.setPostDateY(rs.getString("d2"));
				boardDto.setPostDateM(rs.getString("d3"));
				boardDto.setEnable(rs.getInt("enable"));
				
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


	//comment
	public List<CommentDto> reviewContent(String seq){
		List<CommentDto> list = new ArrayList<CommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select seq,content,postDate d1, to_char(postDate, 'YYYY') d2, userId \n");
			sql.append("from mh_comment \n");
			sql.append("order by postDate desc \n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDto commentDto = new CommentDto();	
				String str = rs.getString("userid");
				StringTokenizer st = new StringTokenizer(str, "@");
				String a = st.nextToken();
				commentDto.setSeq(rs.getInt("seq"));
				commentDto.setUserId(a);
				commentDto.setContent(rs.getString("content"));
				commentDto.setPostDate(rs.getString("d1"));
				commentDto.setPostDateY(rs.getString("d2"));
				list.add(commentDto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}

		return list;
	}
	//리뷰정보
	public BoardDto selectByNo(String seq) {
		BoardDto boardDto = null;
//		CommentDto commentDto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select mb.seq,mf.movieimage, mb.movieName,mb.starPoint, mb.postdate,mc.postdate, to_char(mb.postdate, 'YYYY') d1, mb.content,mc.content, mb.userid,mc.userid , mb.viewcount, mb.enable,mb.moviecodenaver, mb.moviecodeyoung \n");
			sql.append("from mh_board mb, mh_comment mc , mh_films mf \n");
			sql.append("where mb.boardcode = 1 \n");
			sql.append("and mb.seq = ?");
//			if("mb.content" != null) { 
//				sql.append("and mb.seq = mc.seq \n");
//			}
			sql.append("order by mb.postdate desc \n");
			
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardDto = new BoardDto();
//				commentDto = new CommentDto();
				String mbid = rs.getString("userid");
				StringTokenizer mb = new StringTokenizer(mbid, "@");
				String mbid2 = mb.nextToken();
				String[] name = rs.getString("moviename").split("\\|\\|");
				String[] young = rs.getString("moviecodeyoung").split("\\|\\|");
				String[] naver = rs.getString("moviecodenaver").split("\\|\\|");
				String movieName = name[0];
				String movieCodeYoung = young[0];
				String movieCodeNaver = naver[0];
				boardDto.setSeq(rs.getInt("seq"));
				boardDto.setMovieName2(movieName);
				boardDto.setPostDate(rs.getString("postdate"));
				boardDto.setPostDateY(rs.getString("d1"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setMovieCodeNaver2(movieCodeNaver);
				boardDto.setMovieCodeYoung2(movieCodeYoung);
				boardDto.setUserId(mbid2);
				boardDto.setViewCount(rs.getInt("viewcount"));
				boardDto.setStarPoint(rs.getInt("starpoint"));
				boardDto.setEnable(rs.getInt("enable"));
				
//				commentDto.setPostDate(rs.getString("postdate"));
//				commentDto.setContent(rs.getString("content"));
//				commentDto.setUserId(mbid2);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return boardDto;
	}
	//리뷰 총갯수
	public int selectTotalReview(String id) {
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from mh_board \n");
			sql.append("where boardcode = 1 \n");
			sql.append("and userid = ? \n");
			sql.append("order by postdate desc \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
								
				cnt = rs.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		
		return cnt;
	}
	//리뷰검색select
public List<BoardDto> searchReviewList(int startRow, int endRow, String search,String userid) {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, d.seq, d.userid, d.movieName, d.content, d.starPoint, d.d1,  d.d2,  d.d3 , d.viewcount, d.enable  \n");
			sql.append("        from(select seq,userid, movieName,content,starPoint,postDate d1, to_char(postDate, 'YYYY') d2, to_char(postDate, 'MM-DD') d3 , viewcount,enable  \n");
			sql.append("				from mh_board \n");
			sql.append("				where boardCode = 1 \n");
			sql.append("				and userid = ? \n");
			sql.append("			and movieName like '%'||?||'%' \n");
			sql.append("				order by postDate desc) d \n");
			sql.append("		order by rownum ) \n");
			sql.append("where r between ? and ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			pstmt.setString(2, search);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
					
				List<String> name = new ArrayList<String>();
				String str = rs.getString("movieName");
				String useid = rs.getString("userid");
				StringTokenizer st = new StringTokenizer(str, "||");
				StringTokenizer userid2 = new StringTokenizer(useid,"@");
				String id = userid2.nextToken();
				String a = st.nextToken();
				
				name.add(a);
				boardDto.setSeq(rs.getInt("seq"));
				boardDto.setUserId(id);
				boardDto.setViewCount(rs.getInt("viewcount"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setStarPoint(rs.getInt("starPoint"));
				boardDto.setMovieName(name);
				boardDto.setPostDate(rs.getString("d1"));
				boardDto.setPostDateY(rs.getString("d2"));
				boardDto.setPostDateM(rs.getString("d3"));
				boardDto.setEnable(rs.getInt("enable"));
				
				list.add(boardDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}

		return list;
	}
	//리뷰검색페이징
	public int selectReviewSearch(String search, String id) {

		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from mh_board \n");
			sql.append("where movieName like '%'||?||'%' \n");
			sql.append("and boardcode = 1 \n");
			sql.append("and userid = ? \n");
			sql.append("order by postdate desc \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, search);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
								
				cnt = rs.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		
		return cnt;
		
	}
//	review 삭제 메소드
	public void deletereview(String userid ,String[] reviewdelete) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			StringBuffer sql = new StringBuffer();
			sql.append("delete mh_board where userid=? and moviecodeyoung like ?|| '%'");
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			if(reviewdelete != null) {
				
				for(int i = 0; i < reviewdelete.length; i++) {
					pstmt.setString(1, userid);
					pstmt.setString(2, reviewdelete[i]);
					pstmt.executeUpdate();
				}
			}
			System.out.println("삭제되니");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("삭제를 실패했습니다.");
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("삭제되었습니다.");
		}
		
	}
	public UserDto selectId(String userid) {
		UserDto userDto =null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select userid, name, pass, phonefirst, phonemid, phonelast, birth, gender \n");
			sql.append("from mh_user \n");
			sql.append("where userid = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				userDto = new UserDto();
				userDto.setUserId(rs.getString("userId"));
				userDto.setName(rs.getString("name"));
				userDto.setPass(rs.getString("pass"));
				userDto.setPhoneFirst(rs.getString("phonefirst"));
				userDto.setPhoneMid(rs.getString("phonemid"));
				userDto.setPhoneLast(rs.getString("phonelast"));
				userDto.setGender(rs.getString("gender"));
				userDto.setBirth(rs.getString("birth"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		
		return userDto;
	}
	public static void main(String[] args) {
		
		System.out.println(getReviewAdd().listList("content"));
		System.out.println(getReviewAdd().reviewContent("seq"));
		System.out.println(getReviewAdd().selectByNo("seq"));
	}
}
