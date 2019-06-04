package com.kitri.service.list;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kitri.dto.FilmDto;
import com.kitri.util.CallAPI;

public class ListService {

	// #### singleTone ####
	private static ListService listService;
	static {
		listService = new ListService();
	}
	private ListService() {}
	public static ListService getListService() {
		return listService;
	}
	
	
	// #### 제목으로 영화 검색 ####
	public List<FilmDto> srchMVbyTitle(String title) {
		
		//1. 영진원 목록조회API이용(영화제목으로 검색)
		//2. 각 영화제목, 제작연도, 영화코드 받아오기
		
		//url 설정
		String httpUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";
		httpUrl += "?key=d497cad784b01e0c354d04518c4ddfc7";
		httpUrl += "&movieNm=" + title;
		httpUrl += "&itemPerPage=100";
		List<FilmDto> list = null;
		
		String srchResult = CallAPI.APIHttpGet(httpUrl, null);

		
		try {
			// JSON 파서 객체 생성
			JSONParser jsonParser = new JSONParser();
			
			// String 타입의 JSON값으로, 가장 큰 JSON 객체 생성
			JSONObject jsonObject = (JSONObject) jsonParser.parse(srchResult.toString());
	
			JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
			JSONArray movieList = (JSONArray) movieListResult.get("movieList");
			
			list = new ArrayList<FilmDto>();
			// dailyBoxOfficeList JSON배열의 값(JSON객체)들을 뽑아냄
			int len = movieList.size();
			for (int i = 0; i < len; i++) {
				
				FilmDto filmDto = new FilmDto();
				
				JSONObject filmListItems = (JSONObject) movieList.get(i);
				
				String movieNm = filmListItems.get("movieNm").toString(); 	
				String movieCdYoung = filmListItems.get("movieCd").toString(); 		
				String prdtYear = filmListItems.get("movieCd").toString(); 		
				
				// '영화코드(영진원)', '영화명'을 DTO에 세팅함
				filmDto.setMovieNm(movieNm);
				filmDto.setMovieCdYoung(movieCdYoung);
				filmDto.setPrdtYear(prdtYear);
				
				//네이버 영화검색 API이용
				//영화제목 + 제작연도 검색
				//영화 코드 및  
				FilmDto nAPI = CallAPI.getPoster(movieNm, prdtYear);
				
				// '포스터 이미지 주소'를 DTO에 세팅함
				filmDto.setMovieImage(nAPI.getMovieImage());
				filmDto.setMovieCdNaver(nAPI.getMovieCdNaver());
				
				list.add(filmDto);
				
			} // for문 end			
	
	} catch (ParseException e) {  	// json 파싱 예외
		e.printStackTrace();
		
	} 
		
		return list;
	}
}
