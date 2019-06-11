<%@page import="com.kitri.dto.WishlistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<div class="row">
	<%
		List<WishlistDto> list = (List) request.getAttribute("wishlist");
	%>
	<%
		System.out.println(list);
		int length = list.size();
	%>


	<!-- 영화 포스터 나열 -->
	<%
		for (int i = 0; i < length; i++) {
	%>
	<div class="col-lg-2 col-6-mobile movieposter">
		<input type="checkbox" name = "wishlistdelete" value ="<%=list.get(i).getMovieCodeYoung()%>">
		<a href=" /MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=list.get(i).getMovieCodeYoung() %>&movieCdNaver=<%=list.get(i).getMovieCodeNaver() %>" class="image featured"><img
			src="<%=list.get(i).getMovieURL()%>" alt="lalaland poster"
			data-toggle="tooltip" data-placement="top" title="<%=list.get(i).getMovieNm()%>(<%=list.get(i).getOpenYear()%>)"/></a>
	</div>
	<%
		}
	%>

</div>
