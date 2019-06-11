package com.kitri.dto;

import java.util.List;

public class WishlistDto extends FilmDto{	//위시리스트

	private String userId;					//ID
	private int code;						//code
	private String postDate;				//등록일자
	private String movieCodeNaver;	//영화코드(네이버)
	private String movieCodeYoung;			//영화코드(영진원)
	private String movieURL;
	
	///// 생성자 /////


	public String getMovieURL() {
		return movieURL;
	}


	public void setMovieURL(String movieURL) {
		this.movieURL = movieURL;
	}


	public WishlistDto() {
		super();
	}


	///// getter & setter /////

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}


	public String getPostDate() {
		return postDate;
	}


	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}


	public String getMovieCodeNaver() {
		return movieCodeNaver;
	}


	public void setMovieCodeNaver(String movieCodeNaver) {
		this.movieCodeNaver = movieCodeNaver;
	}

	
	public String getMovieCodeYoung() {
		return movieCodeYoung;
	}

	
	public void setMovieCodeYoung(String movieCodeYoung) {
		this.movieCodeYoung = movieCodeYoung;
	}


	@Override
	public String toString() {
		return "WishlistDto [userId=" + userId + ", code=" + code + ", postDate=" + postDate + ", movieCodeNaver="
				+ movieCodeNaver + ", movieCodeYoung=" + movieCodeYoung + ", movieURL=" + movieURL + "]";
	}


	
	
	

	
	
}
