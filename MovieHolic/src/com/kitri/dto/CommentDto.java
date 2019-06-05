package com.kitri.dto;

public class CommentDto { // 댓글

	private String postDate; // 작성일
	private String postDateY; // 작성일
	private int seq; // 글번호
	private String userId; // 작성자ID
	private String content; // 내용

	
	///// 생성자 /////
	
	public CommentDto() {
		super();
	}

	
	///// getter & setter /////
	
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
		return "CommentDto [postDate=" + postDate + ", postDateY=" + postDateY + ", seq=" + seq + ", userId=" + userId
				+ ", content=" + content + "]";
	}


	



	


	
	
}
