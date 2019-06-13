package com.kitri.service.mypage;

import java.util.List;

import com.kitri.dao.mypage.ReviewAddDao;
import com.kitri.dto.*;
import com.kitri.service.list.ListService;

public class UserService {

private static UserService userService; // 2번째 전역변수 만들기
	
	static {
		userService = new UserService(); // 3번째 자기 안에서 쓸 수 있게 만들기
	}

	private UserService() {} // 1번째 외부에서 생성 못하게 만듬.
	
	public static UserService getUserService() { // 4번째 getter 만들기.
		return userService;
	}
	
	// 리뷰목록
		public List<BoardDto> reviewlist(int startRow, int endRow, String userid) {
			List<BoardDto> list = ReviewAddDao.getReviewAdd().reviewlist(startRow, endRow,userid);
			String movieCdNaver;
			int length = list.size();
			for(int i = 0; i < length; i++) {
				movieCdNaver = list.get(i).getMovieCodeNaver2();
				String movieURL = ListService.getListService().getImgURL(movieCdNaver);
				list.get(i).setUrl2(movieURL);
			}
			return list;
		}
	//리스트목록
		public List<BoardDto> listList(String content){
			return ReviewAddDao.getReviewAdd().listList(content);
		}
	//리뷰정보
		public BoardDto selectByNo(String seq) {
			BoardDto list = ReviewAddDao.getReviewAdd().selectByNo(seq);
			String movieCdNaver;
			movieCdNaver = list.getMovieCodeNaver2();
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
			list.setUrl2(movieURL);
			return list;
		}
	//코멘트
		public List<CommentDto> findByCo(String seq){
			return ReviewAddDao.getReviewAdd().reviewContent(seq);
		}
	//회원정보
		public UserDto selectById(String userid) {
			return ReviewAddDao.getReviewAdd().selectId(userid);
		}
	//리뷰총갯수
		public int getTotalpage(String id) {
			return ReviewAddDao.getReviewAdd().selectTotalReview(id);
		}
	//리뷰쓰기page
		public FilmDto writeReview(String moviecodeyoung) {
			FilmDto list =ReviewAddDao.getReviewAdd().reviewAdd(moviecodeyoung);
			String movieCdNaver;
			movieCdNaver = list.getMovieCdNaver();
			String movieURL = ListService.getListService().getImgURL(movieCdNaver);
			list.setMovieImage(movieURL);
			return list;
		}
	//reviewregisterbutton
		public int getregisterReview(BoardDto boardDto) {
			return ReviewAddDao.getReviewAdd().registerReview(boardDto);
		}
	//리뷰검색페이지
		public int getSearchReview(String search, String id) {
			return ReviewAddDao.getReviewAdd().selectReviewSearch(search, id);
		}
	//리뷰검색select
		public List<BoardDto> selectSearchReview(int startRow, int endRow, String userid, String search) {
			return ReviewAddDao.getReviewAdd().searchReviewList(startRow, endRow, search, userid);
		}
	//리뷰삭제
		public void deleteReview(String userid, String[] reviewdelete) {
			ReviewAddDao.getReviewAdd().deletereview(userid, reviewdelete);
		}
}
