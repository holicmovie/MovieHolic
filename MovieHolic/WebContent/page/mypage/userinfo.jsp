<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
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
/* 프로필 사진 중간 버전 */
.profile_edit_icon {
	width: 100px;
	height: 100px;
	border-radius: 50px; /* 이미지 반크기만큼 반경을 잡기*/
	border: 2px solid white;
	margin-bottom:20px;
}

/* user 수치 설명 작은 폰트 */
.font_light_xsmall_gray {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	font-size: 12px;
	font-style: italic;
}

</style>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<%-- Header --%>
	<div id="header" style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>


<%-- Main --%>
<div class="wrapper style1">

	<div class="container">
	
	<%-- **첫번째 행 시작 --%>
		<div class="row" style="margin-bottom: 5%; margin-top: 10px;">
			<div class="aaa col-lg-12 col-mobile-12">

					<%-- 첫번째 탭 페이지 --%>
					<div id="mine" class="container"><br>
					
					<div>
						<div style="float:left; margin-right:10px;">
							<img id="user_profile" src="/MovieHolic/images/profile.jpg" class="profile_edit_icon" alt="user icon"/>
						</div>
						<div class="font_light_small" style="float:left; padding:10px;">
							<a id="id" class="font_bold_lg" href="#" style="color: white;">shzy232</a><br>
							<button id="btn_following" class="btn btn-success" style="height:30px; width:80px; font-size:12px; margin-top:7px;">Following</button>
						</div>
						
						<div style="float:right; margin-top:28px;">
							<div  class="font_light_lg" >
								|&nbsp;&nbsp;&nbsp;<span id="review_count">56</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
								<span id="list_count">12</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
								<span id="follower_count">20</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
								<span id="following_count">100</span>&nbsp;&nbsp;&nbsp;| 
							</div>
							<div class="font_light_xsmall_gray" style="float:right;">
								<span style="margin-right:42px;">Reviews</span>
								<span style="margin-right:43px;">Lists</span>
								<span style="margin-right:32px;">Followers</span>
								<span style="margin-right:22px;">Followings</span>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					
						<%-- 최근 '좋아요'한 영화 --%>
						<div class="row" style="margin-top: 6em;">
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
						
						<%-- 최근 리뷰 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">최근 리뷰</div>
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
							
							<!-- 페이징 처리 -->
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
						
						<%-- 최근 리스트 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">최근 리스트</div>
							</div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
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
							
							<!-- 페이징 처리 -->
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
						
						
						
						
					</div>

				
				
			</div>
		</div>
			
	</div>

</div>
<%@ include file="/template/footer.jsp" %>