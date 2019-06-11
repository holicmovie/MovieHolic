package com.kitri.dto;

import java.util.Arrays;

public class FilmDetailDto extends FilmDto{

	private String movieNmEn;		// 영화 영문명
	private String openDt;				// 개봉날짜
	private String nations;				// 제작국가
	private String showTm;				// 상영시간
	private String directors;			// 감독명 (맨 앞 한명만 받기)
	private String actor1;				// 주연배우1
	private String actor2;				// 주연배우2
	private String watchGradeNm;	// 관람등급
	private String companyNm;		// 제작사명
	
	// 영화 상세 페이지(moviedetail.jsp) 위한 필드
	private String directorImage;		// 감독 사진
	private String[] actors;				// 배우 전체 이름
	private String[] actorImages;		// 배우 전체 사진
	private String videoId;				// 예고편용 videoId
	private int starPoint;				// 무비홀릭 별점
	
	
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
	public String getDirectorImage() {
		return directorImage;
	}
	public void setDirectorImage(String directorImage) {
		this.directorImage = directorImage;
	}
	public String[] getActors() {
		return actors;
	}
	public void setActors(String[] actors) {
		this.actors = actors;
	}
	public String[] getActorImages() {
		return actorImages;
	}
	public void setActorImages(String[] actorImages) {
		this.actorImages = actorImages;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	
	
	@Override
	public String toString() {
		return "FilmDetailDto [movieNmEn=" + movieNmEn + ", openDt=" + openDt + ", nations=" + nations + ", showTm="
				+ showTm + ", directors=" + directors + ", actor1=" + actor1 + ", actor2=" + actor2 + ", watchGradeNm="
				+ watchGradeNm + ", companyNm=" + companyNm + ", directorImage=" + directorImage + ", actors="
				+ Arrays.toString(actors) + ", actorImages=" + Arrays.toString(actorImages) + ", videoId=" + videoId
				+ ", starPoint=" + starPoint + "]";
	}
	
}
