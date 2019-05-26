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


<%-- Main --%>
<div class="wrapper style1" >

	<div class="container">
	
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
				
			
			</div>
			   		
			<!-- 두번째 탭 페이지 -->
			<div id="following" class="container tab-pane fade"><br>

		
				<!-- 리뷰 목록 -->
				<hr class="first" style="margin-bottom: 7em;"/>
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
<%@ include file="/template/footer.jsp" %>






