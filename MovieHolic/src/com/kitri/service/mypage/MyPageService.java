package com.kitri.service.mypage;

import java.util.ArrayList;
import java.util.List;

import com.kitri.dao.mypage.SocialDao;
import com.kitri.dto.SocialDto;

public class MyPageService {
	
	private static MyPageService myPageService;
	
	static {
		myPageService = new MyPageService();
	}
	
	private MyPageService(){};
	
	public static MyPageService getMyPageService() {
		
		return myPageService;
	}
	
	public List<SocialDto> selectFollowing(String userId) {
		List<SocialDto> list = new ArrayList<SocialDto>();
		list = SocialDao.getSocialDao().selectFollowingId(userId);
//		System.out.println("서비스 확인 : " + list);		
		return list;
	}
	
	
	public static List<SocialDto> findByRows(int startRow, int endRow){
		return SocialDao.selectByRows(startRow, endRow);
	}


	public static int getTotalCnt() {
		return SocialDao.selectTotalCnt();
	}
	
	
//	public int deleteFollowingId() {
//		
//		
//		return SocialDao.getSocialDao().updateUnable();
//	}
//	
}
