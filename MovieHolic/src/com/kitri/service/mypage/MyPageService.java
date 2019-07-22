package com.kitri.service.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.kitri.controller.mypage.MyPageController;
import com.kitri.dao.mypage.SocialDao;
import com.kitri.dto.BoardDto;
import com.kitri.dto.FilmDetailDto;
import com.kitri.dto.FilmDto;
import com.kitri.dto.LogDto;
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

//---------------------------------[social.jsp]----------------------------
	// social.jsp following페이지
	public static List<SocialDto> findByRows(String userid, int startRow, int endRow) {
		return SocialDao.selectByRows(userid, startRow, endRow);
	}

	public static int getTotalCnt(String userid) {
		return SocialDao.selectTotalCnt(userid);
	}

	// social.jsp follower 페이지
	public static List<SocialDto> findByRows2(String userid, int startRow, int endRow) {
		return SocialDao.selectByRows2(userid, startRow, endRow);
	}

	public static int getTotalCnt2(String userid) {
		return SocialDao.selectTotalCnt2(userid);
	}

	// social.jsp following 삭제 페이지
	public void deleteFollowingId(String followingid) {

		SocialDao.getSocialDao().deleteFollowing(followingid);
	}

	// social.jsp 맞팔로우 페이지
	public void addFollowId(String userid, String followid) {
		SocialDao.getSocialDao().addFollow(userid, followid);
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

//		wishlist 검색 기능
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

// 	wishlist 삭제 기능 
	public void deleteWishList(String userid, String[] wishlistdelete) {
		SocialDao.getSocialDao().deleteWishList(userid, wishlistdelete);
	}

	
	
	
//-----------------------------[mypage method]------------------------------	
	// wishlist method
	public List<WishlistDto> showMineWishList(String userid) {
		List<WishlistDto> list = SocialDao.getSocialDao().selectMineWishList(userid);
		String movieCdNaver;
		int length = list.size();
		for (int i = 0; i < length; i++) {
			movieCdNaver = list.get(i).getMovieCodeNaver();
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
			list.get(i).setMovieURL(movieURL);
		}
//		System.out.println("Service: " + list);
		return list;
	}

	// review method
	public List<BoardDto> showMineReview(String userid) {
		List<BoardDto> list = SocialDao.getSocialDao().selectMineReview(userid);
		
		String movieCdNaver;
		int length = list.size();
		for (int i = 0; i < length; i++) {
			movieCdNaver = list.get(i).getMovieCodeNaver2();
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
			list.get(i).setUrl2(movieURL);
		}
		

		return list;
	}

	
//	mypage-mine-list method
	public List<BoardDto> showMineList(String userid) {
		List<BoardDto> list = SocialDao.getSocialDao().selectMineList(userid);
		int length = list.size();
		
		BoardDto board = null;
		
		if(length!=0) {
			board = list.get(0);
		}
		
		List<String> naverList = board.getMovieCodeNaver();
		int len = naverList.size();
//		System.out.println("S board : " + board);
		
		
//		System.out.println("navercode : " + naverList);
		List<String> imgurl = new ArrayList<String>();
		
		for(int j = 0; j<length;j++) {
			for(int i = 0; i<len; i++) {
			String movieCdNaver = naverList.get(i);
//			System.out.println("naver 영화코드 : " + movieCdNaver);
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
//			System.out.println("영화 url : " + movieURL);
			imgurl.add(movieURL);
			}
			list.get(j).setUrl(imgurl);
		}
//		System.out.println("imgurl : " + imgurl);
//		System.out.println("S list : " + list);
		
		return list;
	}

	
// 활동로그
	public List<LogDto> showLog(String userid) {
		
		return SocialDao.getSocialDao().selectLog(userid);
	}

	public int checkFollowId(String followid) {
		
		return SocialDao.getSocialDao().checkFollowid(followid);
	}

}
