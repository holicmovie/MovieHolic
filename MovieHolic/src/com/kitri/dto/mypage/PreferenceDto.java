package com.kitri.dto.mypage;

public class PreferenceDto {

	// [선호 장르 통계]
	private String category;
	private String percent;
	
	// [선호 배우 통계]
	private String actor;
	private int actorScore;
	private String actorImage;
	
	// [선호 감독 통계]
	private String director;
	private int directorScore;
	private String directorImage;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getActorScore() {
		return actorScore;
	}
	public void setActorScore(int actorScore) {
		this.actorScore = actorScore;
	}
	public String getActorImage() {
		return actorImage;
	}
	public void setActorImage(String actorImage) {
		this.actorImage = actorImage;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public int getDirectorScore() {
		return directorScore;
	}
	public void setDirectorScore(int directorScore) {
		this.directorScore = directorScore;
	}
	public String getDirectorImage() {
		return directorImage;
	}
	public void setDirectorImage(String directorImage) {
		this.directorImage = directorImage;
	}
	
	@Override
	public String toString() {
		return "PreferenceDto [category=" + category + ", percent=" + percent + ", actor=" + actor + ", actorScore="
				+ actorScore + ", actorImage=" + actorImage + ", director=" + director + ", directorScore="
				+ directorScore + ", directorImage=" + directorImage + "]";
	}

	
}
