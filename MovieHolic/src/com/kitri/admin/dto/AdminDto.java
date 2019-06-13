package com.kitri.admin.dto;

import java.util.Date;

public class AdminDto {
	
	
	
	
	int cnt; // 탈퇴시 성공
	private String text; // 검색어 값(꼼수)
	private String index; // 검색어 종류(꼼수)
	private String userId;
	private String name;
	private String pass;
	private String phoneFirst;
	private String phoneMid;
	private String phoneLast;
	private String birth;
	private String gender;
	private Date joinDate;
	private Date outdate;
	private String profile;
	private int enable;
	
	public AdminDto() {}

	public AdminDto(String userId, String name, String pass, String phoneFirst, String phoneMid, String phoneLast,
			String birth, String gender, Date joinDate, Date outdate, String profile, int enable) {
		super();
		this.userId = userId;
		this.name = name;
		this.pass = pass;
		this.phoneFirst = phoneFirst;
		this.phoneMid = phoneMid;
		this.phoneLast = phoneLast;
		this.birth = birth;
		this.gender = gender;
		this.joinDate = joinDate;
		this.outdate = outdate;
		this.profile = profile;
		this.enable = enable;
	}



	


	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPhoneFirst() {
		return phoneFirst;
	}

	public void setPhoneFirst(String phoneFirst) {
		this.phoneFirst = phoneFirst;
	}

	public String getPhoneMid() {
		return phoneMid;
	}

	public void setPhoneMid(String phoneMid) {
		this.phoneMid = phoneMid;
	}

	public String getPhoneLast() {
		return phoneLast;
	}

	public void setPhoneLast(String phoneLast) {
		this.phoneLast = phoneLast;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getOutdate() {
		return outdate;
	}

	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	@Override
	public String toString() {
		return "AdminDto [userId=" + userId + ", name=" + name + ", pass=" + pass + ", phoneFirst=" + phoneFirst
				+ ", phoneMid=" + phoneMid + ", phoneLast=" + phoneLast + ", birth=" + birth + ", gender=" + gender
				+ ", joinDate=" + joinDate + ", outdate=" + outdate + ", profile=" + profile + ", enable=" + enable
				+ "]";
	}

	
	
	
}
