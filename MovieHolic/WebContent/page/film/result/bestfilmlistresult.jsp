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

				<article style="background-color: rgb(3, 39, 49); color: white;">
					<a href="/MovieHolic/page/film/moviedetail.jsp"
						class="image featured">
						<img src="<%=bestfilm.get(i).getMovieImage()%>" alt="<%=bestfilm.get(i).getMovieNm()%> 포스터" />
					</a>
					<header>
						<h5>
							<a href="/MovieHolic/page/film/moviedetail.jsp"
								style="color: white;"><%=bestfilm.get(i).getMovieNm()%></a>
						</h5>
					</header>
				</article>

<%
}
%>