package com.kitri.dto;

import java.sql.Clob;
import java.util.Date;

public class UserDto {
	
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
	private Clob profile;
	
	
	
	
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
	public Clob getProfile() {
		return profile;
	}
	public void setProfile(Clob profile) {
		this.profile = profile;
	}
	
	
}
