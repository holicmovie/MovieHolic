<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
.wrapper{
margin:0;
padding:0;
}
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
	margin:0;
}

/* 구분선 얇은 것 (회색) */
hr.line_light_g {
	background-color: gray;
	position: static;
}
.list-movie{
	background-color: rgb(20,20,20);
	color: white;
}
</style>
</head>
<body class="left-sidebar is-preload">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main -->
<div class="wrapper style1">

	<div class="container bgcolor-yellow">
		<div class="row">
		<div class = "col-lg-1"></div>
		<div class="col-lg-5" id="list-search">
		<%--리스트 이름 작성 --%>
			<h3><label>YOUR LIST</label></h3>
			<div class="col-lg-12">
				<input type="text" class="form-control form-control-lg" placeholder="당신의  추천 리스트 이름을 입력하세요" name="list-name">
			</div>
			<br>
		<%-- 관련 해시태그 작성 --%>
			<h3><label>#HASHTAG</label></h3>
			<div class="col-lg-12">
				<input type="text" class="form-control form-control-lg"
				placeholder="원하는 HASHTAG를 입력하세요" name="hashtag">
				<font color = "gray" size ="4px">최대 10개의 HASHTAG를 입력하실 수 있습니다.</font>
			</div>
			<br>
		<%-- 영화 이름 검색--%>
			<h3><label for = "title_search">TITLE OF MOVIE</label></h3>
			<div class = "col-lg-12">		
			<div class="input-group mb-3">
                <input type="text" class="form-control form-control-lg" placeholder="영화제목을 입력해주세요" id="name" name="name">
                <div class="input-group-append">
                <button type="submit" class="btn btn-primary">SEARCH</button>
                </div>
             </div>
			</div>
			</div>
			<br>
			
			<%-- 영화 리스트 상세 정보 입력 --%>
			<div class="col-lg-5" id="list-description">
				<h3>
					<label for="list-detail-description">ABOUT YOUR FAVORITE MOVIE</label>
				</h3>
				<textarea class="form-control" rows="9" cols="70" style="resize : none;"
					id="list-detail-description">
				</textarea><br>
				<button type="button" class="btn btn-secondary float-right">CANCEL</button>
				<button type="button" class="btn btn-primary float-right">SAVE</button>
			</div>
		</div>
		<br><br>
		
		<%--리스트 영화 목록 추가  --%>
		<div class = "row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10" id="poster-list">
	<h3><label>YOUR MOVIE LIST</label></h3>
	<hr class = "line_bold">
	<div class="list-group" style="background-color: black;">
	  <%--리스트에 추가된 영화  --%>
	  <a href="#" class = "list-movie"><div class = "list-movie"><img src ="/MovieHolic/images/endgame.jpg"  style="float: left" width="50px">엔드게임:2019
	  <button type="button" id="replydelete" class="close" style="color: white">&times;</button>
		</div></a>
	  <hr class = "line_light_w">
	 <%--리스트에 추가된 영화  --%>
	  <div class = "list-movie"><a href="#" class = "list-movie"><img src ="/MovieHolic/images/endgame.jpg"  style="float: left" width="50px">엔드게임:2019
	  <button type="button" id="replydelete" class="close" style="color: white">&times;</button>
		</a></div>
	  <hr class = "line_light_w">
	<%--리스트에 추가된 영화  --%>
	  <div class = "list-movie"><a href="#" class = "list-movie"><img src ="/MovieHolic/images/endgame.jpg"  style="float: left" width="50px">엔드게임:2019
	  <button type="button" id="replydelete" class="close" style="color: white">&times;</button>
		</a></div>

	</div>
	</div>
	
	<div class = "col-lg-1"></div>	
		</div>
		
<br><br><br>
	</div>
</div>
<%@ include file="/template/footer.jsp" %>