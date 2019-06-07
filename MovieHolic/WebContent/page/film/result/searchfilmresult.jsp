<%@page import="com.kitri.dto.FilmDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<FilmDto> favoritefilm = (List<FilmDto>) request.getAttribute("searchedFilmList");
String root = request.getContextPath();
%>
<%
	for(int i = 0; i < favoritefilm.size(); i++) {
	%>
					<!-- 총 영화 5개 -->
					<!-- 영화 한 개 start -->
					<div class="col-lg-2 col-4-mobile"
						style="float: left; margin: 0.5em 0.5em 0.5em 0.5em; padding: 2px; border: 2px solid; border-color: white;">
						
						<a href="<%=root%>/page/film?act=viewfilmdetail&<%=favoritefilm.get(i).getMovieCdYoung()%>" class="image featured" style="margin: 0;">
							<img src="<%=favoritefilm.get(i).getMovieImage()%>" alt="<%=favoritefilm.get(i).getMovieNm()%> 포스터 이미지">
						</a>
						
						<header style="text-align: center; background-color: white; margin: 0;">
							<h6 style="background-color: black;">
								<a href="<%=root%>/page/film?act=viewfilmdetail&<%=favoritefilm.get(i).getMovieCdYoung()%>"><%=favoritefilm.get(i).getMovieNm()%></a>
							</h6>
						</header>
						
					</div>
					<!-- 영화 한 개 end -->
	<%
	}
	%>