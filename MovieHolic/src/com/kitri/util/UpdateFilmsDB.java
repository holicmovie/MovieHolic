package com.kitri.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kitri.dto.FilmDto;

public class UpdateFilmsDB {

	// [메소드]
	
	/**
	 * ---------------------------------- 1 ----------------------------------
	 * <insert into MH_Films> 메소드
	 * 
	 * [인자값]
	 * - String prdtYear : 제작연도
	 */
	public void insertFilms(String prdtYear) {
		
		// TODO
		// db에 insert하는 부분 고치기!! (list에 밑의 변수 넣고, 그걸 모두 insert하게 하기!!!)
				
		List<FilmDto> list = new ArrayList<>();
		
		String movieNm = "";		// 영화제목
		
		// 영화제목, 영화코드(영진원), 제작연도, 개봉연도, 장르
		String httpUrl1 = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
				+ "?key=d497cad784b01e0c354d04518c4ddfc7"
				+ "&itemPerPage=100"
				+ "&prdtStartYear="+prdtYear;
		String responseMovies = CallAPI.APIHttpGet(httpUrl1, false);
		
		// responseBoxOffice (JSON) 파싱
		// *박스오피스 JSON 구조 : { {movieListResult} - [movieList]  - {key1 : "", key2 : "" , ...} 여러 개 }
		try {
			
				JSONParser jsonParser = new JSONParser();
			
				JSONObject jsonObject = (JSONObject) jsonParser.parse(responseMovies);
		
				JSONObject movieListObject = (JSONObject) jsonObject.get("movieListResult");
				JSONArray movieListArray = (JSONArray) movieListObject.get("movieList");
				
				// movieListArray JSON배열의 값(JSON객체)들을 뽑아냄
				int len = movieListArray.size();
				for (int i = 0; i < len; i++) {
					
					FilmDto films = new FilmDto();
					
					JSONObject movieListItems = (JSONObject) movieListArray.get(i);
										
					movieNm = movieListItems.get("movieNm").toString();
					
					films.setMovieNm(movieListItems.get("movieNm").toString());			// 영화명
					films.setMovieCdYoung(movieListItems.get("movieCd").toString()); 	// 영화코드(영진원)
					films.setCategory(movieListItems.get("genreAlt").toString());		// 장르
					
					String openDate = movieListItems.get("openDt").toString();
					System.out.println("개봉일자 : " + openDate);
					if(openDate != " ") {
						films.setOpenYear(openDate.substring(0));						// 개봉연도						
					}else {
						// 개봉을 안 한 경우
						films.setOpenYear("");
					}
					
					FilmDto naverFrlmDto = new FilmDto();
					naverFrlmDto = CallAPI.getPoster(movieNm, prdtYear);
					films.setMovieCdNaver(naverFrlmDto.getMovieCdNaver());				// 영화코드(네이버)
					films.setStarPointNaver(naverFrlmDto.getStarPointNaver());			// 네이버 별점
					films.setMovieImage(naverFrlmDto.getMovieImage());					// 영화 이미지
					
					System.out.println("잘 가져 왔나~ : " + films.getMovieNm() + " 이미지는 : " + films.getMovieImage());
				} // for문 end
		
		
		} catch (ParseException e) {  // json 파싱 예외
				e.printStackTrace();
				
		} // try catch end
			
		
		//////////////////////////////////////// db insert ////////////////////////////////////////
		try {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			con = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into mh_films(movieName, movieCodeYoung, movieCodeNaver, prdtYear,"
										 + " openYear, category, movieImage, starPointNaver) \n");
			sql.append("values(?, ?, ?, ?, ?, ?, ?, ?)");
			
			int idx = 1;
			
			pstmt = con.prepareStatement(sql.toString());
			/*
			 * pstmt.setString(idx++, movieNm); pstmt.setString(idx++, movieCdYoung);
			 * pstmt.setString(idx++, movieCdNaver); pstmt.setString(idx++, prdtYear);
			 * pstmt.setString(idx++, openYear); pstmt.setString(idx++, category);
			 * pstmt.setString(idx++, movieImage); pstmt.setString(idx++, starPointNaver);
			 */
			
			//pstmt.executeUpdate();
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// [메인 실행 메소드]
	public static void main(String[] args) {
		
		UpdateFilmsDB ufdb = new UpdateFilmsDB();
		
		ufdb.insertFilms("2019");
		
	}
	
}
