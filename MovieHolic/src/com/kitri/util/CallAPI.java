package com.kitri.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class CallAPI {

	// 1 <HTTP GET 호출> 메소드

	// [인자값]
	// 		- String httpUrl : 파라미터 포함 url
	// 		- HashMap header : 헤더(key-value)   *헤더 없으면 null 넣기
	
	// [return]
	// 		- JSON형식의 응답결과 (String 타입)

	public static String APIHttpGet(String httpUrl, HashMap<String, String> header) {

			String response = "";    // 응답 결과 담을 String
			
	        try {

	        	// ① HttpUrlConnection 객체 생성 및 세팅
	        	URL obj = new URL(httpUrl);
	        	HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	        	
	        	con.setRequestMethod("GET");  					// 전송방식 설정 (GET)
	        	con.setConnectTimeout(10000);    				// 연결 제한시간 10초
	        	con.setReadTimeout(5000);             			// 컨텐츠 조회 제한시간 5초

	        	// 헤더 설정
	        	if(header != null) {
	        		Iterator<String> keys = header.keySet().iterator();
	        		while(keys.hasNext()) {
	        			String key = keys.next();
	        			String value = (String) header.get(key);
	        			con.setRequestProperty(key, value); 		// Request Header 설정
	        		}
	        	}
	        	
	        	int responseCode = con.getResponseCode();  // response의 status 코드 얻어옴
	        	
	        	// ② 호출이 정상일 때, 응답 결과 사용
	        	if (responseCode == 200) {   	
	        	
		        	Charset charset = Charset.forName("UTF-8");
		        	BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(),charset));
		        	String inputLine;
		        	StringBuffer sr = new StringBuffer();
		        	
					while ((inputLine = in.readLine()) != null) {
						sr.append(inputLine);
					}
					in.close();
					
					response = sr.toString();
					
					System.out.println("정상 호출 됨 결과 : " + sr);
					
	        	}
	        	
				} catch (IOException e) {
					e.printStackTrace();
				}
	     
			return response;
		} // APIHttpGet() end

	
	// 2 <고화질 포스터 이미지 주소 얻기> 메소드
	
	// [인자값]
	// 		- String movieImageUrl : 네이버 영화 목록 검색 api에서 얻은 "link"값
	// [return]
	// 		- 고화질 포스터의 이미지 주소 (Stirng 타입)
	
	public static String getPoster(String movieImageUrl) {
		
		String HighImageUrl = "";
		
		int beginIndex = movieImageUrl.lastIndexOf("=")+1;
		String movieCdNaver = movieImageUrl.substring(beginIndex); // movieCdNaver = 영화코드(네이버)
		
		// 네이버 영화의 고화질 포스터 주소를 크롤링
		String connUrl = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode="+movieCdNaver;
		
		try {
			Document doc = Jsoup.connect(connUrl).get();
			HighImageUrl = doc.getElementById("targetImage").attr("src").toString(); // HighImageUrl = 고화질 포스터 이미지 주소
		} catch (IOException e) {
			e.printStackTrace();
		}

        return HighImageUrl;
	} // getPoster() end
	
}
