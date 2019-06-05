package com.kitri.service.list;

import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.kitri.dto.FilmDto;

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
	
	
//	#### 제목으로 영화 검색 ####
	static int error = 0;
	
	public List<FilmDto> srchMVbyName(String title) {
		List<FilmDto> list = null;
		
		//1. 영진원 API 조회
			// 검색조건 : 영화제목
			// 검색결과 : 영화제목, 제작연도, 영진원 코드
		
//		url 설정
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";	//영진원 API
		url += "?key=d497cad784b01e0c354d04518c4ddfc7";	//영진원 API 인증키
		url += "&movieNm=%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4%3A+%EC%9D%B8%ED%94%BC%EB%8B%88%ED%8B%B0+%EC%9B%8C";	//영화제목 (어벤져스: 인피니티 워)
		
		BufferedReader in = null;
		String responseY = null;
		// ① HttpUrlConnection 객체 생성 및 세팅
		
		try {
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET"); // 전송방식 설정 (GET)
			con.setConnectTimeout(30000); // 연결 제한시간 30초
			con.setReadTimeout(10000); // 컨텐츠 조회 제한시간 10초
			int responseCode = con.getResponseCode(); // response의 status 코드 얻어옴
			// ② 호출이 정상일 때, 응답 결과 사용
			if (responseCode == 200) {

				Charset charset = Charset.forName("UTF-8");
				in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
				String inputLine;
				StringBuffer sr = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					sr.append(inputLine);
				}
				
				responseY = sr.toString(); // 응답결과 저장
				
//				영진원 API 응답 JSON Parssing
				// JSON 파서 객체 생성
				JSONParser jsonParser = new JSONParser();
				
				// String 타입의 JSON값으로, 가장 큰 JSON 객체 생성
				JSONObject jsonObject = (JSONObject) jsonParser.parse(responseY);
				JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
				JSONArray movieList = (JSONArray) movieListResult.get("movieList");
				list = new ArrayList<FilmDto>();
				
				// dailyBoxOfficeList JSON배열의 값(JSON객체)들 뽑아냄
				int len = movieList.size();
				for (int i = 0; i < len; i++) {
					
					FilmDto filmDto = new FilmDto();
					
					JSONObject filmListItems = (JSONObject) movieList.get(i);
					
					String movieNm = filmListItems.get("movieNm").toString(); 	
					String movieCdYoung = filmListItems.get("movieCd").toString(); 		
					String prdtYear = filmListItems.get("movieCd").toString().substring(0, 4); //8자리 날짜정보에서 연도만 추출
					
					// '영화코드(영진원)', '영화명'을 DTO에 셋팅함
					filmDto.setMovieNm(movieNm);
					filmDto.setMovieCdYoung(movieCdYoung);
					filmDto.setPrdtYear(prdtYear);
					System.out.println("영화제목 : " + movieNm);
					System.out.println("영진원 코드 : " + movieCdYoung);
					System.out.println("제작연도 " + prdtYear + "\n");
					
					// 영화제목, 영진원 코드, 제작연도가 셋팅된 DTO를 list에 담음
					list.add(filmDto);
					
					
				} // for문 end	
				
			} else {
				error++;
				System.out.println("에러횟수 : " + error);
				System.out.println("예외코드 : " + responseCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} // 영진원 API 종료
		
		
		
		
		//2. 네이버 영화 API 조회
			// 검색조건 : 영진원에서 받아온 영화제목, from(제작연도), to(제작연도+1)
			// 검색결과 : 네이버 영화코드
		
		int len = list.size();
		for(int i=0; i<len; i++ ) {
			FilmDto filmDto = list.get(i);
			String paramNm = filmDto.getMovieNm();
			int prdtYear = Integer.parseInt(filmDto.getPrdtYear());
			String responseN = null;
			
//			url 설정
			url = "https://openapi.naver.com/v1/search/movie.json";	//네이버 API
			url += "?query=" + paramNm;	//영화제목 (어벤져스: 인피니티 워)
			url += "&yearfrom=" + prdtYear;	//제작연도(from)
			url += "&yearto=" + (1+prdtYear);	//제작연도(to)
//			url += "&display=1";	//검색 결과 건수
			
			
//			변수 초기화
			in = null;
			
			try {

				// ① HttpUrlConnection 객체 생성 및 세팅
				URL obj = new URL(url);
				HttpURLConnection con = (HttpURLConnection) obj.openConnection();

				con.setRequestMethod("GET"); // 전송방식 설정 (GET)
				con.setConnectTimeout(30000); // 연결 제한시간 30초
				con.setReadTimeout(10000); // 컨텐츠 조회 제한시간 10초
				con.setRequestProperty("X-Naver-Client-Id", "Fc4lGVGl3zDMtizzcZbx");
				con.setRequestProperty("X-Naver-Client-Secret", "q3OgVCUh0y");
					
				int responseCode = con.getResponseCode(); // response의 status 코드 얻어옴
				
				// ② 호출이 정상일 때, 응답 결과 사용
				if (responseCode == 200) {

					Charset charset = Charset.forName("UTF-8");
					in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
					String inputLine;
					StringBuffer sr = new StringBuffer();

					while ((inputLine = in.readLine()) != null) {
						sr.append(inputLine);
					}
					
					responseN = sr.toString(); // 응답결과 저장
					
					// ④ responseNaver (JSON) 파싱
					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObject = (JSONObject) jsonParser.parse(responseN);
					JSONArray imageArray = (JSONArray) jsonObject.get("items");
					
					

					
				} else {
					error++;
					System.out.println("에러횟수 : " + error);
					System.out.println("예외코드 : " + responseCode);
				}

			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(in != null) {
					try {
						in.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} 
		} // 네이버 API 종료
		
		
		
		
		
		
		
		
		
		
//		//3. 고화질 이미지 크롤링
//			// 검색조건 : 이미지 링크 + 네이버 영화코드
//			// 검색결과 : 고화질 이미지 주소
		
		
		
		return list;
	}

	
	public static void main(String[] args) {
		ListService.getListService().srchMVbyName("어벤져스: 인피니티 워");
		
	}
	
	
	//	// #### 제목으로 영화 검색 ####
//	public List<FilmDto> srchMVbyName(String title) {
//		
//		// TODO title 인코딩
//		
//		//1. 영진원 목록조회API이용(영화제목으로 검색)
//		//2. 각 영화제목, 제작연도, 영화코드 받아오기
//		
//		//url 설정
//		String httpUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";
//		httpUrl += "?key=d497cad784b01e0c354d04518c4ddfc7";
//		httpUrl += "&movieNm=" + title;
//		httpUrl += "&itemPerPage=100";
//		List<FilmDto> list = null;
//		String srchResult = CallAPI.APIHttpGet(httpUrl, null);
//		
//		try {
//			// JSON 파서 객체 생성
//			JSONParser jsonParser = new JSONParser();
//			
//			// String 타입의 JSON값으로, 가장 큰 JSON 객체 생성
//			JSONObject jsonObject = (JSONObject) jsonParser.parse(srchResult);
////			JSONObject jsonObject = (JSONObject) jsonParser.parse(srchResult.toString());
//			JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
//			if(jsonObject != null)
//				System.out.println("jsonObject있음");
//			JSONArray movieList = (JSONArray) movieListResult.get("movieList");
//			list = new ArrayList<FilmDto>();
//			// dailyBoxOfficeList JSON배열의 값(JSON객체)들 뽑아냄
//			int len = movieList.size();
//			System.out.println("영진원 결과값 개수 : " + len);
//			for (int i = 0; i < len; i++) {
//				
//				FilmDto filmDto = new FilmDto();
//				
//				JSONObject filmListItems = (JSONObject) movieList.get(i);
//				
//				String movieNm = filmListItems.get("movieNm").toString(); 	
//				String movieCdYoung = filmListItems.get("movieCd").toString(); 		
//				String prdtYear = filmListItems.get("movieCd").toString().substring(0, 4); //8자리 날짜정보에서 연도만 추출
//				
//				// '영화코드(영진원)', '영화명'을 DTO에 세팅함
//				filmDto.setMovieNm(movieNm);
//				filmDto.setMovieCdYoung(movieCdYoung);
//				filmDto.setPrdtYear(prdtYear);
//				System.out.println("영화제목 : " + movieNm);
//				System.out.println("영진원 코드 : " + movieCdYoung);
//				System.out.println("제작연도 " + prdtYear);
//				
//				//네이버 영화검색 API이용
//				//영화제목 + 제작연도 검색
//				//영화 코드 및 이미지 주소
//				FilmDto nAPI = CallAPI.getPoster(movieNm, prdtYear);
//				if(nAPI != null) {
//					System.out.println("영화 이미지 : " + nAPI.getMovieImage());
//					System.out.println("네이버 코드 : " + nAPI.getMovieCdNaver() + "\n");
//					// '포스터 이미지 주소'를 DTO에 세팅함
//					filmDto.setMovieImage(nAPI.getMovieImage());
//					filmDto.setMovieCdNaver(nAPI.getMovieCdNaver());
//					list.add(filmDto);
//				} else {
//					System.out.println("네이버 API오작동");
//				}
//				
//				
//			} // for문 end			
//			
//		} catch (ParseException e) {  	// json 파싱 예외
//			e.printStackTrace();
//			
//		} 
//		
//		return list;
//	}
	
	
}
