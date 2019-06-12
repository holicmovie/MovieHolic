package com.kitri.dto;

public class UserDto {	//회원정보

	private String userId;		//ID
	private String pass;		//PW
	private String name;		//이름
	private String birth;		//생년월일
	private String gender;		//성별
	private String phoneFirst;	//폰1
	private String phoneMid;	//폰2
	private String phoneLast;	//폰3
	private String joinDate;	//가입일
	private String outDate;		//탈퇴일
	private int enable;			//활성화 여부
	private String profile;		//프로필 사진
	private int list_count;
	private int best_count;
	
	///// 생성자 /////
	
	public int getList_count() {
		return list_count;
	}


	public UserDto(String userId, String profile) {
		super();
		this.userId = userId;
		this.profile = profile;
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



	public UserDto() {
		super();
	}

	
	
	///// getter & setter /////
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getOutDate() {
		return outDate;
	}

	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}



	@Override
	public String toString() {
		return "UserDto [userId=" + userId + ", pass=" + pass + ", name=" + name + ", birth=" + birth + ", gender="
				+ gender + ", phoneFirst=" + phoneFirst + ", phoneMid=" + phoneMid + ", phoneLast=" + phoneLast
				+ ", joinDate=" + joinDate + ", outDate=" + outDate + ", enable=" + enable + ", profile=" + profile
				+ "]";
	}

	
	
}
