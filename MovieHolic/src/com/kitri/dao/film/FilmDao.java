package com.kitri.dao.film;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
	
	
	// 1
	// <장르별 추천 영화 10개 select> 메소드
	// 네이버 별점순
	public List<FilmDto> selectByCategory(String category) {
		
		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \n");
			sql.append("from mh_films \n");
			sql.append("where category like '%'||?||'%' \n");
			sql.append("and rownum < 11 \n");
			sql.append("order by starpointnaver desc");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, category);
			
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
	
	
	// 2
	// <장르별 영화 목록 select> 메소드
	// 이름 오름차순
	public List<FilmDto> selectFilm(String category) {
		
		// TODO
		// FilmDao : 장르별 영화 목록 select
		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \\n");
			sql.append("from mh_films \n");
			sql.append("where category like '%'||?||'%' \n");
			sql.append("and rownum < 11 \n");
			sql.append("order by starpointnaver desc");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, category);
			
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
	
	// 3
	// <검색 결과 영화 목록 select> 메소드
	// 개봉연도 최신순 && 이름 오름차순
	public List<FilmDto> selectBySrchKey(String srchKey) {
 
		// TODO
		// FilmDao : 검색 결과 영화 목록 select
		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select movieName, movieCodeYoung, movieCodeNaver, movieImage, category, prdtYear, openYear, starPointNaver \\n");
			sql.append("from mh_films \n");
			sql.append("where movieName like '%'||?||'%'");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, srchKey);
			
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
	
	
	
}
