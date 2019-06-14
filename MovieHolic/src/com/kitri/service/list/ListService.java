package com.kitri.service.list;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.kitri.dao.list.ListDao;
import com.kitri.dto.BoardDto;
import com.kitri.dto.CommentDto;
import com.kitri.dto.FilmDetailDto;
import com.kitri.dto.FilmDto;
import com.kitri.dto.UserDto;
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
	
	
	
//------------------------------------------------------------------------------------------- List 작성	

//	#### 제목으로 영화 검색 ####
	public List<FilmDetailDto> srchMVbyName(String title) {
		List<FilmDetailDto> list = new ArrayList<FilmDetailDto>();
		
		// 1. 영진원 API 조회
		List<FilmDetailDto> listAPI = yAPI(title);

		if(listAPI != null) {
			int len = listAPI.size();
			for(int i=0; i<len; i++) {	//영진원 결과 갯수만큼 반복
				
				FilmDetailDto filmDto = listAPI.get(i);
				String movieNm = filmDto.getMovieNm();
				String prdtYear = filmDto.getPrdtYear();
				String director = filmDto.getDirectors();
				
//				System.out.println("영화제목 : " + filmDto.getMovieNm());
//				System.out.println("제작연도 : " + filmDto.getPrdtYear());
//				System.out.println("감독이름 : " + filmDto.getDirectors());
//				System.out.println("영진원 코드 : " + filmDto.getMovieCdYoung());
				
				if(!"".equals(director)) {
					director = filmDto.getDirectors();
				}
				
				// 2. 네이버 영화 API 조회해서 DTO에 set
				if(!"".equals(prdtYear)) {
					String movieCdNaver = nAPI(movieNm, prdtYear, director);	//네이버 영화코드
					
					if(movieCdNaver != null) {
						
						filmDto.setMovieCdNaver(movieCdNaver);	 // DTO에 set
						
						// 3. 고화질 이미지 크롤링
						String movieImage = getImgURL(movieCdNaver);
						filmDto.setMovieImage(movieImage);
						
						list.add(filmDto);
					} // if문 종료
				
				} // if문 종료(제작연도)
				
			} // for문 종료
		} // if문 종료
		return list;
	}
	
	
	
//	#### 작성한 List DB에 insert ####
	public int saveList(BoardDto board) {
		int result = 0;
		result = ListDao.getListDao().saveList(board);
		return result;
	}
	
	
	
	
//------------------------------------------------------------------------------------------- ListDetail 조회	
	
	

//	#### 조회수 올리고 게시판 내용 가져오기  ####
	public BoardDto selBoardBySeq(String seq) {
		BoardDto board= null;
			
		List<BoardDto> boardList = ListDao.getListDao().selBoardBySeq(seq, true, null, null);
		if(boardList == null) {
			return null;
		}
		board = boardList.get(0);
		return board;
	}
	

	
//	#### 댓글 내용 가져오기 ####
	public List<CommentDto> selCommentBySeq(String seq, boolean flag) {
		List<CommentDto> comment = ListDao.getListDao().selCommentBySeq(seq, flag);
		return comment;
	}
	
	
	
//	#### 프로필 사진 select ####
	public List<UserDto> selProfileById(BoardDto board, List<CommentDto> comment) {
		List<UserDto> user = new ArrayList<UserDto>();
		UserDto temp = null;
		
		if(board != null) {
//			1. list 작성자 프로필
			temp = ListDao.getListDao().selProfileById(board.getUserId());
			if(temp != null) {
				user.add(temp);
			} else {
				return user;
			}
		}
		
//		2. 댓글 작성자 프로필
		int len = comment.size();
		for(int i=0; i<len; i++) {
			String id = comment.get(i).getUserId();
			temp = ListDao.getListDao().selProfileById(id);
			if(temp != null) {
				user.add(temp);
			}
		} // for문 종료
		return user;
	}
	
	
//	#### 영화 이미지 가져오기 (영화 갯수만큼)####
	public List<FilmDto> getMvImg(BoardDto board) {
		List<FilmDto> filmList = new ArrayList<FilmDto>();
		
		List<String> naverList = board.getMovieCodeNaver();
		int len = naverList.size();
		for(int i=0; i<len; i++) {
			FilmDto temp = new FilmDetailDto();

			String naver = naverList.get(i);
			temp.setMovieImage(ListService.getListService().getImgURL(naver));
			temp.setMovieCdNaver(naver);
			temp.setMovieCdYoung(board.getMovieCodeYoung().get(i));
			temp.setMovieNm(board.getMovieName().get(i));
			
			filmList.add(temp);
		}
		
		return filmList;
	}
	
	
//	#### 영화 이미지 가져오기 (cnt 만큼)####
	public List<FilmDto> getMvImg(BoardDto board, int cnt) {
		List<FilmDto> filmList = new ArrayList<FilmDto>();
		
		List<String> naverList = board.getMovieCodeNaver();
		for(int i=0; i<cnt; i++) {
			FilmDto temp = new FilmDetailDto();
			
			String naver = naverList.get(i);
			temp.setMovieImage(ListService.getListService().getImgURL(naver));
			temp.setMovieCdNaver(naver);
			temp.setMovieCdYoung(board.getMovieCodeYoung().get(i));
			temp.setMovieNm(board.getMovieName().get(i));
			
			filmList.add(temp);
		}
		
		return filmList;
	}

	
	
//	----------------------------------------------------------------------------------------- List 수정/삭제
	
//	#### 게시판 내용만 가져오기 ####
	public List<BoardDto> selListBySeq(String seq, String id, String srchStr) {
		return ListDao.getListDao().selBoardBySeq(seq, false, id, srchStr);
	}
	
	
//	#### list 수정 ####
	public int modifyList(BoardDto board) {
		int result = 0;
		result = ListDao.getListDao().modifyList(board);
		return result;
	}
	
//	#### list 삭제 ####
	public int deleteList(String seq, String postDate, int cnt, String id) {
		return ListDao.getListDao().deleteList(seq, postDate, cnt, id);
	}
	
	
	
//-----------------------------------------------------------------------------------------------List 부가기능
	
	
	
	
//	#### list 좋아요&싫어요 update ####
	public int evaluate(String btnStr, String seq, String id) {
		return ListDao.getListDao().evaluate(btnStr, seq, id);
	}
	
	
//	#### list 신고 ####
	public int notify(String seq) {
		return ListDao.getListDao().notify(seq);
	}
	
	
	
	
//------------------------------------------------------------------------------------------------------------------------------------- Comment
	
	
//	#### 댓글 저장 ####
	public int saveComment(String id, String seq, String content, String subject, String writerId) {
		return ListDao.getListDao().saveComment(id, seq, content, subject, writerId);
	}
	
	
//	#### 댓글 삭제 ####
	public int delComment(String id, String postDate) {
		return ListDao.getListDao().delComment(id, postDate);
	}
	
	
//	#### 댓글 수정 ####
	public String modCommment(String id, String postDate) {
		return ListDao.getListDao().modCommment(id, postDate);
	}
	
	
	
//	#### 댓글 수정  완료 ####
	public int updateComment(String content, String postDate, String id) {
		return ListDao.getListDao().updateComment(content, postDate, id);
	}
	
//	----------------------------------------------------------------------------------------- Util
	
//	#### 영진원 API (영화 제목 검색어로 검색) ####
	public List<FilmDetailDto> yAPI(String title) {	
		List<FilmDetailDto> list = null;
		
		// 검색조건 : 영화제목
		// 검색결과 : 영화제목, 제작연도, 영진원 코드
		
		// 변수선언
		BufferedReader in = null;
		String response = null;
		String url = null;
		
		// 1. url 설정
		
		String search;
		try {
			search = URLEncoder.encode(title, "UTF-8");
			url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";	//영진원 API
			url += "?key=d497cad784b01e0c354d04518c4ddfc7";	//영진원 API 인증키
			url += "&itemPerPage=100";
			url += "&movieNm=" + search;	//영화제목
			
			// ① HttpUrlConnection 객체 생성 및 세팅
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET"); // 전송방식 설정 (GET)
			con.setConnectTimeout(30000); // 연결 제한시간 30초
			con.setReadTimeout(10000); // 컨텐츠 조회 제한시간 10초
			int responseCode = con.getResponseCode(); // response의 status 코드 얻어옴
			
			// ② 호출이 정상일 때, 응답 결과 사용
			if (responseCode == 200) {
				
				in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				String inputLine = null;
				StringBuffer buf = new StringBuffer();
				
				while ((inputLine = in.readLine()) != null) { // 응답결과의 마지막 라인까지 읽어서 buf에 저장
					buf.append(inputLine);
				}
				response = buf.toString(); // 응답결과 저장
				
				// ③ 영진원 API 응답 JSON Parssing
				JSONParser jParser = new JSONParser();	// JSONParser 객체 생성
				JSONObject jsonObject = (JSONObject) jParser.parse(response);	// 가장 큰 JSON 객체 생성	
				JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
				JSONArray movieList = (JSONArray) movieListResult.get("movieList");
				list = new ArrayList<FilmDetailDto>();
				
				int len = movieList.size();
				for (int i = 0; i < len; i++) {
					FilmDetailDto filmDto = new FilmDetailDto();
					
					JSONObject film = (JSONObject) movieList.get(i);
					
					String movieNm = film.get("movieNm").toString(); 	
					String movieCdYoung = film.get("movieCd").toString();
					String prdtYear = (String) film.get("prdtYear");

					if(prdtYear.length() > 5) {
						prdtYear = prdtYear.substring(0, 4); //8자리 날짜정보에서 연도만 추출
					}
					
					// 영화코드(영진원), 영화명, 제작연도를 DTO에 셋팅함
					filmDto.setMovieNm(movieNm);
					filmDto.setMovieCdYoung(movieCdYoung);
					filmDto.setPrdtYear(prdtYear);
					
					// 감독정보가 있는 경우에만 감독정보를 DTO에 셋팅함
					JSONArray directorJArr = (JSONArray) film.get("directors");
					if(directorJArr.size() != 0) {
						JSONObject directorObj = (JSONObject) directorJArr.get(0);
						String director = directorObj.get("peopleNm").toString();
						filmDto.setDirectors(director);
					}
					
					// 영화제목, 영진원 코드, 제작연도가 셋팅된 DTO를 list에 담음
					list.add(filmDto);
					
				} // for문 종료
				
			} else {
				System.out.println("영진원 API 에러코드 : " + responseCode);
			} // if-else문 종료
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} // try catch 종료
		return list;
	}
	
	
//	#### 네이버 API (영화 제목, 제작연도로 검색) ####
	public String nAPI(String movieNm, String prdtYear, String director) {
		
		// 검색조건 : 영진원에서 받아온 영화제목, from(제작연도), to(제작연도+1)
		// 검색결과 : 네이버 영화코드
		
		// 변수 선언
		BufferedReader in = null;
		String response = null;
		String url = null;
		String paramNm = null;
		String movieCdNaver = null;
		int year = Integer.parseInt(prdtYear);
		
		try {
			//	url 설정
			paramNm = URLEncoder.encode(movieNm, "UTF-8");
			url = "https://openapi.naver.com/v1/search/movie.json";	//네이버 API
			url += "?query=" + paramNm;	//영화제목 (어벤져스: 인피니티 워)
			url += "&display=100";
			url += "&yearfrom=" + year;	//제작연도(from)
			url += "&yearto=" + (1+year);	//제작연도(to)
			
			CallAPI.Sleep(100);
			
			// ① HttpUrlConnection 객체 생성 및 세팅
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET"); // 전송방식 설정 (GET)
			con.setConnectTimeout(30000); // 연결 제한시간 30초
			con.setReadTimeout(10000); // 컨텐츠 조회 제한시간 10초
			con.setRequestProperty("X-Naver-Client-Id", "0qOm2YBoW9dYCgbB0yK3");
			con.setRequestProperty("X-Naver-Client-Secret", "LuWmTQWn1o");
			
			int responseCode = con.getResponseCode(); // response의 status 코드 얻어옴
			
			// ② 호출이 정상일 때, 응답 결과 사용
			if (responseCode == 200) {
				
				in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				String inputLine = null;
				StringBuffer buf = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					buf.append(inputLine);
				}
				
				response = buf.toString(); // 응답결과 저장

				// ③ responseNaver (JSON) 파싱
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(response);
				JSONArray movieList = (JSONArray) jsonObject.get("items");
				
				int len = movieList.size();
				for(int i=0; i<len; i++) {
					JSONObject film = (JSONObject) movieList.get(i);
					int beginIndex = 0;
					
					String imgLink = (String) film.get("link");	//저화질 이미지 링크
					int prdtYearN = Integer.parseInt((String)film.get("pubDate"));
					String directorN = (String) film.get("director");
					
					// 감독이름이 있는 경우에만 1번째 감독 받아옴
					if("".equals(directorN)) {
						String[] directorsN = directorN.split("|");
						directorN = directorsN[0];
					}

					if(year == prdtYearN || len == 1 || ("".equals(director) && director.equals(directorN))) {	
						beginIndex = imgLink.lastIndexOf("=") + 1;
						movieCdNaver = imgLink.substring(beginIndex);
						break;
					}
				} // for문 종료
				
			} else {
				System.out.println("네이버예외코드 : " + responseCode);
			} // if-else문 종료
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}  finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} // try catch 종료
		
		return movieCdNaver;
	}
	
	
	
//	#### 고화질 이미지 크롤링 (네이버 영화코드 이용) ####
	public String getImgURL(String movieCdNaver) {
		String movieImage = null;
		
		// 검색조건 : 이미지 링크 + 네이버 영화코드
		// 검색결과 : 고화질 이미지 주소
		try {
			// 네이버 영화링크 URL 설정
			String connUrl = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=" + movieCdNaver;
			
			// 크롤링
			Document doc = Jsoup.connect(connUrl).get();
			Element imgtag = doc.getElementById("targetImage");	// image 태그 받아옴
			
			if(imgtag != null) {
				movieImage = imgtag.attr("src").toString();	// 고화질 이미지 주소 get
			} else {
				movieImage = "/MovieHolic/images/noMovieImage.png";  // 네이버 제공 고화질 이미지 주소가 없는 경우, 기본 이미지로 나오게 함.
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return movieImage;
	}
	
	
	

	
	
	

	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	public static void main(String[] args) {
//		
////		//영진원 테스트
////		List<FilmDetailDto> list = ListService.getListService().yAPI("어벤져스");
////		FilmDto film = list.get(0);
////		String movieNm = film.getMovieNm();
////		String prdtYear = film.getMovieCdYoung();
////		System.out.println("영화 제목 : " + movieNm);
////		System.out.println("영진원 코드 : " + prdtYear);
////		
////		String movieCdNaver = ListService.getListService().nAPI("라라랜드", "2016", null);
////		System.out.println("네이버 영화코드 : " + movieCdNaver);
////		
////		//이미지 크롤링 테스트
////		String movieImage = ListService.getListService().getImgURL(movieCdNaver);
////		System.out.println("고화질 이미지 링크 : " + movieImage);
//		
//		
//		
//		// srchMVbyName() 테스트
//		List<FilmDetailDto> list = ListService.getListService().srchMVbyName("골");
//		for(int i=0; i<list.size(); i++) {
//			FilmDto film = list.get(i);
////			System.out.println("영화제목 : " + film.getMovieNm());
////			System.out.println("제작연도 : " + film.getPrdtYear());
////			System.out.println("영진원 코드 : " + film.getMovieCdYoung());
//			System.out.println("네이버 코드 : " + film.getMovieCdNaver());
//			System.out.println("이미지 주소 : " + film.getMovieImage());
////			System.out.println();
//		}
//		
//	}
	
	
}
