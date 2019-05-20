<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<style>
<!-- 좋아요 둥근 버튼을 위해 필요 -->
.btn-circle.btn-xl {
    width: 70px;
    height: 70px;
    padding: 10px 16px;
    border-radius: 35px;
    font-size: 35px;
    line-height: 1.33;
}
.btn-circle {
    width: 70px;
    height: 70px;
    padding: 6px 0px;
    border-radius: 30px;
    text-align: center;
    font-size: 40px;
    line-height: 1.42857;
}
.comment{
	border-right-color: lightgray;
	border-right-style: solid;
}
</style>
<%@ include file="/template/nav.jsp" %>

<!-- Main -->
<div class="wrapper style1">
	<div class = "row">
	<!-- 글 제목 밑 상태 바 -->
	<div class = "col-lg-2"></div>
	<div class = "col-lg-8" id = " listdetail-title">
	<h2 style = "bold">우울할 때 보는 영화 10선</h2>
	</div>
	<div class = "col-lg-2"></div>
	</div>
	
	<!-- 제목 구분선 -->
	<div class = "col-lg-2"></div>
	<div class = "col-lg-8">
	<span style = "border-bottom-style: solid; border-bottom-color: lightgray">   </span>
	</div>
	<div class = "col-lg-2"></div>
	
	<div class = "row">
	<!-- 리스트 상세 내용  포스터 + 글 내용 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
	<p><font>지극히 주관적으로 선정한 우울할 때 보면 좋은 영화 10선 입니다. 
	주인공들의 대사가 개인적으로 너무 마음에 들었구요,
	감독들이 의도를 가지고 표현한 각 장면이 너무 감명 깊었습니다.</font></p>
	<img src = "/MovieHolic/images/avengers.png" width = "200px">
	<img src = "/MovieHolic/images/benisback.jpg" width = "200px">
	<img src = "/MovieHolic/images/girlcops.jpg" width = "200px">
	<img src = "/MovieHolic/images/myspecialbrother.jpg" width = "200">
	<br>
	 <font style = "color : gray">#한시반감성#울고싶을때보는영화#감동</font>
	</div>	
	<div class = "col-lg-2"></div>	
	</div>
	<br><br>

	<div class = "row">
	<!--가운데에 좋아요 누르는 기능 -->
	<div class = "col-lg-5"></div>	
	<div class = "col-lg-2">
	<div style="height: 60px; line-height: 60px;">
	<span>
		<button type="button" class="btn btn-danger btn-circle btn-lg">
		<i class="far fa-thumbs-up"></i>
		</button><span style="margin-left:10px; font-size:30px; font-weight:bold;">200</span>
	</span>
	
	<span>
		<button type="button" class="btn btn-danger btn-circle btn-lg" style="background:skyblue; border-color:skyblue; margin-left:15px;">
		<i class="far fa-thumbs-down"></i>
		</button><span style="margin-left:10px; font-size:30px; font-weight:bold;">21</span>
	</span>
	</div>
	</div>	
	<div class = "col-lg-5"></div>		
	</div>

	<div class = "row">
	<!-- 리스트 상세 내용  포스터 + 글 내용 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
		<hr>
	</div>	
	<div class = "col-lg-2"></div>	
	</div>
	<span style="border:thin solid lightgray; margin-left:10px;"></span>
	
	<div class = "row">
	<!-- 댓글 달기 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
		<span class = "comment"><img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:30px;"/> 
		 song11</span> 
		<span>와 ㅠㅠ 완전 공감해요.... 제대로 새벽 한시 반 감성 ㅠㅠ</span>
	</div>	
	<div class = "col-lg-2"></div>	
	</div>
	
	<div class = "row">
	
	<!-- 댓글 달기 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
		<span class = "comment"><img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:30px;"/> 
		 song11</span> 
		<span><font>와 ㅠㅠ 완전 공감해요.... 제대로 새벽 한시 반 감성 ㅠㅠ</font></span>
	</div>	
	<div class = "col-lg-2"></div>	
	</div>

</div>

<%@ include file="/template/footer.jsp" %>