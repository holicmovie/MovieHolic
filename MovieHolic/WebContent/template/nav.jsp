<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
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
				<li><a href="/MovieHolic/film?act=viewfilmlist">FILMS</a>
				</li>
				<li><a href="/MovieHolic/page/list/movielist.jsp">LISTS</a></li>
				<li>
					<a href="/MovieHolic/mypage?page=mypage">MY PAGE</a>
					<ul>
						<li><a href="/MovieHolic/mypage?page=mypage">MY PAGE</a></li>
						<li><a href="/MovieHolic/mypage?page=preference">MY MOVIE CHART</a></li>
						<li><a href="/MovieHolic/mypage?page=wishlist">WISH LIST</a></li>
						<li><a href="/MovieHolic/mypage?page=diary">DIARY</a></li>
						<li><a href="/MovieHolic/mypage?page=social">SOCIAL</a></li>
						<li><a href="/MovieHolic/mypage?page=setting">SETTING</a></li>
					</ul>
				</li>
				<li>
					<a href="/MovieHolic/admin?act=alllist&notify=notify">MANAGEMENT</a>
					<ul>
						<li><a href="/MovieHolic/admin?act=alllist&notify=notify">MANAGEMENT</a></li>
						<li><a href="/MovieHolic/page/admin/statistics.jsp">STATISTICS</a></li>
					</ul>
				</li>
				<li class="none"><a href="#"></a></li>
				<li><a href="#" style="color: rgb(240, 195, 15)">LOGIN</a></li>
				<li><a href="#" style="color: rgb(240, 195, 15)">JOIN</a></li>
				<li>
						<input type="text" class="form-control" id="navSrc" style="background-image:/MovieHolic/images/searchb.png" placeholder="제목으로 검색">
				</li>
			</ul>
		</nav>