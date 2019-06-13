package com.kitri.controller.mypage;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.kitri.dao.mypage.PreferenceDao;
import com.kitri.dto.mypage.PreferenceDto;

public class PreferenceController {
	
	private static PreferenceController preferenceController;

	static {
		preferenceController = new PreferenceController();
	}

	private PreferenceController() {
	}

	public static PreferenceController getPreferenceController() {
		return preferenceController;
	}
	

	
	public String showPreference(HttpServletRequest request, HttpServletResponse response) {

		String path = "/page/mypage/preference.jsp";

		// TODO : session에서 id 받기로 변경하기! ok
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginInfo");
		
		// 회원 리뷰 수
		int reviewCnt = PreferenceDao.getPreferenceDao().selectReviewCount(userid);
		
		// 회원의 선호 장르 최대 5가지
		List<PreferenceDto> userCategory = PreferenceDao.getPreferenceDao().selectUserCategory(userid);
		
		// 회원의 선호 배우 최대 5명
		List<PreferenceDto> userActors = PreferenceDao.getPreferenceDao().selectUserActors(userid);
		List<String> actorImages = getImg(userActors, 1);
		for(int i = 0; i < actorImages.size(); i++) {
			userActors.get(i).setActorImage(actorImages.get(i));
		}
		
		// 회원의 선호 감독 최대 5명
		List<PreferenceDto> userDirectors = PreferenceDao.getPreferenceDao().selectUserDirectors(userid);
		List<String> directorImages = getImg(userDirectors, 0);
		for(int i = 0; i < directorImages.size(); i++) {
			userDirectors.get(i).setDirectorImage(directorImages.get(i));
		}
		
		// 회원의 별점 분포
		List<Integer> userStars = PreferenceDao.getPreferenceDao().selectUserStars(userid);
		
		request.setAttribute("reviewCnt", reviewCnt);
		request.setAttribute("userCategory", userCategory);
		request.setAttribute("userActors", userActors);
		request.setAttribute("userDirectors", userDirectors);
		request.setAttribute("userStars", userStars);
		
		return path;
	
	}
	
	// 인물 이미지 얻기 메소드
	// 인자값 type : 배우면 1, 감독이면 0
	public List<String> getImg(List<PreferenceDto> people, int type) {
				
		List<String> images = new ArrayList<String>();
		int len = people.size();
		
		for(int i = 0; i < len; i++) {
			
			try {
				String searchActorNm = "";
				// 네이버 검색결과의 인물 사진 주소를 크롤링
				if(type == 1) {
					searchActorNm = URLEncoder.encode("배우 " + people.get(i).getActor(), "UTF-8");
				}else {
					searchActorNm = URLEncoder.encode("감독 " + people.get(i).getActor(), "UTF-8");					
				}
				String connUrl = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+searchActorNm;
				Document doc;
				doc = Jsoup.connect(connUrl).get();
				
				Elements imgtag = doc.select("div.cont_noline div.profile_wrap div.big_thumb img");
				System.out.println(imgtag);
				if(!imgtag.isEmpty()) {			
					images.add(imgtag.get(0).attr("src").toString());
				} else {
					// 없을 경우 기본 이미지 세팅
					images.add("/MovieHolic/images/noProfile.png");
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return images;
		
	}
	
	
}