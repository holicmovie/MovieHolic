<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp" %>

<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<style>
<!-- 좋아요 둥근 버튼을 위해 필요 -->
.btn-circle.btn-xl {
    width: 50px;
    height: 50px;
    padding: 10px 10px;
    border-radius: 35px;
    font-size: 25px;
    line-height: 1.33;
}
.btn-circle {
    width: 50px;
    height: 50px;
    padding: 10px 10px;
    border-radius: 35px;
    text-align: center;
    font-size: 25px;
    line-height: 1.42857;
}
.comment{
	border-right-color: lightgray;
	border-right-style: solid;
}
</style>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

<!-- Main -->
<div class="wrapper style1">
	<div class = "row">
	<!-- 글 제목 밑 상태 바 -->
	<div class = "col-lg-2"></div>
	<div class = "col-lg-8" id = "listdetail-title">
		<div class = "col-lg-12"><h2 style = "bold">우울할 때 보는 영화 10선</h2></div>
		<div align ="right" style="width: 100%; border-top: thin solid gray; border-bottom:thin solid gray;">
		<h3>2019.05.21</h3>
		</div>
	</div>
	<div class = "col-lg-2"></div>
	</div>
	
	<div class = "row">
	<!-- 리스트 상세 내용  포스터 + 글 내용 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
	<div style="float:right;"><a href = "">신고하기</a></div><br>
	<div>
	<p><font>지극히 주관적으로 선정한 우울할 때 보면 좋은 영화 10선 입니다. 
	주인공들의 대사가 개인적으로 너무 마음에 들었구요,
	감독들이 의도를 가지고 표현한 각 장면이 너무 감명 깊었습니다.</font></p>
	<img src = "/MovieHolic/images/avengers.png" width = "200px">
	<img src = "/MovieHolic/images/benisback.jpg" width = "200px">
	<img src = "/MovieHolic/images/girlcops.jpg" width = "200px">
	<img src = "/MovieHolic/images/myspecialbrother.jpg" width = "200px">
	<br>
	 <font style = "color : gray">#한시반감성#울고싶을때보는영화#감동</font>
	</div>
	</div>	
	<div class = "col-lg-2"></div>	
	</div>

	<div class = "row">
	<!--가운데에 좋아요 누르는 기능 -->
	<div class = "col-lg-5"></div>	
	<div class = "col-lg-2">
	<span>
		<button type="button" class="btn btn-danger btn-circle btn-lg">
		<i class="far fa-thumbs-up"></i></button>
		<span style="margin-left:10px; font-size:20px; font-weight:bold;">200</span>
		<button type="button" class="btn btn-danger btn-circle btn-lg" style="background:skyblue; border-color:skyblue; margin-left:15px;">
		<i class="far fa-thumbs-down"></i></button>
		<span style="margin-left:10px; font-size:20px; font-weight:bold;">21</span>
	</span>
	</div>
	<div class = "col-lg-5"></div>		
	</div>	
</div>

	
<div class = "row">
	<!-- 댓글 보기 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8" style="width: 100%; border-bottom: 0px; border-top: thin solid gray; margin-top:0;">
		<span class = "comment"><img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:30px;"/> 
		 song11</span> 
		<span>와 ㅠㅠ 완전 공감해요.... 제대로 새벽 한시 반 감성 ㅠㅠ</span>
	</div>
	<div class = "col-lg-2"></div>	

	<!-- 댓글 보기 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8" style="width: 100%; border-bottom: 0px; border-top: thin solid gray;">
		<span class = "comment"><img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:30px;"/> 
		 song11</span> 
		<span>와 ㅠㅠ 완전 공감해요.... 제대로 새벽 한시 반 감성 ㅠㅠ</span>
	</div>
	<div class = "col-lg-2"></div>
	
	<%--댓글 작성 row--%>	
	<div class = "col-lg-2"></div>
	
	<%--댓글 작성 textarea --%>
	<div class = "col-lg-8">
	<label for="comment">Comment</label>
  	<textarea class="form-control" rows="5" id="comment" style="resize : none;" placeholder = "댓글을 입력해주세요"></textarea>
	<button type = "button" class = "btn btn-sm btn-primary float-right">등록</button>
	</div>
	<div class = "col-lg-2"></div>
</div>
	
	
	

<br><br><br>
<%@ include file="/template/footer.jsp" %>