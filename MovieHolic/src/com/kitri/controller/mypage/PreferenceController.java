package com.kitri.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		// TODO : session에서 id 받기로 변경하기! @@@@@@@@@@@@@@@@@@@@@@@@@@@
		String userid = "a125@gmail.com";
		
		// 회원 리뷰 수
		int reviewCnt = PreferenceDao.getPreferenceDao().selectReviewCount(userid);
		
		// 회원의 선호 장르 최대 5가지
		List<PreferenceDto> userCategory = PreferenceDao.getPreferenceDao().selectUserCategory(userid);
		
		// 회원의 선호 배우 최대 5명
		List<PreferenceDto> userActors = PreferenceDao.getPreferenceDao().selectUserActors(userid);
		
		// 회원의 선호 감독 최대 5명
		List<PreferenceDto> userDirectors = PreferenceDao.getPreferenceDao().selectUserDirectors(userid);
		
		// 회원의 별점 분포
		List<Integer> userStars = PreferenceDao.getPreferenceDao().selectUserStars(userid);
		
		request.setAttribute("reviewCnt", reviewCnt);
		request.setAttribute("userCategory", userCategory);
		request.setAttribute("userActors", userActors);
		request.setAttribute("userDirectors", userDirectors);
		request.setAttribute("userStars", userStars);
		
		return path;
	
	}
	
}