package com.kitri.dto;

public class SocialDto { // 소셜

	private String userId; // ID
	private String postDate; // 등록일자
	private String followingId; // followingID
	private int list_count;
	private int best_count;
	private String name;
	private int no;
	private String followerId;
	
	public String getFollowerId() {
		return followerId;
	}


	public void setFollowerId(String followerId) {
		this.followerId = followerId;
	}

	
	///// 생성자 /////
	
	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getList_count() {
		return list_count;
	}


	public void setList_count(int list_count) {
		this.list_count = list_count;
	}


	public int getBest_count() {
		return best_count;
	}


	public void setBest_count(int best_count) {
		this.best_count = best_count;
	}


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

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
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
		return "SocialDto [userId=" + userId + ", postDate=" + postDate + ", followingId=" + followingId
				+ ", list_count=" + list_count + ", best_count=" + best_count + ", name=" + name + ", no=" + no
				+ ", followerId=" + followerId + "]";
	}



	
	


}
