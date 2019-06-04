package com.kitri.dto;

public class WishCateDto {	//위시리스트 분류

	private int code;	//code
	private String category;	//분류명

	
	///// 생성자 /////
	
	public WishCateDto() {
		super();
	}

	
	///// getter & setter /////
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	

	@Override
	public String toString() {
		return "WishlistCateDto [code=" + code + ", category=" + category + "]";
	}
	
	
	

}
