package com.kitri.service.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.kitri.dao.mypage.SocialDao;
import com.kitri.dto.BoardDto;
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
		
//		List<String> movieCdNaver;
//		List<String> movieCdYoung;
//		List<String> imgURL = new ArrayList<String>();
//		int length = list.size();
		
//		for (int i = 0; i < length; i++) {
//			movieCdNaver = list.get(i).getMovieCodeNaver();
//			String mcn = "";
//			String movieURL = "";
//			for(int j=0;j<movieCdNaver.size();j++) {
//			mcn = movieCdNaver.get(j).toString();
////			System.out.println("영화코드 : " + mcn);
//			movieURL = ListService.getListService().getImgURL(mcn);
//			System.out.println(movieURL);
//			}
////			System.out.println(mcn);
//			
//			imgURL = new ArrayList<String>();
//			imgURL.add(movieURL);
//			list.get(i).setUrl(imgURL);
////			System.out.println(movieCdNaver);
//			
//			System.out.println(list);
//		}
//		
//		for (int i = 0; i < length; i++) {
//			movieCdNaver = list.get(i).getMovieCodeNaver();
//			movieCdYoung = list.get(i).getMovieCodeYoung();
//			
//			System.out.println(movieCdNaver);
//			System.out.println(movieCdYoung);
//		}
		return list;
	}

	public List<String> getImgURL(List<String> movieCdNaver) {
		List<String> list = new ArrayList<>();
		String movieImage = null;

		// 검색조건 : 이미지 링크 + 네이버 영화코드
		// 검색결과 : 고화질 이미지 주소
		try {
			// 네이버 영화링크 URL 설정
			String connUrl = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=" + movieCdNaver;

			// 크롤링
			Document doc = Jsoup.connect(connUrl).get();
			Element imgtag = doc.getElementById("targetImage"); // image 태그 받아옴

			if (imgtag != null) {
				movieImage = imgtag.attr("src").toString(); // 고화질 이미지 주소 get
			} else {
				movieImage = "/MovieHolic/images/noMovieImage.png"; // 네이버 제공 고화질 이미지 주소가 없는 경우, 기본 이미지로 나오게 함.
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

}
