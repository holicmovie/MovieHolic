<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/boot_340.jsp" %>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<%@ include file="/template/nav.jsp"%>


		<!-- Main 시작-->
		<div class="wrapper style1">

			<div class="container">

				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
				
					<div class="col-12 col-12-mobile">
						<h2>Wish List</h2>
					</div>
				
				</div>
				<!-- **첫번째 행 끝 -->

				<!-- **두번째 행 시작 -->
				<div class="row" style="margin-bottom:5%;">
				
					<!-- 조회 조건 -->
					<div class="col-8"></div>
				
					<div class="col-2 col-6-moblile">
							<select class="form-control form-control-sm">
								<option>기간별 - 전체</option>
								<option>2019</option>
								<option>2018</option>
								<option>2017</option>
								<option>2016</option>
							</select>
					</div>
					
					<div class="col-2 col-6-moblile">
							<select class="form-control form-control-sm">
								<option>장르별 - 전체</option>
								<option>액션</option>
								<option>로맨스</option>
								<option>코미디</option>
								<option>가족/드라마</option>
							</select>
					</div>
					
				</div>
				<!-- **두번째 행 끝 -->
				
				<!-- **세번째 행 시작 -->
				<div class="row">

					<!-- 영화 포스터 나열 -->
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/lalaland.jpg" alt="lalaland poster"
							data-toggle="tooltip" data-placement="top" title="라라랜드 (2016)" /></a>
					</div>
					
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/endgame.jpg" alt="endgame poster"
							data-toggle="tooltip" data-placement="top"
							title="어벤저스:엔드게임 (2019)" /></a>
					</div>
					
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/benisback.jpg" alt="benisback poster"
							data-toggle="tooltip" data-placement="top" title="벤 이즈 백 (2019)" /></a>
					</div>
					
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/girlcops.jpg" alt="girlcops poster"
							data-toggle="tooltip" data-placement="top" title="걸캅스 (2019)" /></a>
					</div>
					
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/myspecialbrother.jpg" alt="myspecialbrother poster"
							data-toggle="tooltip" data-placement="top"
							title="나의 특별한 형제 (2019)" /></a>
					</div>
					
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img src="/MovieHolic/images/mi.jpg"
							alt="mi poster" data-toggle="tooltip" data-placement="top"
							title="미성년 (2019)" /></a>
					</div>
					
					<!-- col이 12를 다 채우면, 자동으로 다음 줄로 넘어감 -->
					<div class="col-2 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/frozen2.JPG" alt="frozen2 poster"
							data-toggle="tooltip" data-placement="top" title="겨울왕국2 (2019)" /></a>
					</div>
					
				</div>
				<!-- **세번째 행 끝 -->

				<!-- **네번째 행 시작 -->
				<div class="row">
				
					<div class="col-12 col-12-moblile" align="center">
						<!-- 페이지 번호 -->
						<nav aria-label="...">
							<ul class="pagination">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
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