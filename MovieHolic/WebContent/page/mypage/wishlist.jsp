<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
}
</style>
<%--JQUERY사용하기 위한 URL --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<%--연도 셀렉트 박스 값 컨트롤러로 보내기 --%>
<script>

$(function(){
	
	$("#wishlistgenre").click(function(){
	var genre = $("#wishlistgenre option:selected").val();
	alert(genre);
	$.ajax({
		url:"/MovieHolic/mypage",
		method:"GET",
		data:"choice=genre&genreno="+genre,
		/* success:function(result){
			 $("section").html(result.trim()); 
		} */
	});
	return false;
	}); 
	
	$("#wishlistyear").click(function(){
	var year = $("#wishlistyear option:selected").val();
		alert(year);
				$.ajax({
					url:"/MovieHolic/mypage",
					method:"GET",
					data:"choice=year&time="+year,
					/* success:function(result){
						 $("section").html(result.trim()); 
					} */
				});
				return false;
			}); 
});  


/* 
$(function(){
	$("#followings>page-link a").click(function(){
		alert("눌렸다!");
		var currentpage=$(this).attr("href");
		alert(currentPage+"페이지를 보여줍니다.");
		 $.ajax({
			url:'mypage?page=social&followingpage='+currentpage,
			method:"GET",
			success:function(result){
				$("section").html(result.trim());
			}
		});
		return false;
	});  
});   */

/* $(function(){
		 $.ajax({
			url:'/MovieHolic/mypage?page=social',
			method:"GET",
			success:function(result){
				alert("wishlist"),
				$("#wishlistsection").html(result.trim());
			}
		});
		return false;
}); */

</script>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>


		<!-- Main 시작-->
		<div class="wrapper style1">

			<div class="container">

				<%-- 페이지 이동경로 --%>		
					<div class="row" style="margin-bottom:30px;">
						<div class="col-lg-12 col-12-mobile font_light_small">
							<span>✱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
							<span>&nbsp;&nbsp;❱❱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/wishlist.jsp" class="font_bold_small" ">Wish List</a>
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
				<div class="row" style="margin-bottom:5%;">
				
					<!-- 조회 조건 -->
					<div class="col-lg-6 col-12-moblile"></div>
				
					<div class="col-lg-2 col-4-moblile">
							<select class="form-control form-control-sm" id = "wishlistyear">
								<option value = "all">기간별-전체</option>
								<option value = "1">2015~2019</option>
								<option value = "2">2010~2014</option>
								<option value = "3">2005~2009</option>
								<option value = "4">2000~2004</option>
								<option value = "5">1995~1999</option>
								<option value = "6">1990~1995</option>
								<option value = "7">before1990s</option>
							</select>
					</div>
					
					<div class="col-lg-2 col-4-moblile">
							<select class="form-control form-control-sm" id = "wishlistgenre">
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
							</select>
					</div>
					
					<div class="col-lg-2 col-12-mobile">
						<input type="text" class="form-control" id="searchmovie" style="background-image:/MovieHolic/images/searchb.png" placeholder="영화 제목으로 검색">
					</div>
					
				</div>
				<!-- **두번째 행 끝 -->
				
				<!-- **세번째 행 시작 -->
				<section id = "wishlistsection">
				<div class="row">

					<!-- 영화 포스터 나열 -->
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/lalaland.jpg" alt="lalaland poster"
							data-toggle="tooltip" data-placement="top" title="라라랜드 (2016)" /></a>
					</div>
					
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/endgame.jpg" alt="endgame poster"
							data-toggle="tooltip" data-placement="top"
							title="어벤저스:엔드게임 (2019)" /></a>
					</div>
					
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/benisback.jpg" alt="benisback poster"
							data-toggle="tooltip" data-placement="top" title="벤 이즈 백 (2019)" /></a>
					</div>
					
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/girlcops.jpg" alt="girlcops poster"
							data-toggle="tooltip" data-placement="top" title="걸캅스 (2019)" /></a>
					</div>
					
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/myspecialbrother.jpg" alt="myspecialbrother poster"
							data-toggle="tooltip" data-placement="top"
							title="나의 특별한 형제 (2019)" /></a>
					</div>
					
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img src="/MovieHolic/images/mi.jpg"
							alt="mi poster" data-toggle="tooltip" data-placement="top"
							title="미성년 (2019)" /></a>
					</div>
					
					<!-- col이 12를 다 채우면, 자동으로 다음 줄로 넘어감 -->
					<div class="col-lg-2 col-6-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/frozen2.JPG" alt="frozen2 poster"
							data-toggle="tooltip" data-placement="top" title="겨울왕국2 (2019)" /></a>
					</div>
					
				</div>
				<!-- **세번째 행 끝 -->

				<!-- **네번째 행 시작 -->
				<div class="row">
				
					<div class="col-lg-12 col-12-mobile">
						  		<div style="float: left">
									<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
								</div>
						  		<div style="float: right;">
									<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
								</div>
							  	<ul class="pagination justify-content-center">
								    <li class="page-item"><a class="page-link a" href="javascript:void(0);">1</a></li>
								    <li class="page-item"><a class="page-link a" href="javascript:void(0);">2</a></li>
								    <li class="page-item"><a class="page-link a" href="javascript:void(0);">3</a></li>
								    <li class="page-item"><a class="page-link a" href="javascript:void(0);">4</a></li>
								    <li class="page-item"><a class="page-link a" href="javascript:void(0);">5</a></li>
							 	 </ul>
								<%-- float clear용 빈 div --%>
								<div style="clear: both;"></div>
						 	</div>
					
				</div>
				<!-- **네번째 행 끝 -->
</section>
			</div>

		</div>
		<!-- Main 끝-->
		
<!-- 커스텀 툴팁 추가위해 필요 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
	});
</script>
<%@ include file="/template/footer.jsp" %>