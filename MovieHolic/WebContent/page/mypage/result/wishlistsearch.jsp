<%@page import="com.kitri.dto.WishlistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%
			List<WishlistDto> list = (List) request.getAttribute("searchwishlist");
			System.out.println("resultpage : " + list);
			
		%>
		<%
			/* System.out.println(searchedlist); */
			int length = list.size();
		%>
	
		<!-- 영화 포스터 나열 -->
		<%if(length != 0 ){
			for (int i = 0; i < length; i++) {
		%>
<form>
	<div class="row" style = "margin:0 0 20em 0; overflow-y :auto;">
		<div class="col-lg-2 col-6-mobile">
			<input type="checkbox" name = "wishlistdelete" value = "<%=list.get(i).getMovieCodeYoung() %>" class = "wishlistbox">
			<a href=" /MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=list.get(i).getMovieCodeYoung() %>&movieCdNaver=<%=list.get(i).getMovieCodeNaver() %>" class="image featured"><img
				src="<%=list.get(i).getMovieURL()%>" alt="lalaland poster"
				data-toggle="tooltip" data-placement="top" title="<%=list.get(i).getMovieNm()%>(<%=list.get(i).getPrdtYear()%>)"/></a>
		</div>
	</div>
</form>
			<%
				}
			%>
		<%
			} else {%>
			
			<div class="wrapper style1" style = "clear:both;">

				<div class="container" style="text-align: center; margin-bottom: 10em;">
				<img src="/MovieHolic/images/error.png" height="200vh" style="margin-bottom: 5em;">
				<h3 style="margin-bottom: 1em;">검색결과가 없습니다.</h3>
				</div>
			</div>			
			
			
		<%		
			}
		%>