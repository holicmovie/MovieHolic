<<<<<<< HEAD
<%@page import="com.kitri.dto.SocialDto"%>
=======
<%@page import="com.kitri.dto.BoardDto"%>
>>>>>>> branch 'master' of https://github.com/holicmovie/MovieHolic.git
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<<<<<<< HEAD
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% List<SocialDto> list = (List)request.getAttribute("followinglist");%>
=======
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>>>>>>> branch 'master' of https://github.com/holicmovie/MovieHolic.git
<style>
<%--
캐러셀 안의 포스터 공백제거 --%> .reel>article {
	background-color: black;
}

<%--
화면
 
크기
 
작아지면
 
가릴
 
요소들
 
--%>
@media screen and (max-width: 1205px) {
	.hide1 {
		display: none;
	}
	.title {
		font-size: 20px;
	}
	.time {
		display: none;
	}
}

@media screen and (max-width: 990px) {
	.hide2 {
		display: none;
	}
}

@media screen and (max-width: 765px) {
	.hide3 {
		display: none;
	}
}

<%--
마우스 올린 행 배경색 변경 --%> .table-hover>tbody>tr:hover {
	background-color: #3a3a3a;
}
</style>
</head>
<body class="left-sidebar is-preload">

<<<<<<< HEAD
<script type="text/javascript">
$(function() {
	var arr = $("table#lsd>tr>td>a");
	$(arr).click(function() {
	var vurl = $(this).attr("href");
	$ajax({
		url : vurl,
		method:'get',
		success:function(result){
			location.href="listdetail.jsp";
		}
	});
		return false;
	});
	<%--"/MovieHoli/mypage?page=tab2"--%>
	$("#tabf").click(function(){
		alert("하이");
		$.ajax({
			url : "/MovieHolic/mypage",
			method : "GET"
		});
		return false;
	});
});
<%System.out.println(list);%>
</script>
<div id="page-wrapper">
=======
	<script type="text/javascript">
		$(function() {
			var arr = $("table#lsd>tr>td>a");
			$(arr).click(function() {
				var vurl = $(this).attr("href");
				$a.jax({
					url : vurl,
					method : 'get',
					success : function(result) {
						location.href = "listdetail.jsp";
					}
				});
>>>>>>> branch 'master' of https://github.com/holicmovie/MovieHolic.git

			});
		});
	</script>
	<div id="page-wrapper">

		<%-- Header --%>
		<div id="header"
			style="background-image: none; margin-bottom: 0px; padding-bottom: 0; height: 10px;">
			<%@ include file="/template/nav.jsp"%>
		</div>
<<<<<<< HEAD
	
	<%-- **첫번째 행 시작 --%>
		<div class="row" style="margin-bottom: 5%; margin-top: 10px;">
			<div class="aaa col-lg-12 col-mobile-12">
			<%-- 탭 메뉴 시작--%>
				<%-- 탭 2개 선언 --%>
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"  data-toggle="tab" href="#mine">Mine</a></li>
				    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#following" id = "tabf">Following</a></li>
			  	</ul>
	
	
				<%-- 탭 페이지 2개 구성 --%>
				<div class="tab-content">
			  
					<%-- 첫번째 탭 페이지 --%>
					<div id="mine" class="container tab-pane active"><br>
					
						<%-- 최근 '좋아요'한 영화 --%>
						<div class="row" style="margin-top: 1em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">최근 '보고싶어요'한 영화</div>
							</div>
							<section class="carousel">
								<div class="reel">
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
								</div>
							</section>
						</div>
						
						<%-- 나의 최근 리뷰 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">나의 최근 리뷰</div>
							</div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
								<col style="width:10%;">
								<col style="width:20%;">
								<tr>
									<td style="vertical-align: middle;">
										<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" /></a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4 class="title font_bold_mid"><a href="#">엔드게임</a></h4>
							        </td>
							        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
							        어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
							        </td>
								</tr>
								<tr>
									<td style="vertical-align: middle;">
										<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" /></a>
									</td>
							        <td style="vertical-align: middle;">
							        	<h4 class="title font_bold_mid"><a href="#">코코</a></h4>
							        </td>
							        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
							        	어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
							        </td>
								</tr>
								<tr>
									<td style="vertical-align: middle;">
										<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" /></a>
									</td>
							        <td style="vertical-align: middle;">
							        	<h4 class="title font_bold_mid"><a href="#">겨울왕국</a></h4>
							        </td>
							        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
							        	어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
							        </td>
								</tr>
							</table>
							
				<%--pagination처리 --%>
				<div class = "col-lg-12">
				<div style="float: left">
					<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
				</div>
				
		  		<div style="float: right">
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
						
						<%-- 나의 최근 리스트 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">나의 최근 리스트</div>
							</div>
							<table id="lsd"class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
								<col style="width:40%;">
								<tr>
									<td>
										<div>
											<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
											<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
											<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
											<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
										</div>
									</td>
							        <td style="vertical-align: middle; padding-left: 2em;">
							        	<h4 class="font_bold_small"><a href="">우울할 때 보는 영화 10선</a></h4>
							        </td>
								</tr>
								<tr>
									<td>
										<div>
											<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
											<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
											<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
											<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
										</div>
									</td>
							        <td style="vertical-align: middle; padding-left: 2em;">
							        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
							        </td>
								</tr>
								<tr>
									<td>
										<div>
											<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
											<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
											<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
											<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
										</div>
									</td>
							        <td style="vertical-align: middle; padding-left: 2em;">
							        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
							        </td>
								</tr>
								<tr>
									<td>
										<div>
											<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
											<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
											<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
											<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
										</div>
									</td>
							        <td style="vertical-align: middle; padding-left: 2em;">
							        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
							        </td>
								</tr>
							</table>
				<%--pagination 처리 --%>
					<div class = "col-lg-12">
				<div style="float: left">
					<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
				</div>
				
		  		<div style="float: right">
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
					</div>
						
						   		
						   		
						   		
					<%-- 두번째 탭 페이지 --%>
					<div id="following" class="container tab-pane fade"><br>
						<%-- 친구들이 '좋아요'한 영화 --%>
						<div class="row" style="margin-top: 1em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">친구들이 '좋아요'한 영화</div>
							</div>
							<section class="carousel">
								<div class="reel">
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
									</article>
									<article>
										<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
									</article>
								</div>
							</section>
						</div>
				
		
						<%-- 활동 목록 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">Activity Log</div>
								<div style="float: right;" class="font_light_small">더보기</div>
							</div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="border-top: 0px thin;">
								<col style="width:10%;">
								<col style="width:80%;">
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>에 좋아요&#x1f496; 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>의 리뷰 by <a class="font_bold_small">bbb443</a>에 좋아요&#x1f496; 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'어벤져스:엔드게임'</a>의 리뷰를 작성했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>의 리뷰에 댓글을 작성했습니다.</h5>
							        	<h6 class="font_light_small">|&nbsp;&nbsp;&nbsp;엔드게임 스포당하고 봐서 재미없었음</h6>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>에 좋아요&#x1f496; 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>의 리뷰 by <a class="font_bold_small">bbb443</a>에 좋아요&#x1f496; 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'어벤져스:엔드게임'</a>의 리뷰를 작성했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>의 리뷰에 댓글을 작성했습니다.</h5>
							        	<h6 class="font_light_small">|&nbsp;&nbsp;&nbsp;엔드게임 스포당하고 봐서 재미없었음</h6>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
							</table>
						</div>
					</div>
							   		
				</div>
				<%-- 탭 메뉴 끝 --%>
				
				
			</div>
		</div>
			
	</div>
=======
		<%
			List<BoardDto> list = (List<BoardDto>) request.getAttribute("reviewList");
			List<BoardDto> list2 = (List<BoardDto>)request.getAttribute("listList");
		%>
>>>>>>> branch 'master' of https://github.com/holicmovie/MovieHolic.git

		<%-- Main --%>
		<div class="wrapper style1">

			<div class="container">

				<%-- 페이지 이동경로 --%>
				<div class="row" style="margin-bottom: 30px;">
					<div class="col-lg-12 col-12-mobile font_light_small">
						<span>✱&nbsp;&nbsp;</span> <a
							href="/MovieHolic/page/mypage/mypage.jsp" style="color: white;">My
							Page</a>
					</div>
				</div>

				<%-- **첫번째 행 시작 --%>
				<div class="row" style="margin-bottom: 5%; margin-top: 10px;">
					<div class="aaa col-lg-12 col-mobile-12">
						<%-- 탭 메뉴 시작--%>
						<%-- 탭 2개 선언 --%>
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#mine">Mine</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#following">Following</a></li>
						</ul>


						<%-- 탭 페이지 2개 구성 --%>
						<div class="tab-content">

							<%-- 첫번째 탭 페이지 --%>
							<div id="mine" class="container tab-pane active">
								<br>

								<%-- 최근 '좋아요'한 영화 --%>
								<div class="row" style="margin-top: 1em;">
									<div class="font_bold_mid"
										style="width: 100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
										<div style="float: left;">최근 '보고싶어요'한 영화</div>
									</div>
									<section class="carousel">
										<div class="reel">
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
										</div>
									</section>
								</div>

								<%-- 나의 최근 리뷰 --%>
								<div class="row" style="margin-top: 10em;">
									<div class="font_bold_mid"
										style="width: 100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
										<div style="float: left;">나의 최근 리뷰</div>
									</div>
									<table class="table table-hover col-lg-12 col-mobile-12"
										style="margin-top: 0;">
										<col style="width: 10%;">
										<col style="width: 20%;">
										<%
											for (BoardDto dto : list) {
										%>
										<tr>
											<td style="vertical-align: middle;"><a href="#"><img
													width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg"
													title="엔드게임 (2019)" /></a></td>
											<td style="vertical-align: middle">
												<h4 class="title font_bold_mid">
													<a href="#"><%=dto.getMovieName()%></a>
												</h4>
											</td>
											<td style="vertical-align: middle; color: #fff;"
												class="font_light_small"><%=dto.getContent()%></td>
										</tr>
										<%
											}
										%>

									</table>

									<%--pagination처리 --%>
									<div class="col-lg-12">
										<div style="float: left">
											<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
										</div>

										<div style="float: right">
											<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
										</div>

										<ul class="pagination justify-content-center">
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">1</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">2</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">3</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">4</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">5</a></li>
										</ul>
										<%-- float clear용 빈 div --%>
										<div style="clear: both;"></div>
									</div>
								</div>

								<%-- 나의 최근 리스트 --%>
								<div class="row" style="margin-top: 10em;">
									<div class="font_bold_mid"
										style="width: 100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
										<div style="float: left;">나의 최근 리스트</div>
									</div>
									<table id="lsd"
										class="table table-hover col-lg-12 col-mobile-12"
										style="margin-top: 0;">
										<col style="width: 40%;">
										<%for(BoardDto dto : list2){ %>
										<tr>
											<td>
												<div>
													<img width="100vh"
														src="/MovieHolic/images/tempimg/endgame.jpg"
														title="엔드게임 (2019)"
														style="position: absolute; z-index: 0;" /> <img
														width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg"
														title="엔드게임 (2019)"
														style="position: relative; left: 70px; z-index: 0;" /> <img
														class="hide3" width="100vh"
														src="/MovieHolic/images/tempimg/coco.jpg"
														title="엔드게임 (2019)"
														style="position: relative; left: 40px; z-index: 0;" /> <img
														class="hide2" width="100vh"
														src="/MovieHolic/images/tempimg/endgame.jpg"
														title="엔드게임 (2019)"
														style="position: relative; left: 5px; z-index: 0;" /> <img
														class="hide1" width="100vh"
														src="/MovieHolic/images/tempimg/frozen.jpg"
														title="엔드게임 (2019)"
														style="position: relative; left: -30px; z-index: 0;" />
												</div>
											</td>
											<td style="vertical-align: middle; padding-left: 2em;">
												<h4 class="font_bold_small">
													<a href=""><%=dto.getContent() %></a>
												</h4>
											</td>
										</tr>
										<%} %>
										
									</table>
									<%--pagination 처리 --%>
									<div class="col-lg-12">
										<div style="float: left">
											<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
										</div>

										<div style="float: right">
											<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
										</div>

										<ul class="pagination justify-content-center">
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">1</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">2</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">3</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">4</a></li>
											<li class="page-item"><a class="page-link a"
												href="javascript:void(0);">5</a></li>
										</ul>
										<%-- float clear용 빈 div --%>
										<div style="clear: both;"></div>
									</div>
								</div>
							</div>




							<%-- 두번째 탭 페이지 --%>
							<div id="following" class="container tab-pane fade">
								<br>
								<%-- 친구들이 '좋아요'한 영화 --%>
								<div class="row" style="margin-top: 1em;">
									<div class="font_bold_mid"
										style="width: 100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
										<div style="float: left;">친구들이 '좋아요'한 영화</div>
									</div>
									<section class="carousel">
										<div class="reel">
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/brother.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/capma.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/watching.jpg" alt="" /></a>
											</article>
											<article>
												<a href="#" class="image featured"><img
													src="/MovieHolic/images/money.jpg" alt="" /></a>
											</article>
										</div>
									</section>
								</div>


								<%-- 활동 목록 --%>
								<div class="row" style="margin-top: 10em;">
									<div class="font_bold_mid"
										style="width: 100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
										<div style="float: left;">Activity Log</div>
										<div style="float: right;" class="font_light_small">더보기</div>
									</div>
									<table class="table table-hover col-lg-12 col-mobile-12"
										style="border-top: 0px thin;">
										<col style="width: 10%;">
										<col style="width: 80%;">
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'라라랜드'</a>에 좋아요&#x1f496; 했습니다.
												</h5>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'라라랜드'</a>의 리뷰 by <a
														class="font_bold_small">bbb443</a>에 좋아요&#x1f496; 했습니다.
												</h5>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'어벤져스:엔드게임'</a>의 리뷰를 작성했습니다.
												</h5>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'라라랜드'</a>의 리뷰에 댓글을 작성했습니다.
												</h5>
												<h6 class="font_light_small">|&nbsp;&nbsp;&nbsp;엔드게임
													스포당하고 봐서 재미없었음</h6>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'라라랜드'</a>에 좋아요&#x1f496; 했습니다.
												</h5>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'라라랜드'</a>의 리뷰 by <a
														class="font_bold_small">bbb443</a>에 좋아요&#x1f496; 했습니다.
												</h5>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'어벤져스:엔드게임'</a>의 리뷰를 작성했습니다.
												</h5>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
										<tr>
											<td><img alt="" src="/MovieHolic/images/user.png"
												width="70vh"></td>
											<td style="vertical-align: middle;">
												<h5 class="font_light_small">
													<a class="font_bold_small">Abc123</a>님이 <a
														class="font_bold_small">'라라랜드'</a>의 리뷰에 댓글을 작성했습니다.
												</h5>
												<h6 class="font_light_small">|&nbsp;&nbsp;&nbsp;엔드게임
													스포당하고 봐서 재미없었음</h6>
											</td>
											<td style="vertical-align: middle;">
												<h5 class="time font_light_small" style="color: gray;">2시간
													전</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>

						</div>
						<%-- 탭 메뉴 끝 --%>


					</div>
				</div>

			</div>

		</div>
		<%@ include file="/template/footer.jsp"%>