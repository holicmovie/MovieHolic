package com.kitri.service.film;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.kitri.dao.film.FilmDao;
import com.kitri.dto.BoardDto;
import com.kitri.dto.FilmDetailDto;
import com.kitri.dto.FilmDto;
import com.kitri.service.list.ListService;
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
					    	filmDto.setMovieCdNaver(film.getMovieCdNaver());
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
		// <회원 선호 장르별 영화 추천 목록 10개 출력> 메소드
		// : 장르별 추천 영화 10개  (네이버 별점순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getFavoriteFilm(String userId, int rank) {
			
			// #1 선호 장르 얻기
			String category = FilmDao.getFilmDao().selectFavoriteCategory(userId, rank);
			// #2  장르별 추천영화 목록 얻기
			return FilmDao.getFilmDao().selectFilmsByCategory(category);

		}
		
		// 3
		// <최신 영화 목록 10개 출력> 메소드
		// *select
		// *return List<FilmDto>
		public List<FilmDto> getLatestFilm() {
			
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectLatestFilm();
		}
		
		// 4
		// <별점 높은 영화 목록 10개 출력> 메소드
		// *select
		// *return List<FilmDto>
		public List<FilmDto> getBestStarFilm() {
			
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectBestStarFilm();
		}
		
		
		
		// ------------------------------------------------------- [ moviefilm.jsp ] -------------------------------------------------------

		// 5
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
				
				String movieNm = CallAPI.getOneToken(bestFilm.get(i).getMovieNm());				// 영화명
				String movieCdYoung = CallAPI.getOneToken(bestFilm.get(i).getMovieCdYoung());	// 영화코드(영진원)
				String prdtYear = "";															// 제작년도
				
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
					
					prdtYear = prdtYearObj.toString();			// 제작년도 get
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				// #3 getPoster() 호출하여, 영화 이미지 얻기
				FilmDto image = CallAPI.getPoster(movieNm, prdtYear);
				String movieImage = image.getMovieImage();			// 영화 이미지 주소
				String movieCdNaver = image.getMovieCdNaver(); 		// 영화코드 (네이버)
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
		
		
		// 6
		// <총 영화목록 개수 얻기> 메소드
		// : 출력할 영화목록 총 개수
		// *select
		// *return int
		public int getTotalPage(String category) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmCountByCategory(category);
		}
					
		
		// 7
		// <장르별 영화 목록 출력> 메소드
		// : 선택한 장르별 영화 목록 결과 전체 (개봉연도 최신순 & 이름 오름차순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getFilmList(String category, int startRow, int endRow) {
		
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmListByCategory(category, startRow, endRow);
		}	

		
		// 8
		// <영화 검색 목록 출력> 메소드
		// : 검색어로 검색한 영화 목록 결과 전체 (개봉연도 최신순 & 이름 오름차순)
		//   * select
		//   * return List<FilmDto>
		public List<FilmDto> getSearchedFilmList(String srchKey, int startRow, int endRow) {
			
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectBySrchKey(srchKey, startRow, endRow);
		}
		
		
		// 9
		// <총 영화 검색 목록 개수 얻기> 메소드
		// : 출력할 검색 목록 총 개수
		// *select
		// *return int
		public int getSearchTotalPage(String srchKey) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectFilmCountBySrchKey(srchKey);
		}
		
				
		
		// ------------------------------------------------------- [ moviedetail.jsp ] -------------------------------------------------------

		// 10
		// <선택된 영화 상세정보 얻기> 메소드
		// : 영진원 영화 상세정보 api + 네이버 검색 크롤링(인물사진)
		public FilmDetailDto getFilmInfo(String movieCdYoung, String movieCdNaver) {

			FilmDetailDto result = new FilmDetailDto();
			
			// #1 API 호출

			// 1-1. 영진원 영화 상세정보 API
			// ① url + 파라미터 값 설정
			String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
			String paramYoung1 = "key=d497cad784b01e0c354d04518c4ddfc7";
			String paramYoung2 = "movieCd="+movieCdYoung;

			String httpUrl = url + "?" + paramYoung1 + "&" + paramYoung2;

			// ② API 호출 (GET)
			String responseFilmInfo = CallAPI.APIHttpGet(httpUrl, false);
			
			// ③ movieInfoResult (JSON) 파싱
			// *movieInfoResult JSON 구조 : { {movieInfoResult} - {movieInfo} - key1 : "" 여러 개 }
			try {
							
					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObject = (JSONObject) jsonParser.parse(responseFilmInfo.toString());
						
					JSONObject movieInfoResult = (JSONObject) jsonObject.get("movieInfoResult");
					JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");
					
					JSONArray nations = (JSONArray) movieInfo.get("nations");			// 제작국가
					JSONArray genres = (JSONArray) movieInfo.get("genres");				// 장르
					JSONArray directors = (JSONArray) movieInfo.get("directors");		// 감독
					JSONArray actors = (JSONArray) movieInfo.get("actors");				// 배우
					JSONArray companys = (JSONArray) movieInfo.get("companys");			// 제작사
					JSONArray audits = (JSONArray) movieInfo.get("audits"); 			// 관람등급

					// ④ DTO 세팅
					// # FilmDto set
					
					// 영화 한글명 set
					String movieNm = movieInfo.get("movieNm").toString();
					result.setMovieNm(movieNm);
					// 제작년도 set
					String prdtYear = movieInfo.get("prdtYear").toString();
					result.setPrdtYear(prdtYear);
					// 영화코드(영진원) set
					result.setMovieCdYoung(movieCdYoung);
					// 개봉년도 set
					String OpenDate = movieInfo.get("openDt").toString();
					if(!"".equals(OpenDate)) {
						result.setOpenYear(movieInfo.get("openDt").toString().substring(0, 4));						
					}
					// 장르 1개 set
					JSONObject genre = (JSONObject) genres.get(0);
					result.setCategory(genre.get("genreNm").toString());

					// # getImgURL() 호출하여, 영화 이미지 얻기
					String movieImage = ListService.getListService().getImgURL(movieCdNaver);
					if(movieImage == null) {
						movieImage = "/MovieHolic/images/noMovieImage.png";
					}
//					FilmDto image = CallAPI.getPoster(movieNm, prdtYear);
//					String movieImage = image.getMovieImage();			// 영화 이미지 주소
//					String movieCdNaver = image.getMovieCdNaver(); 		// 영화코드 (네이버)
//					String starPointNaver = image.getStarPointNaver();	// 네이버 별점
					// 영화 포스터 이미지 주소 set
					result.setMovieImage(movieImage);
					// 영화코드(네이버) set
					result.setMovieCdNaver(movieCdNaver);
					
					// # FilmDetailDto set
					// 영화 영문명 set
					result.setMovieNmEn(movieInfo.get("movieNmEn").toString());
					// 개봉날짜 set
					result.setOpenDt(movieInfo.get("openDt").toString());
					// 상영시간 set
					result.setShowTm(movieInfo.get("showTm").toString());

					// 제작국가 set
					String nationNms = "";
					int nlen = nations.size();
					if(nlen==1) {
						JSONObject nation = (JSONObject) nations.get(0);
						result.setNations(nation.get("nationNm").toString());												
					} else {
						for(int i = 0; i < nlen; i++ ) {
							JSONObject nation = (JSONObject) nations.get(i);
							nationNms += nation.get("nationNm");
							if(i!=nlen) {
								nationNms += ", ";
							}
						}
						result.setNations(nationNms);												
					}
					
					// 감독 1명 set
					String directorNm = "";
					if(!directors.isEmpty()) {
						JSONObject director = (JSONObject) directors.get(0);
						directorNm = director.get("peopleNm").toString();
						result.setDirectors(directorNm);						
					}
					
					// 배우 2명 set             *DB insert용
					int alen = actors.size();
					if(alen>0) {
						JSONObject actor1 = (JSONObject) actors.get(0);
						result.setActor1(actor1.get("peopleNm").toString());												
					}
					if(alen>1) {
						JSONObject actor2 = (JSONObject) actors.get(1);
						result.setActor2(actor2.get("peopleNm").toString());
					} 
					
					// 제작사 1개 set
					int clen = companys.size();
					if(clen>0) {
						JSONObject company = (JSONObject) companys.get(0);
						result.setCompanyNm(company.get("companyNm").toString());						
					}
					
					// 관람등급 set
					int aulen = audits.size();
					if(aulen>0) {
						JSONObject audit = (JSONObject) audits.get(0);
						result.setWatchGradeNm(audit.get("watchGradeNm").toString());
					}
					
					// # 영화 상세정보 뿌리기용 정보받기
					// 배우 전체 set            *영화 상세정보 뿌리기용
					String[] actorArray = new String[alen];
					for(int i = 0; i < alen; i++) {
						JSONObject actor = (JSONObject) actors.get(i);
						actorArray[i] = actor.get("peopleNm").toString();
					}
					result.setActors(actorArray);
					
					// 배우 전체 사진 set (최대 8명까지만)
					String[] actorImageArray = new String[alen];
					if(alen < 8) {
						for(int i = 0; i < alen; i++) {
							// 네이버 검색결과의 인물 사진 주소를 크롤링
							String searchActorNm = URLEncoder.encode("배우 " + actorArray[i], "UTF-8");
					        String connUrl = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+searchActorNm;
					        
							Document doc = Jsoup.connect(connUrl).get();
							Elements imgtag = doc.select("div.cont_noline div.profile_wrap div.big_thumb img");
							System.out.println(imgtag);
							if(!imgtag.isEmpty()) {			
									actorImageArray[i] = imgtag.get(0).attr("src").toString();
							} else {
								// 없을 경우 기본 이미지 세팅
								actorImageArray[i] = "/MovieHolic/images/noProfile.png";
							}
						}
					} else {
						for(int i = 0; i < 8; i ++) {
							// 네이버 검색결과의 인물 사진 주소를 크롤링
							String searchActorNm = URLEncoder.encode("배우 " + actorArray[i], "UTF-8");
					        String connUrl = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+searchActorNm;
					        
							Document doc = Jsoup.connect(connUrl).get();
							Elements imgtag = doc.select("div.cont_noline div.profile_wrap div.big_thumb img");
							System.out.println(imgtag);
							if(!imgtag.isEmpty()) {			
									actorImageArray[i] = imgtag.get(0).attr("src").toString();
							} else {
								// 없을 경우 기본 이미지 세팅
								actorImageArray[i] = "/MovieHolic/images/noProfile.png";
							}
						}
					}
					result.setActorImages(actorImageArray);
					
					// 감독 사진 set
					// 네이버 검색결과의 인물 사진 주소를 크롤링
					String searchDirectorNm = URLEncoder.encode("감독 " + directorNm, "UTF-8");
			        String connUrl = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+searchDirectorNm;
			        
					Document doc = Jsoup.connect(connUrl).get();
					Elements imgtag = doc.select("div.cont_noline div.profile_wrap div.big_thumb img");
					if(!imgtag.isEmpty()) {			
							result.setDirectorImage(imgtag.get(0).attr("src").toString());
							System.out.println("감독 이미지 주소 : " + result.getDirectorImage() );	
					} else {
						// 없을 경우 기본 이미지 세팅
						result.setDirectorImage("/MovieHolic/images/noProfile.png");						
					}
					
					// 예고편용 videoId set
					String searchMovieNm = URLEncoder.encode(movieNm+" 예고편", "UTF-8");
					// 키1
					//String Vurl = "https://www.googleapis.com/youtube/v3/search?part=id&q=" + searchMovieNm + "&key=AIzaSyCzuMQplzlYo-nYc_Yicoay5qY6eNdCTZA&maxResults=1";
					// 키2
					String Vurl = "https://www.googleapis.com/youtube/v3/search?part=id&q=" + searchMovieNm + "&key=AIzaSyBUHR8OuV61Cl8iEk02sDEyjKJ_YsHmaSc&maxResults=1";
					String responseYoutube = CallAPI.APIHttpGet(Vurl, false);
					if(responseYoutube!=null) {
						JSONObject jsonObject2 = (JSONObject) jsonParser.parse(responseYoutube.toString());
						JSONArray items = (JSONArray) jsonObject2.get("items");
						if(!items.isEmpty()) {
							JSONObject item = (JSONObject) items.get(0);
							JSONObject id = (JSONObject) item.get("id");
							if(!id.isEmpty()) {
								if(id.get("videoId")!=null) {
									String videoId = id.get("videoId").toString();								
									result.setVideoId(videoId);							
								}
							}
						}
					}
					System.out.println("S : 세팅된 영화 상세 정보 : " + result);
					System.out.println("S : 세팅된 영화 이미지 주소 : " + result.getMovieImage());
							
						
			} catch (ParseException e) {  	// json 파싱 예외
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {    //encode 예외
				e.printStackTrace();
			} catch (IOException e1) { // 크롤링 예외
				e1.printStackTrace();
			} 
			
			return result;
		}
		
		// 11
		// <선택된 영화 별점 얻기> 메소드
		//  *select
		//  *return int
		public int getStarPoint(String movieCdYoung) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectByMovieCdYoung(movieCdYoung);
		}
		
		// 12
		// <선택된 영화 리뷰 개수 얻기> 메소드
		// *select
		// *return int
		public int getReviewTotalPage(String movieCdYoung) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectReviewCountByMovieCdYoung(movieCdYoung);
		}
				
		// 13
		// <선택된 영화 리뷰 얻기> 메소드
		// *select
		// *return BoardDto
		public List<BoardDto> getReviews(String movieCdYoung, int startRow, int endRow) {
			
			// #1 DAO 호출
			return FilmDao.getFilmDao().selectReviewsByMovieCdYoung(movieCdYoung, startRow, endRow);
		}
		
		// 14
		// <선택된 영화 위시리스트 등록 여부 얻기> 메소드
		// *select
		// *return int
		public int isWished(String movieCdYoung, String id) {

			// #1 DAO 호출
			return FilmDao.getFilmDao().selectIsWishedByMovieCdYoung(movieCdYoung, id);
		}
		
		// 15
		// <위시리스트 등록> 메소드
		// *insert
		// *return String
		public void insertWishList(String movieCdYoung, String movieCdNaver, String id) {

			// #1 DAO 호출
			FilmDao.getFilmDao().insertWishList(movieCdYoung, movieCdNaver, id);
		}
		
		
		
} // class end
