<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

<style>
/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
}
</style>

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

				<div class="row" style="margin-bottom:30px; color:white">
					<div class="col-lg-12 col-12-mobile">
						<span>· My Page</span>
						<span class=""> > Wish List</span>
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
							<select class="form-control form-control-sm">
								<option>기간별 - 전체</option>
								<option>2019</option>
								<option>2018</option>
								<option>2017</option>
								<option>2016</option>
							</select>
					</div>
					
					<div class="col-lg-2 col-4-moblile">
							<select class="form-control form-control-sm">
								<option>장르별 - 전체</option>
								<option>액션</option>
								<option>로맨스</option>
								<option>코미디</option>
								<option>가족/드라마</option>
							</select>
					</div>
					
					<div class="col-lg-2 col-12-mobile">
						<input type="text" class="form-control" id="searchmovie" style="background-image:/MovieHolic/images/searchb.png" placeholder="영화 제목으로 검색">
					</div>
					
				</div>
				<!-- **두번째 행 끝 -->
				
				<!-- **세번째 행 시작 -->
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
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
							 	 </ul>
								<%-- float clear용 빈 div --%>
								<div style="clear: both;"></div>
						 	</div>
					
				</div>
				<!-- **네번째 행 끝 -->

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