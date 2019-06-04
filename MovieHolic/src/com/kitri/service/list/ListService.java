package com.kitri.service.list;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

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
	public List<FilmDto> srchMVbyName(String title) {
		
		// TODO title 인코딩
		
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
			JSONObject jsonObject = (JSONObject) jsonParser.parse(srchResult);
//			JSONObject jsonObject = (JSONObject) jsonParser.parse(srchResult.toString());
			JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
			if(jsonObject != null)
				System.out.println("jsonObject있음");
			JSONArray movieList = (JSONArray) movieListResult.get("movieList");
			list = new ArrayList<FilmDto>();
			// dailyBoxOfficeList JSON배열의 값(JSON객체)들 뽑아냄
			int len = movieList.size();
			System.out.println("영진원 결과값 개수 : " + len);
			for (int i = 0; i < len; i++) {
				
				FilmDto filmDto = new FilmDto();
				
				JSONObject filmListItems = (JSONObject) movieList.get(i);
				
				String movieNm = filmListItems.get("movieNm").toString(); 	
				String movieCdYoung = filmListItems.get("movieCd").toString(); 		
				String prdtYear = filmListItems.get("movieCd").toString().substring(0, 4); //8자리 날짜정보에서 연도만 추출
				
				// '영화코드(영진원)', '영화명'을 DTO에 세팅함
				filmDto.setMovieNm(movieNm);
				filmDto.setMovieCdYoung(movieCdYoung);
				filmDto.setPrdtYear(prdtYear);
				System.out.println("영화제목 : " + movieNm);
				System.out.println("영진원 코드 : " + movieCdYoung);
				System.out.println("제작연도 " + prdtYear);
				
				//네이버 영화검색 API이용
				//영화제목 + 제작연도 검색
				//영화 코드 및 이미지 주소
				FilmDto nAPI = CallAPI.getPoster(movieNm, prdtYear);
				if(nAPI != null) {
					System.out.println("영화 이미지 : " + nAPI.getMovieImage());
					System.out.println("네이버 코드 : " + nAPI.getMovieCdNaver() + "\n");
					// '포스터 이미지 주소'를 DTO에 세팅함
					filmDto.setMovieImage(nAPI.getMovieImage());
					filmDto.setMovieCdNaver(nAPI.getMovieCdNaver());
					list.add(filmDto);
				} else {
					System.out.println("네이버 API오작동");
				}
				
				
			} // for문 end			
	
	} catch (ParseException e) {  	// json 파싱 예외
		e.printStackTrace();
		
	} 
		
		return list;
	}
	
//	public static void main(String[] args) {
////		ListService.getListService().srchMVbyName("어벤져스");
//		String name = "어벤져스: 인피니티 워";
//		byte b[];
//		try {
//			b = name.getBytes("utf-8");
//			name = new String(b, "euc-kr");
//			System.out.println(name);
//			String encodeResult = URLEncoder.encode("어벤져스: 인피니티 워", "UTF-8");
//			System.out.println(encodeResult);
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//
//
//		
//	}
	
}
