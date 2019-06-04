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
		// <일별 박스 오피스 영화 출력> 메소드
		// : 영진원 일별 박스오피스 api + 네이버 이미지 검색 api
		public List<FilmDto> getBoxOffice() {
			
			List<FilmDto> box = new ArrayList<>();
			
			// #1 API 호출

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
			String responseBoxOffice = CallAPI.APIHttpGet(httpUrl, null);  		// HttpUrlConnection 사용
			//String responseBoxOffice = CallAPI.APIHttpClientGet(httpUrl, null);  // HttpClient 라이브러리 사용

			// ③ responseBoxOffice (JSON) 파싱
			// *박스오피스 JSON 구조 : { {boxOfficeResult} - [dailyBoxOfficeList] - {key1 : "", key2 : "" , ...} 여러 개 }
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
						
						String movieCdYoung = dailyListItems.get("movieCd").toString(); 	// 영화코드(영진원)
						String movieNm = dailyListItems.get("movieNm").toString(); 			// 영화명
						
						// '영화코드(영진원)', '영화명'을 DTO에 세팅함
						filmDto.setMovieCdYoung(movieCdYoung);
						filmDto.setMovieNm(movieNm);
						
						
						// 1-2. 네이버 영화 목록 검색 API + 크롤링
					    String movieImage = CallAPI.getPoster(movieNm, null).getMovieImage();

						// '포스터 이미지 주소'를 DTO에 세팅함
						filmDto.setMovieImage(movieImage);
						
			// #2 API를 통해 얻은 값(영화명, 영화코드, 포스터 이미지 주소)을 box에 세팅
						box.add(filmDto);
						
					} // for문 end			
			
			} catch (ParseException e) {  	// json 파싱 예외
				e.printStackTrace();
				
			}   // try catch end

		// #3 box 리턴
		return box;
		
		}  // getBoxOffice() end
	
		
		// 2
		// <장르별 영화 목록 출력> 메소드
		// : 영진원 영화 목록 api
		public List<FilmDto> getFavoriteFilm(String genre) {
				List<FilmDto> film = new ArrayList<>();
			
				// #1 API 호출

				// 1. 영진원 영화 목록 API
				// ① url + 파라미터 값 설정
				String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";
				String paramYoung1 = "key=d497cad784b01e0c354d04518c4ddfc7";
				String paramYoung2 = "itemPerPage=100";	// 랜덤 영화 200개 호출
				String paramYoung3 = "openStartDt=2019";	// 2019년 개봉작
	
				String httpUrl = url + "?" + paramYoung1 + "&" + paramYoung2 + "&" + paramYoung3;
	
				// ② API 호출 (GET)
				String responseMovies = CallAPI.APIHttpGet(httpUrl, false);
				
				// ③ responseMovies (JSON) 파싱
				// *영화목록 JSON 구조 : { {movieListResult} - [movieList]  - {key1 : "", key2 : "" , ...} 여러 개 }
				try {
					
						JSONParser jsonParser = new JSONParser();
					
						JSONObject jsonObject = (JSONObject) jsonParser.parse(responseMovies);
				
						JSONObject movieListObject = (JSONObject) jsonObject.get("movieListResult");
						JSONArray movieListArray = (JSONArray) movieListObject.get("movieList");
						
						// movieListArray JSON배열의 값(JSON객체)들을 뽑아냄
						int len = movieListArray.size();
						for (int i = 0; i < len; i++) {
							
							JSONObject movieListItems = (JSONObject) movieListArray.get(i);
							
							String movieCdYoung = movieListItems.get("movieCd").toString(); 		// 영화코드(영진원)
							String movieNm = movieListItems.get("movieNm").toString(); 				// 영화명
							String genreAlt = movieListItems.get("genreAlt").toString();			// 장르 (ex: 범죄,스릴러)
							String prdtYear = movieListItems.get("prdtYear").toString();		// 제작년도
							
							List genres = new ArrayList();
							
							// 장르가 여러 개일 경우,
							if(genreAlt.contains(",")) {
								StringTokenizer st = new StringTokenizer(genreAlt, ",");
								for(int j = 0; j < st.countTokens(); j ++)
									genres.add(st.nextToken());
							} else {
								// 장르가 하나일 경우,
								genres.add(genreAlt);								
							}
							
							// 인자값의 장르와 일치하는 것만 film에 추가
							int glen = genres.size();
							for(int k = 0; k < glen; k++) {
								
								if(genre.equals(genres.get(k).toString())) {
									
									String movieImage = CallAPI.getPoster(movieNm, prdtYear).getMovieImage();
									
									FilmDto filmDto = new FilmDto();
									
									// '영화코드(영진원)', '영화명', '첫번째장르'를 DTO에 세팅함
									filmDto.setMovieCdYoung(movieCdYoung);
									filmDto.setMovieNm(movieNm);
									filmDto.setCategory(genres.get(k).toString());
									filmDto.setMovieImage(movieImage);
									
									film.add(filmDto);
								}

							} // for문 end
																	
						} // for문 end
				
				
				} catch (ParseException e) {  // json 파싱 예외
						e.printStackTrace();
						
				} // try catch end
		
				return film;

		} //  getFavoriteFilm() end
		
		
} // class end
