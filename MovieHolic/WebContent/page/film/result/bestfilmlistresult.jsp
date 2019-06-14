<%@page import="com.kitri.dto.FilmDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<FilmDto> bestfilm = (List<FilmDto>) request.getAttribute("bestfilmlist");
String root = request.getContextPath();
%>

<%
for(int i = 0; i < bestfilm.size(); i++){
%>
	<article style="background-color: rgb(3, 39, 49);">
	<div class="interated_network_movie_info_img">
		<span class="movie_ranking_number" id="rankNum"><%=(i+1)%></span>
					<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=bestfilm.get(i).getMovieCdYoung()%>&movieCdNaver=<%=bestfilm.get(i).getMovieCdNaver()%>" class="image featured">
						<img style="vertical-align: middle;" src="<%=bestfilm.get(i).getMovieImage()%>" alt="<%=bestfilm.get(i).getMovieNm()%> 포스터" />
					</a>
	</div>
					<header>
						<h5 class="font_bold_small">
							<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=bestfilm.get(i).getMovieCdYoung()%>&movieCdNaver=<%=bestfilm.get(i).getMovieCdNaver()%>" 
								style="color: white;"><%=bestfilm.get(i).getMovieNm()%></a>
						</h5>
					</header>
				</article>

<%
}
%>
	