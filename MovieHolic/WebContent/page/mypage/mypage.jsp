<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
.reel>article{
	background-color: black;
}
@media screen and (max-width: 1205px) {
	.hide1 { display: none; }
} 
@media screen and (max-width: 990px) {
	.hide2 { display: none; }
} 
@media screen and (max-width: 765px) {
	.hide3 { display: none; }
} 
</style>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>


<%-- Main --%>
<div class="wrapper style1">

	<div class="container">
	<!-- **첫번째 행 시작 -->
		<div class="row" style="margin-bottom: 5%">
			<div class="aaa col-lg-12 col-mobile-12">
			<%-- 탭 메뉴 시작--%>
				<!-- 탭 2개 선언 -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"  data-toggle="tab" href="#mine">Mine</a></li>
				    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#following">Following</a></li>
			  	</ul>
	
	
				<%-- 탭 페이지 2개 구성 --%>
				<div class="tab-content">
			  
					<%-- 첫번째 탭 페이지 --%>
					<div id="mine" class="container tab-pane active"><br>
					
						<%-- 최근 '좋아요'한 영화 --%>
						<div class="row" style="margin-top: 1em;">
							<div style="width:100%; border-bottom: 0.2em solid #fff; margin-bottom: 1em;"><h4 class="font_bold_mid">최근 '좋아요'한 영화</h4></div>
							
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
							<div style="width:100%; border-bottom: 0.2em solid #fff; margin-bottom: 2em;"><h4 class="font_bold_mid">나의 최근 리뷰</h4></div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 2em;">
								<col style="width:10%;">
								<col style="width:20%;">
								<tr>
									<td style="vertical-align: middle;">
										<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" /></a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4 class="font_bold_mid"><a href="#">엔드게임</a></h4>
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
							        	<h4 class="font_bold_mid"><a href="#">코코</a></h4>
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
							        	<h4 class="font_bold_mid"><a href="#">겨울왕국</a></h4>
							        </td>
							        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
							        	어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
							        </td>
								</tr>
							</table>
						</div>
						
						<%-- 나의 최근 리스트 --%>
						<div class="row" style="margin-top: 10em;">
							<div style="width:100%; border-bottom: 0.2em solid #fff; margin-bottom: 2em;"><h4 class="font_bold_mid">나의 최근 리스트</h4></div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 2em;">
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
							</table>
						
						
						</div>
					</div>
						
						
						
						
						
						
						   		
						   		
						   		
					<!-- 두번째 탭 페이지 -->
					<div id="following" class="container tab-pane fade"><br>
						<%-- 친구들이 '좋아요'한 영화 --%>
						<div class="row" style="margin-top: 1em;">
							<div style="width:100%; border-bottom: 0.2em solid #fff; margin-bottom: 1em;"><h4>친구들이 '좋아요'한 영화</h4></div>
							
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
				
		
						<!-- 활동 목록 -->
						<div class="row" style="margin-top: 10em;">
							<div style="width:100%; border-bottom: 0.2em solid #fff; margin-bottom: 2em;"><h4>Activity Log</h4></div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 2em;">
								<col style="width:10%;">
								<col style="width:80%;">
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>에 좋아요❤ 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>의 리뷰 by <a class="font_bold_small">bbb443</a>에 좋아요❤ 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
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
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
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
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>에 좋아요❤ 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								<tr>
									<td>
										<img alt="" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small">Abc123</a>님이 <a class="font_bold_small">'라라랜드'</a>의 리뷰 by <a class="font_bold_small">bbb443</a>에 좋아요❤ 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
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
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
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
							        	<h5 class="font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
							</table>
						</div>
					</div>
							   		
				</div>
				<!-- 탭 메뉴 끝 -->
				
				
			</div>
		</div>
			
	</div>

</div>
<%@ include file="/template/footer.jsp" %>