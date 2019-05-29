package com.kitri.dto;

import java.sql.Date;

public class SocialDto { // 소셜

	private String userId; // ID
	private Date postDate; // 등록일자
	private String followingId; // followingID

	
	///// 생성자 /////
	
	public SocialDto() {
		super();
	}

	
	///// getter & setter /////
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getFollowingId() {
		return followingId;
	}

	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}

	

	@Override
	public String toString() {
		return "SocialDto [userId=" + userId + ", postDate=" + postDate + ", followingId=" + followingId + "]";
	}

	
	
	
}
