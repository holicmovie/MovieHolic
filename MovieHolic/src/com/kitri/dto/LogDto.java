package com.kitri.dto;

public class LogDto { // 활동기록

	private String logDate; // 활동시간
	private int logCate; // 활동분류
	private String logId; // 활동ID
	private String sujbect; // 제목
	private String userId; // 작성자ID

	
	///// 생성자 /////

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



	@Override
	public String toString() {
		return "LogDto [logDate=" + logDate + ", logCate=" + logCate + ", logId=" + logId + ", sujbect=" + sujbect
				+ ", userId=" + userId + "]";
	}

	

}
