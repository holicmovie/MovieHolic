package com.kitri.service.film;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kitri.dto.FilmDto;
import com.kitri.util.CallAPI;

public class FilmService {

		// [싱글톤 패턴 객체]
		private static FilmService filmService;
		static {
			filmService = new FilmService();
		}
		public static FilmService getFilmService() {
			return filmService;
		}
		private FilmService() {
		}

		
		// [메소드]

		// 1
		// <일별 박스 오피스 영화 목록 출력> 메소드
		// : 영진원 일별 박스오피스 api + 네이버 이미지 검색 api
		public List<FilmDto> getBoxOffice() {
			
			List<FilmDto> box = new ArrayList<>();
			
			// #1 API 호출 (HttpUrlConnection)

			// 1-1. 영진원 일별 박스오피스 API
			// ① url + 파라미터 값 설정
			
			// 어제 날짜 구하기
			Calendar c1 = new GregorianCalendar();
			c1.add(Calendar.DATE, -1); // 어제날짜 (박스오피스 기준 날짜)
			SimpleDateFormat f = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 
			String yesterday = f.format(c1.getTime()); // String으로 저장
			
			// url 설정
			String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
			String paramYoung1 = "key=d497cad784b01e0c354d04518c4ddfc7";
			String paramYoung2 = "targetDt="+yesterday;

			String httpUrl = url + "?" + paramYoung1 + "&" + paramYoung2;

			// ② API 호출 (GET)
			String responseBoxOffice = CallAPI.APIHttpGet(httpUrl, null);

			// ③ responseBoxOffice (JSON) 파싱
			// *박스오피스 JSON 구조 : { {boxOfficeResult} - [dailyBoxOfficeList] 여러 개 - {key1 : "", key2 : "" , ...} }
			try {
				
					// JSON 파서 객체 생성
					JSONParser jsonParser = new JSONParser();
					
					// String 타입의 JSON값으로, 가장 큰 JSON 객체 생성
					JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBoxOffice.toString());
			
					// dailyBoxOfficeList JSON배열 추출
					JSONObject boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
					JSONArray dailyBoxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
					
					// dailyBoxOfficeList JSON배열의 값(JSON객체)들을 뽑아냄
					int len = dailyBoxOfficeList.size();
					for (int i = 0; i < len; i++) {
						
						FilmDto filmDto = new FilmDto();
						
						JSONObject dailyListItems = (JSONObject) dailyBoxOfficeList.get(i);
						
						String movieCdYoung = dailyListItems.get("movieCd").toString(); 		// 영화코드(영진원)
						String movieNm = dailyListItems.get("movieNm").toString(); 			// 영화명
						
						// '영화코드(영진원)', '영화명'을 DTO에 세팅함
						filmDto.setMovieCdYoung(movieCdYoung);
						filmDto.setMovieNm(movieNm);
						
						
			// 1-2. 네이버 영화 목록 검색 API
						
						// ① url + 파라미터 값 설정
						String url2 = "https://openapi.naver.com/v1/search/movie.json";			// API 호출 URL
						String search = URLEncoder.encode(movieNm, "UTF-8");				     	// 파라미터값 (UTF-8인코딩 필수)
						String paramNaver = "query=" + search + "&display=1";

						String httpUrl2 = url2 + "?" + paramNaver;									   // 최종 URL
						
						// ② 헤더값 생성
						HashMap<String, String> header = new HashMap<>();
						header.put("X-Naver-Client-Id", "Fc4lGVGl3zDMtizzcZbx");
						header.put("X-Naver-Client-Secret", "q3OgVCUh0y");
						
						// ③ API 호출 (GET)
						String responseNaver = CallAPI.APIHttpGet(httpUrl2, header);
						
						// ④ responseNaver (JSON) 파싱
						JSONParser jsonParser2 = new JSONParser();
						
						JSONObject jsonObject2 = (JSONObject) jsonParser.parse(responseNaver);
				
						JSONArray imageArray = (JSONArray) jsonObject2.get("items");
						
						int len2 = imageArray.size();
						for (int j = 0; j < len2; j++) {
							
							JSONObject imageArrayItems = (JSONObject) imageArray.get(j);
							
							// movieImageUrl = 검색결과의 이미지 주소
							String movieImageUrl = (String) imageArrayItems.get("link");   
							
							// HighImageUrl = 고화질 포스터 이미지 주소
					        String HighImageUrl = CallAPI.getPoster(movieImageUrl);

							// '포스터 이미지 주소'를 DTO에 세팅함
							filmDto.setMovieImage(HighImageUrl);
						}
						
	    // #2 API를 통해 얻은 값(영화명, 영화코드, 포스터 이미지 주소)을 box에 세팅
						box.add(filmDto);
						
					} // for문 end
			
			} catch (ParseException e) {  						// json 파싱 예외
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) { // naver 검색어 encoding 예외
				e.printStackTrace();
			}   // try catch end

			
		// #3 box 리턴
		return box;
		}
	
}
