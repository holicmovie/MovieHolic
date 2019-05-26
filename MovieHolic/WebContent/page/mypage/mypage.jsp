<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
article>a>img {
	height: 
}
.aaa {
	color: white;
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
<div class="wrapper style1" >

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
							<div style="width:100%; border-bottom: 0.3em solid #fff;"><h4>최근 '좋아요'한 영화</h4></div>
							
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
						<div class="row" style="margin-top: 1em;">
							<div style="width:100%; border-bottom: 0.3em solid #fff;"><h4>나의 최근 리뷰</h4></div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 2em;">
								<col style="width:10%;">
								<col style="width:20%;">
								<tr>
									<td>
										<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" /></a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4><a href="#">엔드게임(2019)</a></h4>
							        </td>
							        <td style="vertical-align: middle">
							        어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
							        </td>
								</tr>
								<tr>
									<td>
										<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" /></a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4><a href="#">코코</a></h4>
							        </td>
							        <td style="vertical-align: middle">
							        	<h5>어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.</h5>
							        </td>
								</tr>
							</table>
						</div>
						
						<%-- 나의 최근 리스트 --%>
						<div class="row" style="margin-top: 3em;">
							<div style="width:100%; border-bottom: 0.3em solid #fff;"><h4>나의 최근 리스트</h4></div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 2em;">
								<col style="width:40%;">
								<tr>
									<td>
										<a href="#">
											<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 2;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 50px; z-index: 1;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative;"/>
										</a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4>우울할 때 보는 영화 10선</h4>
							        </td>
								</tr>
								<tr>
									<td>
										<a href="#">
											<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 5;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 4;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 20px; z-index: 3;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; z-index: 2;"/>
											<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; z-index: 1;"/>
										</a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4>우울할 때 보는 영화 10선</h4>
							        </td>
								</tr>
							</table>
						
						
						</div>
					</div>
						
						
						
						
						
						
						   		
						   		
						   		
					<!-- 두번째 탭 페이지 -->
					<div id="following" class="container tab-pane fade"><br>
		
				
						<!-- 리뷰 목록 -->
						<hr style="margin-bottom: 7em;"/>
						<div class="row" >
							<div class="col-2 col-12-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/endgame.jpg" alt="endgame poster" data-toggle="tooltip" data-placement="top" title="엔드게임 (2019)" /></a>
							</div>
							<div class="col-10 col-12-mobile">
								<section>
									<header>
										<h6 style="font-size: 0.8em; color: gray;">god님의 리뷰</h6>
									</header>
									<header>
										<h3><a href="#">엔드게임(2019)</a></h3>
									</header>
										<p>
											어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
										</p>
								</section>
							</div>
						</div>
						
		
						<!-- 활동 목록 -->
						<hr class="first" style="margin-bottom: 7em;"/>
						<div class="row" >
							<div class="col-10 col-12-mobile">
								<section>
									<header>
										<h6 style="font-size: 0.8em; color: gray;">jun님이 god님의 리뷰에 댓글을 달았습니다.</h6>
									</header>
										<p>
											엔드게임 스포당하고 봐서 재미없었음ㅠㅠ
										</p>
								</section>
							</div>
						</div>
						
						<hr class="first" style="margin-bottom: 7em;"/>
						<div class="row" >
							<div class="col-10 col-12-mobile">
								<section>
									<header>
										<h6 style="font-size: 0.8em; color: gray;">jun님이 <a href="#">[스파이더맨:파 프롬 홈]</a>을 wish list에 추가하였습니다.</h6>
									</header>
								</section>
							</div>
						</div>
		
		
		
						<!-- List 목록 -->
						<hr class="first" style="margin-bottom: 7em;"/>
						
						<div class="col-10 col-12-mobile" style="margin-bottom: 3em;">
							<section>
								<header>
									<h6 style="font-size: 0.8em; color: gray;">god님의 List</h6>
								</header>
								<header>
									<h3><a href="#">애니메이션 영화</a></h3>
								</header>
								</section>
							</div>
						
						<div class="row" >
							<div class="col-2 col-2-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/coco.jpg" alt="coco poster" data-toggle="tooltip" data-placement="top" title="코코 (2017)" /></a>
							</div>
							<div class="col-2 col-2-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/frozen.jpg" alt="frozen poster" data-toggle="tooltip" data-placement="top" title="겨울왕국 (2013)" /></a>
							</div>
							<div class="col-2 col-2-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/insideout.jpg" alt="insideout poster" data-toggle="tooltip" data-placement="top" title="인사이드 아웃 (2015)" /></a>
							</div>
							<div class="col-2 col-2-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/minions.jpg" alt="minions poster" data-toggle="tooltip" data-placement="top" title="미니언즈 (2015)" /></a>
							</div>
							<div class="col-2 col-2-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/up.jpg" alt="up poster" data-toggle="tooltip" data-placement="top" title="업 (2009)" /></a>
							</div>
							<div class="col-2 col-2-mobile">
								<a href="#" class="image featured"><img src="/MovieHolic/images/tempimg/zootopia.jpg" alt="zootopia poster" data-toggle="tooltip" data-placement="top" title="주토피아 (2016)" /></a>
							</div>
							
						</div>
		
					</div>
							   		
				</div>
				<!-- 탭 메뉴 끝 -->
				
				
			</div>
		</div>
			
	</div>

</div>
<%@ include file="/template/footer.jsp" %>