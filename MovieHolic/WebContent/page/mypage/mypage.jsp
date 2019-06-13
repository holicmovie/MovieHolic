<%@page import="com.kitri.dto.SocialDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<script>
//----------------처음 로딩할 때----------
$(function(){
	$.ajax({
		url:'/MovieHolic/mypage?page=mypage',
		method:"GET",
		success:function(result){
			$('#mainsection').html(result.trim());
		}
	});
	return false;
});

//--------------following버튼 눌렀을 때----------
$(function(){
	$('#btnfollowers').click(function () {
		$.ajax({
			url:'/MovieHolic/mypage?page=showfollowing',
			method:"GET",
			success:function(result){
				$('#mainsection').html(result.trim());
			}
		});
		return false;
	});
	
	$('#btnmine').click(function () {
		$.ajax({
			url:'/MovieHolic/mypage?page=mypage',
			method:"GET",
			success:function(result){
				$('#mainsection').html(result.trim());
			}
		});
		return false;
	});
	
});
</script>

<style>
<%-- 캐러셀 안의 포스터 공백제거 --%>
.reel>article{
	background-color: black;
}
<%-- 화면 크기 작아지면 가릴 요소들 --%>
@media screen and (max-width: 1205px) {
	.hide1 { display: none; }
	.title { font-size: 20px;}
	.time { display: none; }
} 
@media screen and (max-width: 990px) {
	.hide2 { display: none; }
} 
@media screen and (max-width: 765px) {
	.hide3 { display: none; }
}
<%-- 마우스 올린 행 배경색 변경 --%>
	.table-hover > tbody > tr:hover {
	  background-color: #3a3a3a;
	}
</style>

</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<%-- Header --%>
	<div id="header" style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>
<%String id = (String)session.getAttribute("loginInfo"); %>

<%-- Main --%>
<div class="wrapper style1">

	<div class="container">
	
	<%-- 페이지 이동경로 --%>
		<div class="row" style="margin-bottom:30px;">
			<div class="col-lg-12 col-12-mobile font_light_small">
				<span>✱&nbsp;&nbsp;</span>
				<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
			</div>
		</div>
	
	<%-- **첫번째 행 시작 --%>
		<div class="row" style="margin-bottom: 5%; margin-top: 10px;">
			<div class="aaa col-lg-12 col-mobile-12">
			<%-- 탭 메뉴 시작--%>
				<%-- 탭 2개 선언 --%>
				<button class="btn btn-success font_bold_small" id= "btnmine">Mine</button>
				<button class="btn btn-success font_bold_small" id = "btnfollowers">Following</button>
				
				<%-- 탭 페이지 2개 구성 --%>
				<div>
			  		<section id = "mainsection"></section>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/template/footer.jsp" %>