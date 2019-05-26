<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main -->
<div class="wrapper style1">

	<div class="container bgcolor-yellow">
		<div class="row">
		<div class = "col-lg-1"></div>
		<div class="col-lg-4" id="list-search">
			<h3><label>YOUR LIST</label></h3>
			<div class="col-lg-12">
				<input type="text" class="form-control form-control-lg" placeholder="당신의  추천 리스트 이름을 입력하세요" name="list-name">
			</div>
			<br>
			<h3><label>#HASHTAG</label></h3>
			<div class="col-lg-12">
				<input type="text" class="form-control form-control-lg"
				placeholder="원하는 HASHTAG를 입력하세요" name="hashtag">
				<font color = "gray" size ="4px">최대 10개의 HASHTAG를 입력하실 수 있습니다.</font>
			</div>
			<br>
			<h3><label for = "title_search">TITLE OF MOVIE</label></h3>
			<div class = "col-lg-12">		
			<!--  <input type="text" class="form-control form-control-lg mr-lg-2" placeholder="영화 제목 입력" name="title-search">
			<button type = "button" class= "btn btn-lg btn-primary">SEARCH</button>-->
			<div class="input-group mb-3">
                <input type="text" class="form-control form-control-lg" placeholder="영화제목을 입력해주세요" id="name" name="name">
                <div class="input-group-append">
                <button type="submit" class="btn btn-primary">SEARCH</button>
                </div>
             </div>
			</div>
			</div>
			<br>
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
		<div class = "row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10" id="poster-list">
	<h3><label>YOUR MOVIE LIST</label></h3>
	<div class="list-group">
	<ul class="list-group list-group-horizontal">
	  <li class="list-group-item"><div>
	   엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item"><div>
	   엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item"><div>
	   엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item"><div>
	   엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item"><div>
	   엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
			 
	</ul>
	<ul class="list-group list-group-horizontal">
	  <li class="list-group-item">
	  <div>엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item">
	  <div>엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item">
	  <div>엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	  <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item">
	  <div>엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	  <li class="list-group-item">
	  <div>엔드게임<button class = "btn btn-sm" style ="position : absolute;">x</button><br>
	   <img src = "/MovieHolic/images/avengers.png" onmouseover = "">
	  </div>
	  </li>
	</ul>
			<!-- <a href="#" class="list-group-item list-group-item-action">엔드게임</a>
	<a href="#" class="list-group-item list-group-item-action">인피니티 워</a>
			<a href="#" class="list-group-item list-group-item-action">토르</a> -->
	</div>
		</div>
		</div>
	</div>
</div>

<%@ include file="/template/footer.jsp" %>