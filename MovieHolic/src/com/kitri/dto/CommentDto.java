package com.kitri.dto;

import java.sql.Date;

public class CommentDto { // 댓글

	private Date postDate; // 작성일
	private int seq; // 글번호
	private String userId; // 작성자ID
	private String content; // 내용

	
	///// 생성자 /////
	
	public CommentDto() {
		super();
	}

	
	
	
	///// getter & setter /////
	
	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}




	@Override
	public String toString() {
		return "CommentDto [postDate=" + postDate + ", seq=" + seq + ", userId=" + userId + ", content=" + content
				+ "]";
	}


	
	
}
