package com.kitri.service.film;

import java.text.SimpleDateFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kitri.dao.film.FilmDao;
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

		// ------------------------------------------------------- [ index.jsp ] -------------------------------------------------------
		
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
					    FilmDto film = CallAPI.getPoster(movieNm, null);
					    String movieImage = "";
					    if(film != null) {
					    	movieImage = film.getMovieImage();
				    	} else {
				    		movieImage = "/MovieHolic/images/noMovieImage.png";
				    	}

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
		// <장르별 영화 추천 목록 10개 출력> 메소드
		// : 장르별 추천 영화 10개  (네이버 별점순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getFavoriteFilm(String category) {
			
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmsByCategory(category);

		}
		
		
		
		// ------------------------------------------------------- [ moviefilm.jsp ] -------------------------------------------------------

		// 3
		// <주간 인기 영화 목록 출력> 메소드
		// : 주간 인기 영화 목록 결과 (최근 일주일간 리뷰 개수 순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getWeekBestFilmList() {
			
			List<FilmDto> result = new ArrayList<FilmDto>();
			
			// #1 주간 인기 영화 정보를 위해, DAO 호출    *영화명||, 영화코드(영진원)||, 평균별점(무비홀릭)
			List<FilmDto> bestFilm = FilmDao.getFilmDao().selectFilmListByReviewCount();
			
			int len = bestFilm.size();
			for(int i = 0; i < len; i++) {
				
				FilmDto bestItems = new FilmDto();
				
				String movieNm = CallAPI.getOneToken(bestFilm.get(i).getMovieNm());					// 영화명
				String movieCdYoung = CallAPI.getOneToken(bestFilm.get(i).getMovieCdYoung());	// 영화코드(영진원)
				String prdtYear = "";																						// 제작년도
				
				// #2 영진원 영화상세정보 api 호출하여, getPoster()의 인자 중, 제작년도를 구하기
				// url 설정
				String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
				String paramYoung1 = "key=d497cad784b01e0c354d04518c4ddfc7";
				String paramYoung2 = "movieCd="+movieCdYoung;
				
				String httpUrl = url + "?" + paramYoung1 + "&" + paramYoung2;
				
				String filmdetailJSON = CallAPI.APIHttpGet(httpUrl, false);
				
				try {
					// JSON 파싱
					JSONParser jsonParser = new JSONParser();
					
					JSONObject jsonObject = (JSONObject) jsonParser.parse(filmdetailJSON.toString());
					JSONObject movieInfoResult = (JSONObject) jsonObject.get("movieInfoResult");
					JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");
					Object prdtYearObj = (Object) movieInfo.get("prdtYear");
					
					prdtYear = prdtYearObj.toString();			// 제작년도 set
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				// #3 getPoster() 호출하여, 영화 이미지 얻기
				FilmDto image = CallAPI.getPoster(movieNm, prdtYear);
				String movieImage = image.getMovieImage();			// 영화 이미지 주소
				String movieCdNaver = image.getMovieCdNaver(); 	// 영화코드 (네이버)
				String starPointNaver = image.getStarPointNaver();	// 네이버 별점
				
				bestItems.setMovieNm(movieNm);
				bestItems.setMovieCdYoung(movieCdYoung);
				bestItems.setMovieImage(movieImage);
				bestItems.setMovieCdNaver(movieCdNaver);
				bestItems.setStarPointNaver(starPointNaver);
				bestItems.setPrdtYear(prdtYear);
				
				result.add(bestItems);
			}
			
			// #1 DAO 호출
			return result;
		}
		
		
		// 4
		// <총 영화목록 개수 얻기> 메소드
		// : 출력할 영화목록 총 개수
		// *select
		// *return int
		public int getTotalPage(String category) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmCountByCategory(category);
		}
					
		
		// 5
		// <장르별 영화 목록 출력> 메소드
		// : 선택한 장르별 영화 목록 결과 전체 (개봉연도 최신순 & 이름 오름차순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getFilmList(String category, int startRow, int endRow) {
		
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmListByCategory(category, startRow, endRow);
		}	

		
		// 6
		// <영화 검색 목록 출력> 메소드
		// : 검색어로 검색한 영화 목록 결과 전체 (개봉연도 최신순 & 이름 오름차순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getSearchedFilmList(String srchKey, int startRow, int endRow) {
			
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectBySrchKey(srchKey, startRow, endRow);
		}
		
		
		// 7
		// <총 영화 검색 목록 개수 얻기> 메소드
		// : 출력할 검색 목록 총 개수
		// *select
		// *return int
		public int getSearchTotalPage(String srchKey) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmCountBySrchKey(srchKey);
		}
		
		
		
		
		
		// ------------------------------------------------------- [ moviedetail.jsp ] -------------------------------------------------------

		
} // class end
