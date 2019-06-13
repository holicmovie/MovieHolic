package com.kitri.dto;

public class LogDto { // 활동기록

	private String logDate; // 활동시간
	private int logCate; // 활동분류
	private String logId; // 활동ID
	private String sujbect; // 제목
	private int seq; // 글번호
	private String userId; // 작성자ID
	private String movieCodeYoung; // 영화코드(영진원)
	private String movieCodeNaver;
	///// 생성자 /////

	public String getMovieCodeNaver() {
		return movieCodeNaver;
	}


	public void setMovieCodeNaver(String movieCodeNaver) {
		this.movieCodeNaver = movieCodeNaver;
	}


	public LogDto() {
		super();
	}

	
	///// getter & setter /////

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public int getLogCate() {
		return logCate;
	}

	public void setLogCate(int logCate) {
		this.logCate = logCate;
	}

	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getSujbect() {
		return sujbect;
	}

	public void setSujbect(String sujbect) {
		this.sujbect = sujbect;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMovieCodeYoung() {
		return movieCodeYoung;
	}

	public void setMovieCodeYoung(String movieCodeYoung) {
		this.movieCodeYoung = movieCodeYoung;
	}


	@Override
	public String toString() {
		return "LogDto [logDate=" + logDate + ", logCate=" + logCate + ", logId=" + logId + ", sujbect=" + sujbect
				+ ", seq=" + seq + ", userId=" + userId + ", movieCodeYoung=" + movieCodeYoung + ", movieCodeNaver="
				+ movieCodeNaver + "]";
	}


}
