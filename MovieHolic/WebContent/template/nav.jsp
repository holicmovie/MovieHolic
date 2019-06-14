<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userid = (String)session.getAttribute("loginInfo");%>  
	<!-- Nav -->
		<nav id="nav" style="z-index: 999;">
			<ul>
				<li><a href="/MovieHolic/film"><img src="/MovieHolic/images/movieholic.png" width="20em">&nbsp;&nbsp;MOVIEHOLIC</a></li>
				<li class="none"><a></a></li>
				<li class="none"><a></a></li>
				<li class="none"><a></a></li>
				<li class="none"><a></a></li>
				<li class="none"><a></a></li>
				<li><a href="/MovieHolic/film">HOME</a></li>
				<li><a href="/MovieHolic/page/film/moviefilm.jsp">FILMS</a>
				</li>
				<li><a href="/MovieHolic/list?act=sortList">LISTS</a></li>
				<%if(userid != null) {%>
				<li>
					<a href="/MovieHolic/page/mypage/mypage.jsp">MY PAGE</a>
					<ul>
						<li><a href="/MovieHolic/page/mypage/mypage.jsp">MY PAGE</a></li>
						<li><a href="/MovieHolic/mypage?page=preference">MY MOVIE CHART</a></li>
						<li><a href="/MovieHolic/page/mypage/wishlist.jsp">WISH LIST</a></li>
						<li><a href="/MovieHolic/mypage?page=diary">DIARY</a></li>
						<li><a href="/MovieHolic/page/mypage/social.jsp">SOCIAL</a></li>
						<li><a href="/MovieHolic/mypage?page=setting">SETTING</a></li>
					</ul>
				</li>
				<% } %>
				
				<% if(userid != null) {%>
					<% if(userid.equals("admin")) {%>
				<li><a href="/MovieHolic/admin?act=alllist&notify=notify">MANAGEMENT</a></li>
					<%-- <li><a href="/MovieHolic/page/adminchart/statistics.jsp">STATISTICS</a></li> --%>
					<%} %>
				<%} %>
				
				<li class="none"><a href="#"></a></li>
				<% if(userid != null){ %>
				<li><a href="/MovieHolic/UsersFrontController?act=logout" style="color: rgb(240, 195, 15)">LOGOUT</a></li>
				<%} else { %>
				<li><a href="/MovieHolic/page/user/login.jsp" style="color: rgb(240, 195, 15)">LOGIN</a></li>
				<li><a href="/MovieHolic/page/user/signup.jsp" style="color: rgb(240, 195, 15)">JOIN</a></li>
				<%} %>
				<li>
						<input type="text" class="form-control" id="navSrc" style="background-image:/MovieHolic/images/searchb.png" placeholder="제목으로 검색">
				</li>
			</ul>
		</nav>