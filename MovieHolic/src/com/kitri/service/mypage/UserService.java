package com.kitri.service.mypage;

import java.util.List;

import com.kitri.dao.mypage.ReviewAddDao;
import com.kitri.dto.BoardDto;
import com.kitri.dto.CommentDto;

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
		public List<BoardDto> reviewlist(String movieName) {
			
			return ReviewAddDao.getReviewAdd().reviewlist(movieName);
		}
	//리스트목록
		public List<BoardDto> listList(String content){
			return ReviewAddDao.getReviewAdd().listList(content);
		}
	//리뷰정보
		public BoardDto selectByNo(String seq) {
			return ReviewAddDao.getReviewAdd().selectByNo(seq);
		}
	//코멘트
		public List<CommentDto> findByCo(String seq){
			return ReviewAddDao.getReviewAdd().reviewContent(seq);
		}
}
