package com.kitri.admin.dto;

import java.util.Date;


public class NotifyDto {

	
	
	private int seq = 1;			/* 글번호 */
	private int boardCode;		/* 게시판코드 */
	private int best; 			/* 추천 */
	private int worst; 			/* 비추천 */
	private int notify;  			/* 신고 */
	private int enable; 			/* 공개여부 */
	private int viewCount;		/* 조회수 */
	private int starPoint; 		/* 별점 */
	private Date postDate; 	/* 작성일 */
	private String userId;  	/* 회원ID */
	private String subject; 	/* 제목 */
	private String content; 	/* 내용 */
	private String movieName; /* 영화명 */
	private String director; 	/* 감독명 */
	private String movieCodeYoung; 	/* 영화코드(진흥원) */
	private String category; 	/* 장르 */
	private String boardName; /* 분류 */
	private int row;
	
	public NotifyDto(){}
	
	public NotifyDto(int seq, int boardCode, int best, int worst, int notify, int enable, int viewCount, int starPoint,
			Date postDate, String userId, String subject, String content, String movieName, String director,
			String movieCodeYoung, String category, String boardName, int row) {
		super();
		this.seq = seq;
		this.boardCode = boardCode;
		this.best = best;
		this.worst = worst;
		this.notify = notify;
		this.enable = enable;
		this.viewCount = viewCount;
		this.starPoint = starPoint;
		this.postDate = postDate;
		this.userId = userId;
		this.subject = subject;
		this.content = content;
		this.movieName = movieName;
		this.director = director;
		this.movieCodeYoung = movieCodeYoung;
		this.category = category;
		this.boardName = boardName;
		this.row = row;
	}

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

	public int getNotify() {
		return notify;
	}

	public void setNotify(int notify) {
		this.notify = notify;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getMovieCodeYoung() {
		return movieCodeYoung;
	}

	public void setMovieCodeYoung(String movieCodeYoung) {
		this.movieCodeYoung = movieCodeYoung;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	@Override
	public String toString() {
		return "NotifyDto [seq=" + seq + ", boardCode=" + boardCode + ", best=" + best + ", worst=" + worst
				+ ", notify=" + notify + ", enable=" + enable + ", viewCount=" + viewCount + ", starPoint=" + starPoint
				+ ", postDate=" + postDate + ", userId=" + userId + ", subject=" + subject + ", content=" + content
				+ ", movieName=" + movieName + ", director=" + director + ", movieCodeYoung=" + movieCodeYoung
				+ ", category=" + category + ", boardName=" + boardName + ", row=" + row + "]" + "/n";
	}


	
	
	
	

	
	
	
	
	

}
