package com.kitri.dto;

public class CategoryDto { // 게시판 분류

	private int boardCode; // boardCode
	private String boardName; // 게시판명

	
	///// 생성자 /////
	
	public CategoryDto() {
		super();
	}
	
	
	
	
	///// getter & setter /////
	
	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}



	@Override
	public String toString() {
		return "CategoryDto [boardCode=" + boardCode + ", boardName=" + boardName + "]";
	}

	

}
