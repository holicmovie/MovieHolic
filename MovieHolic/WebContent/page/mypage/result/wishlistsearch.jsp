<%@page import="com.kitri.dto.WishlistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<%
		List<WishlistDto> searchedlist = (List) request.getAttribute("searchwishlist");
		System.out.println("resultpage : " + searchedlist);
	%>
	<%
		System.out.println(searchedlist);
		int length = searchedlist.size();
	%>


	<!-- 영화 포스터 나열 -->
	<%
		for (int i = 0; i < length; i++) {
	%>
	<div class="col-lg-2 col-6-mobile">
		<input type="checkbox">
		<a href=" /MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=searchedlist.get(i).getMovieCodeYoung() %>&movieCdNaver=<%=searchedlist.get(i).getMovieCodeNaver() %>" class="image featured"><img
			src="<%=searchedlist.get(i).getMovieURL()%>" alt="lalaland poster"
			data-toggle="tooltip" data-placement="top" title="<%=searchedlist.get(i).getMovieNm()%>(<%=searchedlist.get(i).getOpenYear()%>)"/></a>
	</div>
	<%
		}
	%>

</div>