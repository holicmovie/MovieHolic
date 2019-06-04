package com.kitri.dao.film;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.kitri.dto.FilmDto;
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
	
	public List<FilmDto> selectByCategory(String category) {
		
		List<FilmDto> list = new ArrayList<FilmDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		
		try {
			
			conn = DBConnection.makeConnection();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
}
