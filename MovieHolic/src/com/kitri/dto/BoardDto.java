package com.kitri.dto;

import java.util.List;

public class BoardDto { // 게시판

	private int seq; // 글번호
	private int boardCode; // boardCode
	private String subject; // 제목
	private String userId; // 작성자ID
	private String postDate; // 작성일
	private String content; // 내용
	private List<String> movieCodeYoung; // 영화코드(영진원)
	private List<String> director; // 감독명
	private List<String> movieName; // 영화명
	private int starPoint; // 별점
	private String category; // 장르
	private int best; // 추천수
	private int worst; // 비추천수
	private int viewCount; // 조회수
	private int enable; // 공개여부
	private int notify; // 신고수


	
	///// 생성자 /////
	
	public BoardDto() {
		super();
	}


	///// getter & setter /////
	
	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getBoardCode() {
		return boardCode;
	}


	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPostDate() {
		return postDate;
	}
	public String getPostDateY() {
		return postDate;
	}
	public String getPostDateM() {
		return postDate;
	}


	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public void setPostDateY(String postDate) {
		this.postDate = postDate;
	}
	public void setPostDateM(String postDate) {
		this.postDate = postDate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public List<String> getMovieCodeYoung() {
		return movieCodeYoung;
	}


	public void setMovieCodeYoung(List<String> movieCodeYoung) {
		this.movieCodeYoung = movieCodeYoung;
	}


	public List<String> getDirector() {
		return director;
	}


	public void setDirector(List<String> director) {
		this.director = director;
	}


	public List<String> getMovieName() {
		return movieName;
	}


	public void setMovieName(List<String> movieName) {
		this.movieName = movieName;
	}


	public int getStarPoint() {
		return starPoint;
	}


	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getBest() {
		return best;
	}


	public void setBest(int best) {
		this.best = best;
	}


	public int getWorst() {
		return worst;
	}


	public void setWorst(int worst) {
		this.worst = worst;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public int getEnable() {
		return enable;
	}


	public void setEnable(int enable) {
		this.enable = enable;
	}


	public int getNotify() {
		return notify;
	}


	public void setNotify(int notify) {
		this.notify = notify;
	}


	@Override
	public String toString() {
		return "BoardDto [seq=" + seq + ", boardCode=" + boardCode + ", subject=" + subject + ", userId=" + userId
				+ ", postDate=" + postDate + ", content=" + content + ", movieCodeYoung=" + movieCodeYoung
				+ ", director=" + director + ", movieName=" + movieName + ", starPoint=" + starPoint
				+ ", category=" + category + ", best=" + best + ", worst=" + worst + ", viewCount=" + viewCount
				+ ", enable=" + enable + ", notify=" + notify+"]" ;
	}




	
	
	

	
}
