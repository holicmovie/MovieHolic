package com.kitri.dto;

import java.util.List;

public class BoardDto { // 게시판

	private int seq; // 글번호
	private int boardCode; // boardCode
	private String subject; // 제목
	private String userId; // 작성자ID
	private String postDate; // 작성일
	private String postDateY; // 작성일
	private String postDateM; // 작성일
	private String content; // 내용
	private List<String> movieCodeYoung; // 영화코드(영진원)
	private List<String> movieCodeNaver; // 영화코드(네이버)
	private List<String> director; // 감독명
	private List<String> actors; // 배우
	private String actor1;
	private String actor2;
	private List<String> movieName; // 영화명
	private int starPoint; // 별점
	private String category; // 장르
	private int best; // 추천수
	private int worst; // 비추천수
	private int viewCount; // 조회수
	private int enable; // 공개여부
	private int notify; // 신고수
	private List<String> url;
	private String movieCodeYoung2;
	private String movieCodeNaver2;
	private String movieName2;
	private String director2;
	private String url2;
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
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getPostDateY() {
		return postDateY;
	}
	public void setPostDateY(String postDateY) {
		this.postDateY = postDateY;
	}
	public String getPostDateM() {
		return postDateM;
	}
	public void setPostDateM(String postDateM) {
		this.postDateM = postDateM;
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
	public List<String> getMovieCodeNaver() {
		return movieCodeNaver;
	}
	public void setMovieCodeNaver(List<String> movieCodeNaver) {
		this.movieCodeNaver = movieCodeNaver;
	}
	public List<String> getDirector() {
		return director;
	}
	public void setDirector(List<String> director) {
		this.director = director;
	}
	public List<String> getActors() {
		return actors;
	}
	public void setActors(List<String> actors) {
		this.actors = actors;
	}
	public String getActor1() {
		return actor1;
	}
	public void setActor1(String actor1) {
		this.actor1 = actor1;
	}
	public String getActor2() {
		return actor2;
	}
	public void setActor2(String actor2) {
		this.actor2 = actor2;
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
	public List<String> getUrl() {
		return url;
	}
	public void setUrl(List<String> url) {
		this.url = url;
	}
	public String getMovieCodeYoung2() {
		return movieCodeYoung2;
	}
	public void setMovieCodeYoung2(String movieCodeYoung2) {
		this.movieCodeYoung2 = movieCodeYoung2;
	}
	public String getMovieCodeNaver2() {
		return movieCodeNaver2;
	}
	public void setMovieCodeNaver2(String movieCodeNaver2) {
		this.movieCodeNaver2 = movieCodeNaver2;
	}
	public String getMovieName2() {
		return movieName2;
	}
	public void setMovieName2(String movieName2) {
		this.movieName2 = movieName2;
	}
	public String getDirector2() {
		return director2;
	}
	public void setDirector2(String director2) {
		this.director2 = director2;
	}
	public String getUrl2() {
		return url2;
	}
	public void setUrl2(String url2) {
		this.url2 = url2;
	}
	@Override
	public String toString() {
		return "BoardDto [seq=" + seq + ", boardCode=" + boardCode + ", subject=" + subject + ", userId=" + userId
				+ ", postDate=" + postDate + ", postDateY=" + postDateY + ", postDateM=" + postDateM + ", content="
				+ content + ", movieCodeYoung=" + movieCodeYoung + ", movieCodeNaver=" + movieCodeNaver + ", director="
				+ director + ", actors=" + actors + ", actor1=" + actor1 + ", actor2=" + actor2 + ", movieName="
				+ movieName + ", starPoint=" + starPoint + ", category=" + category + ", best=" + best + ", worst="
				+ worst + ", viewCount=" + viewCount + ", enable=" + enable + ", notify=" + notify + ", url=" + url
				+ ", movieCodeYoung2=" + movieCodeYoung2 + ", movieCodeNaver2=" + movieCodeNaver2 + ", movieName2="
				+ movieName2 + ", director2=" + director2 + ", url2=" + url2 + "]";
	}
	

	


}
