package com.kitri.dao.film;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.BoardDto;
import com.kitri.dto.FilmDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class FilmDao {

	// [싱글톤 패턴 객체]
	private static FilmDao filmDao;
	static {
		filmDao = new FilmDao();
	}
	private FilmDao() {}
	public static FilmDao getFilmDao() {
		return filmDao;
	}
	
	// ------------------------------------------------------- [ index.jsp ] -------------------------------------------------------
	
	// 1
	// <장르별 추천 영화 10개 select> 메소드
	// 네이버 별점순
	public List<FilmDto> selectFilmsByCategory(String category) {
		
		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.moviename, f.moviecodeyoung, f.moviecodenaver, f.movieImage, f.category, f.prdtyear, f.openyear, f.starpointnaver \n");
			sql.append("		from (select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \n");
			sql.append("				from mh_films \n");
			sql.append("				where category like '%'||?||'%' \n");
			sql.append("				order by starpointnaver desc) f) rf \n");
			sql.append("where rf.r < 11");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, category);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FilmDto film = new FilmDto();
				film.setMovieNm(rs.getString("movieName"));
				film.setMovieCdYoung(rs.getString("movieCodeYoung"));
				film.setMovieCdNaver(rs.getString("movieCodeNaver"));
				film.setMovieImage(rs.getString("movieImage"));
				film.setCategory(category);
				film.setPrdtYear(rs.getString("prdtYear"));
				film.setOpenYear(rs.getString("openYear"));
				film.setStarPointNaver(rs.getString("starPointNaver"));
				
				list.add(film);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}
	
	// 2
	// <회원 선호 장르 select> 메소드
	// 인자값 : 선호 장르 순위
	public String selectFavoriteCategory(String userId, int rank) {
		
		String category = "";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.category \n");
			sql.append("		from (select category , count(*) \n");
			sql.append("				from mh_board \n");
			sql.append("				where userid = ? \n");
			sql.append("				and category is not null \n");
			sql.append("				group by category \n");
			sql.append("				order by count(*)) f ) \n");
			sql.append("where r = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			pstmt.setInt(2, rank);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				category = rs.getString("category");
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return category;
				
	}
	
	// 3
	// <최신 영화 10개 select> 메소드
	// 개봉일 최신순
	public List<FilmDto> selectLatestFilm() {

		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.moviename, f.moviecodeyoung, f.moviecodenaver, f.movieImage, f.category, f.prdtyear, f.openyear, f.starpointnaver \n");
			sql.append("		from (select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \n");
			sql.append("				from mh_films \n");
			sql.append("				where openyear is not null \n");
			sql.append("				order by openyear desc) f) rf \n");
			sql.append("where rf.r < 11");
			
			
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FilmDto film = new FilmDto();
				film.setMovieNm(rs.getString("movieName"));
				film.setMovieCdYoung(rs.getString("movieCodeYoung"));
				film.setMovieCdNaver(rs.getString("movieCodeNaver"));
				film.setMovieImage(rs.getString("movieImage"));
				film.setCategory(rs.getString("category"));
				film.setPrdtYear(rs.getString("prdtYear"));
				film.setOpenYear(rs.getString("openYear"));
				film.setStarPointNaver(rs.getString("starPointNaver"));
				
				list.add(film);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}
	
	// 4
	// <별점 높은 영화 10개 select> 메소드
	// 별점순
	public List<FilmDto> selectBestStarFilm() {

	List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.moviename, f.moviecodeyoung, f.moviecodenaver, f.movieImage, f.category, f.prdtyear, f.openyear, f.starpointnaver \n");
			sql.append("		from (select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \n");
			sql.append("				from mh_films \n");
			sql.append("				order by starpointnaver desc) f) rf \n");
			sql.append("where rf.r < 11");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FilmDto film = new FilmDto();
				film.setMovieNm(rs.getString("movieName"));
				film.setMovieCdYoung(rs.getString("movieCodeYoung"));
				film.setMovieCdNaver(rs.getString("movieCodeNaver"));
				film.setMovieImage(rs.getString("movieImage"));
				film.setCategory(rs.getString("category"));
				film.setPrdtYear(rs.getString("prdtYear"));
				film.setOpenYear(rs.getString("openYear"));
				film.setStarPointNaver(rs.getString("starPointNaver"));
				
				list.add(film);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}
	
	
	// ------------------------------------------------------- [ moviefilm.jsp ] -------------------------------------------------------
	
	// 5
	// <주간 인기 영화 목록 select> 메소드
	//  최근 일주일간 리뷰 개수 순 10개
	public List<FilmDto> selectFilmListByReviewCount() {

		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, g.mn, g.mc \n");
			sql.append("from (select distinct mboard.mname mn, best.mcodeyoung mc \n");
			sql.append("from (select TO_CHAR(moviename) mname, TO_CHAR(moviecodeyoung) mcodeyoung \n");
			sql.append("from mh_board) mboard , \n");
			sql.append("(select TO_CHAR(moviecodeyoung) mcodeyoung, count(*) mreviewcnt \n");
			sql.append("from mh_board \n");
			sql.append("where boardcode = 1 \n");
			sql.append("and postdate between sysdate - 7 and sysdate \n");
			sql.append("group by TO_CHAR(moviecodeyoung) \n");
			sql.append("order by count(*) desc) best \n");
			sql.append("where mboard.mcodeyoung = best.mcodeyoung)g) \n");
			sql.append("where r < 11");

			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FilmDto film = new FilmDto();
				
				System.out.println("디비 영화명 : " + rs.getString("MN"));
				System.out.println("디비 영화코드 영진원 : " + rs.getString("MC"));
				film.setMovieNm(rs.getString("MN"));				// 영화명
				film.setMovieCdYoung(rs.getString("MC"));			// 영화코드(영진원)
				
				list.add(film);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 6
	// <장르별 영화 목록 select> 메소드
	//  개봉연도 최신순 & 네이버 별점순
	public List<FilmDto> selectFilmListByCategory(String category, int startRow, int endRow) {
		
		System.out.println("FilmDao : 파라미터로 보내 온 장르는 " + category);

		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("select * \n");
			sql.append("from (select rownum r, f.movieName, f.movieCodeYoung, f.movieCodeNaver, f.movieImage, f.category, f.prdtYear, f.openYear, f.starPointNaver \n");
			sql.append("	  from (select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \n");
			sql.append("	   		from mh_films \n");
			sql.append("			where category like '%'||?||'%' \n");
			sql.append("			order by openYear desc, starPointNaver desc) f \n");
			sql.append("	  order by rownum) \n");
			sql.append("where r between ? and ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			// 장르 = 전체
			if(category == null) {
				pstmt.setString(1, "");
			} else if("null".equals(category)){
				// 장르 = 전체인데, 페이지 이동하는 경우
				pstmt.setString(1, "");
			} else {
				// 장르 = 선택 장르
				pstmt.setString(1, category);
			}
			
			// 페이지 범위
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FilmDto film = new FilmDto();
				
				film.setMovieNm(rs.getString("movieName"));
				film.setMovieCdYoung(rs.getString("movieCodeYoung"));
				film.setMovieCdNaver(rs.getString("movieCodeNaver"));
				film.setMovieImage(rs.getString("movieImage"));
				film.setCategory(rs.getString("category"));
				film.setPrdtYear(rs.getString("prdtYear"));
				film.setOpenYear(rs.getString("openYear"));
				film.setStarPointNaver(rs.getString("starPointNaver"));
				
				list.add(film);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
		
	}
	
	// 7
	// <검색 결과 영화 목록 select> 메소드
	// 개봉연도 최신순 & 네이버 별점순
	public List<FilmDto> selectBySrchKey(String srchKey, int startRow, int endRow) {
 
		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, f.movieName, f.movieCodeYoung, f.movieCodeNaver, f.movieImage, f.category, f.prdtYear, f.openYear, f.starPointNaver \n");
			sql.append("	  from (select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \n");
			sql.append("			from mh_films \n");
			sql.append("			where movieName like '%'||?||'%' \n");
			sql.append("			order by openYear desc, starPointNaver desc) f \n");
			sql.append("	  order by rownum) \n");
			sql.append("where r between ? and ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			// 검색어 설정
			pstmt.setString(1, srchKey);
			// 페이지 범위
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FilmDto film = new FilmDto();
				
				film.setMovieNm(rs.getString("movieName"));
				film.setMovieCdYoung(rs.getString("movieCodeYoung"));
				film.setMovieCdNaver(rs.getString("movieCodeNaver"));
				film.setMovieImage(rs.getString("movieImage"));
				film.setCategory(rs.getString("category"));
				film.setPrdtYear(rs.getString("prdtYear"));
				film.setOpenYear(rs.getString("openYear"));
				film.setStarPointNaver(rs.getString("starPointNaver"));
				
				list.add(film);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		
		return list;
		
	}
	
	// 8
	// <장르별 영화 목록 개수 select> 메소드
	// 개봉연도 최신순 & 네이버 별점순
	public int selectFilmCountByCategory(String category) {

		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from mh_films \n");
			sql.append("where category like '%'||?||'%' \n");
			sql.append("order by openYear desc, starPointNaver desc");
			
			
			pstmt = conn.prepareStatement(sql.toString());
			
			System.out.println("dao : category : " + category);
			
			// 장르 = 전체
			if(category == null) {
				pstmt.setString(1, "");
			// 페이지 눌렸을 때, 장르 = 전체 (null이 문자열이 됨)
			}else if("null".equals(category)){
				pstmt.setString(1, "");
			}else {
			// 장르 = 선택 장르
				pstmt.setString(1, category);
			}
			
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
	
	// 9
	// <검색한 영화 목록 개수 select> 메소드
	// 개봉연도 최신순 & 네이버 별점순
	public int selectFilmCountBySrchKey(String srchKey) {

		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from mh_films \n");
			sql.append("where movieName like '%'||?||'%' \n");
			sql.append("order by openYear desc, starPointNaver desc");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, srchKey);
			
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
	
	
	
	// ------------------------------------------------------- [ moviedetail.jsp ] -------------------------------------------------------

	// 10
	// <선택한 영화 별점 select> 메소드
	// 무비홀릭 회원들의 별점 평균
	public int selectByMovieCdYoung(String movieCdYoung) {
		
		int star = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select avg(starpoint) \n");
			sql.append("from mh_board \n");
			sql.append("where to_char(moviecodeyoung) = ?||'||'");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, movieCdYoung);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {					
				star = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return star;
		
	}
	
	// 11
	// <선택된 영화 리뷰 개수 select> 메소드
	public int selectReviewCountByMovieCdYoung(String movieCdYoung) {
		
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from mh_board \n");
			sql.append("where to_char(moviecodeyoung) = ?||'||' \n");
			sql.append("and boardcode = 1 \n");
			sql.append("and enable = 1 \n");
			sql.append("order by postdate desc");
			
			pstmt = conn.prepareStatement(sql.toString());		
			pstmt.setString(1, movieCdYoung);
			
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
	
	// 12
	// <선택한 영화 리뷰 select> 메소드
	// 무비홀릭 회원들의 리뷰
	public List<BoardDto> selectReviewsByMovieCdYoung(String movieCdYoung, int startRow, int endRow) {

		List<BoardDto> list = new ArrayList<BoardDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * \n");
			sql.append("from (select rownum r, b.seq, b.userid, b.postdate, b.content, b.starpoint \n");
			sql.append("	  from (select seq, userid, to_char(postdate,'yyyy-mm-dd') postdate, content, starpoint \n");
			sql.append("			from mh_board \n");
			sql.append("			where to_char(moviecodeyoung) = ?||'||' \n");
			sql.append("			and boardcode = 1 \n");
			sql.append("			and enable = 1 \n");
			sql.append("			order by postdate desc) b \n");
			sql.append("	   order by r) \n");
			sql.append("where r between ? and ?");
 
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, movieCdYoung);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto review = new BoardDto();
				
				review.setSeq(rs.getInt("seq"));
				review.setUserId(rs.getString("userid"));
				review.setPostDate(rs.getString("postdate"));
				review.setContent(rs.getString("content"));
				review.setStarPoint(rs.getInt("starpoint"));
				
				list.add(review);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 13
	// <선택된 영화 위시리스트 등록 여부 select> 메소드
	// 해당 회원의 위시리스트 등록 여부 확인
	// 이미 등록됨 : 1
	// 등록 안 되어 있음 : 0
	public int selectIsWishedByMovieCdYoung(String movieCdYoung, String id) {

		int isWished = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from mh_wishlist \n");
			sql.append("where userid = ? \n");
			sql.append("and moviecodeyoung = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, movieCdYoung);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				isWished = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return isWished;
	}
	
	// 14
	// <선택된 영화 위시리스트 insert> 메소드
	// 해당 회원의 위시리스트로 등록
	public void insertWishList(String movieCdYoung, String movieCdNaver, String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into mh_wishlist(userid, code, moviecodenaver, moviecodeyoung, postdate) \n");
			sql.append("values(?, 1, ?, ?, sysdate)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, movieCdNaver);
			pstmt.setString(3, movieCdYoung);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}

	
}
