package com.kitri.dto;

import java.sql.Date;

public class BoardDto { // 게시판

	private int seq; // 글번호
	private int boardCode; // boardCode
	private String subject; // 제목
	private String userId; // 작성자ID
	private Date postDate; // 작성일
	private String content; // 내용
	private String movieCodeYoung; // 영화코드(영진원)
	private String movieCodeNaver; // 영화코드(네이버)
	private String movieName; // 영화명
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

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMovieCodeYoung() {
		return movieCodeYoung;
	}

	public void setMovieCodeYoung(String movieCodeYoung) {
		this.movieCodeYoung = movieCodeYoung;
	}

	public String getMovieCodeNaver() {
		return movieCodeNaver;
	}

	public void setMovieCodeNaver(String movieCodeNaver) {
		this.movieCodeNaver = movieCodeNaver;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
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

	public void setCategory(String cotegory) {
		this.category = cotegory;
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
				+ ", movieCodeNaver=" + movieCodeNaver + ", movieName=" + movieName + ", starPoint=" + starPoint
				+ ", category=" + category + ", best=" + best + ", worst=" + worst + ", viewCount=" + viewCount
				+ ", enable=" + enable + ", notify=" + notify + "]";
	}

	
}
