package com.kitri.dto;

import java.util.Arrays;

public class FilmDetailDto extends FilmDto{

	private String movieNmEn;		// 영화 영문명
	private String openDt;			// 개봉날짜
	private String genreNm;			// 장르
	private String nations;			// 제작국가
	private String showTm;			// 상영시간
	private String directors;		// 감독명 (맨 앞 한명만 받기)
	private String[] actors;		// 배우명
	private String watchGradeNm;	// 관람등급
	private String companyNm;		// 제작사명
	
	public String getMovieNmEn() {
		return movieNmEn;
	}
	
	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}
	
	public String getOpenDt() {
		return openDt;
	}
	
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	
	public String getGenreNm() {
		return genreNm;
	}
	
	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}
	
	public String getNations() {
		return nations;
	}
	
	public void setNations(String nations) {
		this.nations = nations;
	}
	
	public String getShowTm() {
		return showTm;
	}
	
	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}
	
	public String getDirectors() {
		return directors;
	}
	
	public void setDirectors(String directors) {
		this.directors = directors;
	}
	
	public String[] getActors() {
		return actors;
	}
	
	public void setActors(String[] actors) {
		this.actors = actors;
	}
	
	public String getWatchGradeNm() {
		return watchGradeNm;
	}
	
	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}
	
	public String getCompanyNm() {
		return companyNm;
	}
	
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}

	
	@Override
	public String toString() {
		return "FilmDetailDto [movieNmEn=" + movieNmEn + ", openDt=" + openDt + ", genreNm=" + genreNm + ", nations="
				+ nations + ", showTm=" + showTm + ", directors=" + directors + ", actors="
				+ Arrays.toString(actors) + ", watchGradeNm=" + watchGradeNm + ", companyNm=" + companyNm + "]";
	}
	
	
}
