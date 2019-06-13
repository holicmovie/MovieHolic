<%@page import="com.kitri.dto.WishlistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<%
			List<WishlistDto> list = (List) request.getAttribute("wishlist");
		int length = list.size();
		if(length != 0){
		
		%>


<form>
	<div class="row" style = "margin:0 0 20em 0; overflow-y :auto;">
		
	
	
		<!-- 영화 포스터 나열 -->
		<%
			for (int i = 0; i < length; i++) {
		%>
		<div class="col-lg-2 col-6-mobile movieposter">
			<input type="checkbox" name = "wishlistdelete" value ="<%=list.get(i).getMovieCodeYoung()%>" class = "wishlistcheckbox">
			<a href="/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=list.get(i).getMovieCodeYoung() %>&movieCdNaver=<%=list.get(i).getMovieCodeNaver() %>" class="image featured"><img
				src="<%=list.get(i).getMovieURL()%>" alt="<%=list.get(i).getMovieNm() %> poster"
				data-toggle="tooltip" data-placement="top" title="<%=list.get(i).getMovieNm()%>(<%=list.get(i).getOpenYear()%>)"/></a>
		</div>
		<%
			}
		%>
	
	</div>
	
	<%
		} else {
	%>
	<div class="wrapper style1">

	<div class="container" style="text-align: center; margin-bottom: 10em;">
		<img src="/MovieHolic/images/error.png" height="200vh" style="margin-bottom: 5em;">
		<h2 style="margin-bottom: 1em;">WishList에 담긴 영화가 없습니다.</h2>
	</div>
</div>
	
	<%
	} 
	%>
</form>