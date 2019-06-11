package com.kitri.admin.chart.dto;

import java.util.List;

public class AdminChartDto {

	private String teens;
	private String twenties;
	private String thirties;
	private String fourties;
	private String fifties;
	private List<AdminChartDto> list;
	
	public AdminChartDto() {
		super();
	}
	
	
	


	public AdminChartDto(String teens, String twenties, String thirties, String fourties, String fifties,
			List<AdminChartDto> list) {
		super();
		this.teens = teens;
		this.twenties = twenties;
		this.thirties = thirties;
		this.fourties = fourties;
		this.fifties = fifties;
		this.list = list;
	}


	



	public List<AdminChartDto> getList() {
		return list;
	}

	
	public void setList(List<AdminChartDto> list) {
		this.list = list;
	}

	
	public String getTeens() {
		return teens;
	}


	public void setTeens(String teens) {
		this.teens = teens;
	}


	public String getTwenties() {
		return twenties;
	}


	public void setTwenties(String twenties) {
		this.twenties = twenties;
	}


	public String getThirties() {
		return thirties;
	}


	public void setThirties(String thirties) {
		this.thirties = thirties;
	}


	public String getFourties() {
		return fourties;
	}


	public void setFourties(String fourties) {
		this.fourties = fourties;
	}


	public String getFifties() {
		return fifties;
	}


	public void setFifties(String fifties) {
		this.fifties = fifties;
	}


	@Override
	public String toString() {
		return "AdminChartDto [teens=" + teens + ", twenties=" + twenties + ", thirties=" + thirties + ", fourties="
				+ fourties + ", fifties=" + fifties + "]";
	}
	
	
	
	
	
	
	
}
