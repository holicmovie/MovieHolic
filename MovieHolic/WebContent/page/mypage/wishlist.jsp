<%@page import="java.io.Console"%>
<%@page import="com.kitri.dto.WishlistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
	position: static;
}
</style>
<%--JQUERY사용하기 위한 URL --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%--연도 셀렉트 박스 값 컨트롤러로 보내기 --%>
<%
	List<WishlistDto> list = (List) request.getAttribute("wishlist");
%>

<script>
	/* 처음 로딩할때 위시리스트 보여주기 */
$(function() {
	$.ajax({
		url : "/MovieHolic/mypage",
		method : "GET",
		data : "page=wishlist",
		success : function(result) {
			$("#wishlistsection").html(result.trim());
		/* 	alert("wishlist 잘넘어옴"); */
		}

	});
	return false;
});
	/* 위시리스트 제목으로 검색 */
$(function() {
	var searchmovie = $('#searchmovie');
		$(searchmovie).keypress(function(event) {
							/* alert("검색시작!"); */
			if (event.which == 13) { 
				if (searchmovie.val() != "") {
		<%-- 검색어가 공백이 아닌 경우 srchKey로 받아옴 --%>
			var srchKey = searchmovie.val();
				$.ajax({
				url : "/MovieHolic/mypage?wishlist=search&srchKey="+ srchKey,
				method : 'get',
				success : function(result) {
				$("#wishlistsection").html(result);
				/* alert("검색 완료 !!!"); */
			}
		});
	} else {
		alert("검색결과가 없습니다");
		return;
	}
	return false;
		}
	});
});
	
// checkbox로 삭제하기 
$(function () {
    $('#btndelete').click(function () {
      // getter
      var chkval = $('input[name="wishlistdelete"]:checked');
      var flag = confirm("정말 삭제하시겠습니까?");	
		if(flag == true){     

      $.ajax({
			url: '/MovieHolic/mypage?page=wishlist',
			method: 'post',
			data: chkval,
			success:function(result){
				  location.href = '/MovieHolic/page/mypage/wishlist.jsp';   
			 alert("삭제되었습니다!");
			}
		});
		return false;  
   }else{
	   return;
   }
   	});
    $('#showall').click(function () {
    	location.href = '/MovieHolic/page/mypage/wishlist.jsp'; 
    	
    });
}); 
<%String id = (String)session.getAttribute("loginInfo");%>
</script>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header"
			style="background-image: none; margin-bottom: 0px; padding-bottom: 0; height: 10px;">
			<%@ include file="/template/nav.jsp"%>
		</div>
		<!-- Main 시작-->
		<div class="wrapper style1">

			<div class="container">

				<%-- 페이지 이동경로 --%>
				<div class="row" style="margin-bottom: 30px;">
					<div class="col-lg-12 col-12-mobile font_light_small">
						<span>✱&nbsp;&nbsp;</span> <a
							href="/MovieHolic/page/mypage/mypage.jsp" style="color: white;">My
							Page</a> <span>&nbsp;&nbsp;>>&nbsp;&nbsp;</span> <a
							href="/MovieHolic/page/mypage/wishlist.jsp"
							class="font_bold_small">Wish List</a>
					</div>
				</div>
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">

					<div class="col-lg-12 col-12-mobile">
						<h2>Wish List</h2>
						<hr class="line_bold">
					</div>

				</div>
				<!-- **첫번째 행 끝 -->

				<!-- **두번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%;">

					<!-- 조회 조건 -->
					<div class="col-lg-6 col-12-moblile"></div>

					<div class="col-lg-2 col-4-moblile">
						<!-- <select class="form-control form-control-sm" id = "wishlistyear">
								<option value = "all">기간별-전체</option>
								<option value = "1">2015~2019</option>
								<option value = "2">2010~2014</option>
								<option value = "3">2005~2009</option>
								<option value = "4">2000~2004</option>
								<option value = "5">1995~1999</option>
								<option value = "6">1990~1995</option>
								<option value = "7">before1990s</option>
							</select> -->
					</div>
					<div class="col-lg-1 col-4-moblile"
					style="float: right; clear: both;">
						<button class="btn btn-success font_bold_small" id="showall">전체보기</button>
					</div>
					<div class="col-lg-1 col-4-moblile"
						style="float: right; clear: both;">
						<button class="btn btn-success font_bold_small" id="btndelete">삭제</button>
						<!-- <select class="form-control form-control-sm" id = "wishlistgenre">
								<option value = "all">전체</option>
								<option value = "1">액션</option>
								<option value = "2">어드벤처</option>
								<option value = "3">멜로</option>
								<option value = "4">로맨스</option>
								<option value = "5">코미디</option>
								<option value = "6">드라마</option>
								<option value = "7">가족</option>
								<option value = "8">범죄</option>
								<option value = "9">미스터리</option>
								<option value = "10">스릴러</option>
								<option value = "11">공포(호러)</option>
								<option value = "12">판타지</option>
								<option value = "13">SF</option>
								<option value = "14">뮤지컬</option>
								<option value = "15">사극</option>
								<option value = "16">전쟁</option>
								<option value = "17">애니메이션</option>
								<option value = "18">다큐멘터리</option>
								<option value = "19">공연</option>
								<option value = "20">기타</option>		
							</select> -->
					</div>

					<div class="col-lg-2 col-12-mobile" style="float: right;">
						<input type="text" class="form-control" id="searchmovie"
							style="background-image: /MovieHolic/images/searchb.png"
							placeholder="영화 제목으로 검색">
					</div>

				</div>
				<!-- **두번째 행 끝 -->

				<!-- **세번째 행 시작 -->
				<section id="wishlistsection">

					<!-- **세번째 행 끝 -->


					<!-- **네번째 행 끝 -->
				</section>
			</div>

		</div>
		<!-- Main 끝-->

		<!-- 커스텀 툴팁 추가위해 필요 -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip();
			});
		</script>
		<%@ include file="/template/footer.jsp"%>