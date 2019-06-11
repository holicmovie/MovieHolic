package com.kitri.util;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.StringTokenizer;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kitri.dto.FilmDto;

public class UpdateFilmsDB {

	// [메소드]
	
	/**
	 * ---------------------------------- 1 ----------------------------------
	 * <MH_Films에 넣을 연도별 영화목록 생성> 메소드
	 * 
	 * [인자값]
	 * - String prdtYear 	: 제작연도
	 *
	 * [return]
	 * - List<FilmDto> 객체 	: 영화목록 정보 담은 List
	 *
	 */
	public List<FilmDto> getFilmList(String prdtYear, String curPage) {
		
		// TODO
		// db에 insert하는 부분 고치기!! (list에 밑의 변수 넣고, 그걸 모두 insert하게 하기!!!)
				
		List<FilmDto> list = new ArrayList<>();
		
		String movieNm = "";		// 영화제목
		
		// 영진원 영화목록 조회 API
		String httpUrl1 = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
				+ "?key=d497cad784b01e0c354d04518c4ddfc7"
				+ "&itemPerPage=100"
				+ "&prdtStartYear="+prdtYear + "&curPage="+curPage;
		String responseMovies = CallAPI.APIHttpGet(httpUrl1, false);
		
		System.out.println(responseMovies);
				
		// responseBoxOffice (JSON) 파싱
		// *박스오피스 JSON 구조 : { {movieListResult} - [movieList]  - {key1 : "", key2 : "" , ...} 여러 개 }
		try {

				JSONParser jsonParser = new JSONParser();
			
				JSONObject jsonObject = (JSONObject) jsonParser.parse(responseMovies);
		
				JSONObject movieListObject = (JSONObject) jsonObject.get("movieListResult");
				Object resultCnt = (Object) movieListObject.get("totCnt");						// 결과 개수 (Object)
				JSONArray movieListArray = (JSONArray) movieListObject.get("movieList");
								
				// 페이지에 해당하는 영화 목록이 없으면, null 리턴
				if(resultCnt.toString().equals("0")) {
					System.out.println(curPage + "페이지에 영화 목록이 없습니다.");
					return null;
				}
				// movieListArray JSON배열의 값(JSON객체)들을 뽑아냄
				int len = movieListArray.size();
				for (int i = 0; i < len; i++) {

					FilmDto films = new FilmDto();
					
					JSONObject movieListItems = (JSONObject) movieListArray.get(i);
										
					movieNm = movieListItems.get("movieNm").toString();
					
					films.setMovieNm(movieListItems.get("movieNm").toString());			// 영화명
					films.setMovieCdYoung(movieListItems.get("movieCd").toString()); 	// 영화코드(영진원)
					films.setCategory(movieListItems.get("genreAlt").toString());		// 장르
					films.setPrdtYear(prdtYear); 										// 제작연도
					String openDate = movieListItems.get("openDt").toString();

					// 개봉한 경우
					if(!openDate.equals("")) {
						films.setOpenYear(openDate.substring(0, 4));					// 개봉연도						
					}else {
						// 개봉을 안 한 경우, NULL 로 세팅
						films.setOpenYear(null);
					}
					
					//System.out.println("[네이버 api] 영진원에서 얻은 영화를 네이버에 다시 검색 중 ...");
					FilmDto naverFrlmDto = new FilmDto();
					naverFrlmDto = CallAPI.getPoster(movieNm, prdtYear);
					
					// 네이버 검색결과가 있는 영화인 경우에만 list에 add
					if(naverFrlmDto != null) {
						films.setMovieCdNaver(naverFrlmDto.getMovieCdNaver());				// 영화코드(네이버)
						films.setStarPointNaver(naverFrlmDto.getStarPointNaver());			// 네이버 별점
						films.setMovieImage(naverFrlmDto.getMovieImage());					// 영화 이미지
						
						list.add(films);
					}
					
					System.out.println("getFilmList() / " + (i+1) + "번째 영화명 : " + movieNm);
				
				} // for문 end
		
		
		} catch (ParseException e) {  // json 파싱 예외
				e.printStackTrace();
				
		} // try catch end
			
		return list;
		
	}
	
	
	/**
	 * ---------------------------------- 2 ----------------------------------
	 * <MH_Films insert 실행> 메소드
	 * 
	 * [인자값]
	 * - List<FilmDto> list : DB에 넣을, 영화목록 정보 담은 List
	 * 
	 */
	public void insertFilms(List<FilmDto> list) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into mh_films(movieCodeYoung, movieName, movieCodeNaver, prdtYear,"
					 + " openYear, category, movieImage, starPointNaver) \n");
			sql.append("values(?, ?, ?, ?, ?, ?, ?, ?)");
			
			int idx = 1;
			
			pstmt = conn.prepareStatement(sql.toString());
			
			int len = list.size();
			for(int i = 0; i < len; i++) {
				
				System.out.println(i);
				pstmt.setString(idx++, list.get(i).getMovieCdYoung());
				pstmt.setString(idx++, list.get(i).getMovieNm());
				pstmt.setString(idx++, list.get(i).getMovieCdNaver());
				pstmt.setString(idx++, list.get(i).getPrdtYear());
				pstmt.setString(idx++, list.get(i).getOpenYear());
				pstmt.setString(idx++, list.get(i).getCategory());
				pstmt.setString(idx++, list.get(i).getMovieImage());
				pstmt.setString(idx++, list.get(i).getStarPointNaver());
				
				idx = 1;
				
				pstmt.executeUpdate();
				System.out.println("################# insert 완료 #################");
			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt);
			}
	}
	
	// [메인 실행 메소드]
	public static void main(String[] args) {
		
		UpdateFilmsDB updateDB = new UpdateFilmsDB();
				
		// 현재 년도 구하기
		Calendar c = new GregorianCalendar();
		int year = c.get(Calendar.YEAR);
		
		// 시작 년도
		int startYear = 2016;
		// 구할 기간 (년)
		int term = 3;
		// 끝 년도
		int endYear = startYear - term;
		
		System.out.println("[조회 기간] : " + startYear + "~" + endYear);
		System.out.println("[api 호출 횟수] 영진원 영화 목록 조회 api : " + (term * 50) + "번 호출 예정 (페이지 없을 시 감소 가능)");
		System.out.println("[api 호출 횟수] 네이버 영화 목록 조회 api : " + (term * 50 * 100) + "번 호출 예정");
		System.out.println("[api 호출 준비] 5초 뒤에 작업을 시작합니다! 5초안에 작업을 취소해주세요");
				
		CallAPI.Sleep(5000); // 5초 쉴 동안 취소할려면 취소하기
		
		////////////////////////////////// 영진원 영화목록 년도별 50페이지씩 조회 ////////////////////////////////////////
		//for(int y = startYear; y > endYear; y--) {
			String y = "2013";
			// 50페이지 조회
			for(int p = 1; p < 51; p++) {
				
				System.out.println("[영진원 api] " + y + "년 영화 목록 100개 검색 중 ... (" + p + "페이지)");
				
				// 연도별 영화 목록 생성
				List<FilmDto> list = updateDB.getFilmList(String.valueOf(y), String.valueOf(p));
				
				if(list != null) {
					System.out.println("[영진원 api] " + y + "년 영화 목록 100개 검색 완료 (" + p + "페이지)");
					
					int len = list.size();
					System.out.println("[네이버 api] " + y + "년 네이버 검색 유효 개수 : " + len);
					
					// DB에 영화 목록 삽입
					updateDB.insertFilms(list);
					
				} else {
					// 해당 페이지에 영화목록이 없는 경우, for문 종료 (다음 년도로 넘어감)
					System.out.println("#################" + y + "년의 마지막 페이지 : " + (p-1) + "페이지 #################");
					break;
				}
			//}
			
		
		}
		
		
	}
	
}
