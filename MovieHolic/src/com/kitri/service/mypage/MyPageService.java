package com.kitri.service.mypage;

import java.util.ArrayList;
import java.util.List;

import com.kitri.dao.mypage.SocialDao;
import com.kitri.dto.SocialDto;
import com.kitri.dto.WishlistDto;
import com.kitri.service.list.ListService;

public class MyPageService {

	private static MyPageService myPageService;

	static {
		myPageService = new MyPageService();
	}

	private MyPageService() {
	};

	public static MyPageService getMyPageService() {

		return myPageService;
	}

	// social.jsp following페이지
	public static List<SocialDto> findByRows(int startRow, int endRow) {
		return SocialDao.selectByRows(startRow, endRow);
	}

	public static int getTotalCnt() {
		return SocialDao.selectTotalCnt();
	}

	// social.jsp follower 페이지
	public static List<SocialDto> findByRows2(int startRow, int endRow) {
		return SocialDao.selectByRows2(startRow, endRow);
	}

	public static int getTotalCnt2() {
		return SocialDao.selectTotalCnt2();
	}

	// social.jsp following 삭제 페이지
	public void deleteFollowingId(String followingid) {

		SocialDao.getSocialDao().deleteFollowing(followingid);
	}

	// social.jsp 맞팔로우 페이지
	public void addFollowId(String followid) {
		SocialDao.getSocialDao().addFollow(followid);
	}
	// ----------------------------wishlist 필요 메소드----------------------------

	public List<WishlistDto> showWishlist(String userid) {

		List<WishlistDto> list = SocialDao.getSocialDao().selectWishlist(userid);
		String movieCdNaver;
		int length = list.size();
		for (int i = 0; i < length; i++) {
			movieCdNaver = list.get(i).getMovieCodeNaver();
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
			list.get(i).setMovieURL(movieURL);
		}
//		System.out.println("service : " + list);
		return list;
	}

	public List<WishlistDto> showSearchedWishlist(String userid, String srchKey) {
		
		List<WishlistDto> list = SocialDao.getSocialDao().selectSearchedWishlist(userid, srchKey);
		String movieCdNaver;
		int length = list.size();
		for (int i = 0; i < length; i++) {
			movieCdNaver = list.get(i).getMovieCodeNaver();
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
			list.get(i).setMovieURL(movieURL);
		}
		return list;
	}

}
