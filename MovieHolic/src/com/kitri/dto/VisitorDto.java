package com.kitri.dto;

import java.sql.Date;

public class VisitorDto {	//접속기록

	private Date connectDate;	//접속날짜
	private int visitor;	//방문자수

	
	///// 생성자 /////
	
	public VisitorDto() {
		super();
	}

	///// getter & setter /////
	
	public Date getConnectDate() {
		return connectDate;
	}

	public void setConnectDate(Date connectDate) {
		this.connectDate = connectDate;
	}

	public int getVisitor() {
		return visitor;
	}

	public void setVisitor(int visitor) {
		this.visitor = visitor;
	}



	@Override
	public String toString() {
		return "VisitorDto [connectDate=" + connectDate + ", visitor=" + visitor + "]";
	}
	
	

}
