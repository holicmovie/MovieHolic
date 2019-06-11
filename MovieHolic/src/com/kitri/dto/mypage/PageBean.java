package com.kitri.dto.mypage;

import java.util.List;

import com.kitri.dto.*;

/**
 * 페이지별 JAVA BEAN
 * 
 * @author Administrator
 *
 */
public class PageBean {
	private int cntPerPage = 5;// 페이지별 보여줄 목록수
	private int startRow = 1;// 시작행
	private int endRow = 1;// 끝행
	private List<SocialDto> list;// 목록
	private List<BoardDto> board;// 목록
	private int totalPage=1;// 총 페이지 수
	private int totalCnt;// 총 게시글 수
	private int cntPerPageGroup;// 페이지그룹에 보여줄 페이지 수
	private int startPage;// 페이지그룹의 시작페이지
	private int endPage;// 페이지 그룹의 끝 페이지
	private String url;// 페이지 링크 클릭시 요청할 url
	private int currentPage;// 현재페이지
	private List<WishlistDto> wlist;
	
	public PageBean() {
	}

	public PageBean(int currentPage, int cntPerPage, int cntPerPageGroup, int totalCnt, String url ) {
		super();
		this.cntPerPage = cntPerPage;
		this.totalCnt = totalCnt;
		this.cntPerPageGroup = cntPerPageGroup;
		this.url = url;
		this.currentPage = currentPage;
		execute();
	}

	private void execute() {
		startRow = 1 + cntPerPage*(currentPage - 1);
		endRow = cntPerPage*currentPage;
		totalPage = (int)(Math.ceil((float)totalCnt/cntPerPage));
		startPage = ((currentPage - 1) / cntPerPageGroup) * cntPerPageGroup + 1;
		endPage = startPage + cntPerPageGroup - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public List<SocialDto> getList() {
		return list;
	}

	public void setList(List<SocialDto> list) {
		this.list = list;
	}

	public List<BoardDto> getBoard() {
		return board;
	}

	public void setBoard(List<BoardDto> board) {
		this.board = board;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getCntPerPageGroup() {
		return cntPerPageGroup;
	}

	public void setCntPerPageGroup(int cntPerPageGroup) {
		this.cntPerPageGroup = cntPerPageGroup;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<WishlistDto> getWlist() {
		return wlist;
	}

	public void setWlist(List<WishlistDto> wlist) {
		this.wlist = wlist;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



}
