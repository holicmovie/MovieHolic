package com.kitri.service.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.kitri.dao.mypage.SocialDao;
import com.kitri.dto.BoardDto;
import com.kitri.dto.FilmDetailDto;
import com.kitri.dto.FilmDto;
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
		
		BoardDto board = list.get(0);
		List<String> naverList = board.getMovieCodeNaver();
		int len = naverList.size();
		
		
//		System.out.println("navercode : " + naverList);
		List<String> imgurl = new ArrayList<String>();
		
		for(int j = 0; j<length;j++) {
			for(int i = 0; i<len; i++) {
			String movieCdNaver = naverList.get(i);
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
//			System.out.println("naver 영화코드 : " + movieCdNaver);
//			System.out.println("영화 url : " + movieURL);
			imgurl.add(movieURL);
			}
			list.get(j).setMovieCodeNaver(imgurl);
		}
		System.out.println("imgurl : " + imgurl);
		System.out.println("list : " + list);
//		List<FilmDto> film = ListService.getListService().getMvImg(board);
//		System.out.println("S list : " + list);
//		System.out.println("S board : " + board);
//		System.out.println("S film : " + film);
//		System.out.println("S film : " +film);
		
		return list;
	}

}
