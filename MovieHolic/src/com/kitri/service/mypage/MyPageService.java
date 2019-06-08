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
	
	
	
	public static List<SocialDto> findByRows(int startRow, int endRow){
		return SocialDao.selectByRows(startRow, endRow);
	}


	public static int getTotalCnt() {
		return SocialDao.selectTotalCnt();
	}
	

	public static List<SocialDto> findByRows2(int startRow, int endRow){
		return SocialDao.selectByRows2(startRow, endRow);
	}


	public static int getTotalCnt2() {
		return SocialDao.selectTotalCnt2();
	}
	
	
//	public int deleteFollowingId() {
//		
//		
//		return SocialDao.getSocialDao().updateUnable();
//	}
//	
}
