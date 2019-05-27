<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
<%-- 체크박스 --%>
.form-check-input {
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
	position: relative;
	margin: 3em 2em 2em;
}
.fas {
	font-style:normal;
	font-family: FontAwesome;
	font-size: 3em;
}
<%-- 모바일사이즈에서 이미지&별점 숨기기 --%>
@media screen and (max-width: 990px) {
	.hide1 { display: none; }
	.fas { font-size: 1.8em;}
} 
@media screen and (max-width: 765px) {
	.hide2 { display: none;}
	.title {font-size: 18px;}
} 
.page-link {
	background-color: black;
	color: white;
}
</style>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<%-- Header --%>
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>


<%-- Main --%>
<div class="wrapper style1">

	<div class="container">
			
		<%-- **첫번째 행 시작 --%>
		<div class="row" style="margin-bottom: 5%">
			<div class="aaa col-lg-12 col-mobile-12">
			<%-- 탭 메뉴 시작--%>
				<%-- 탭 2개 선언 --%>
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"  data-toggle="tab" href="#calendar">달력</a></li>
				    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#list">목록</a></li>
			  	</ul>
	
	
				<%-- 탭 페이지 2개 구성 --%>
				<div class="tab-content">
			  
					<%-- 첫번째 탭 페이지 --%>
					<div id="calendar" class="container tab-pane active"><br>
					
						
					</div>
						
						   		
						   		
					<%-- 두번째 탭 페이지 --%>
					<div id="list" class="container tab-pane fade"><br>
						<div class="row" style="margin-top: 0.2em;">
							<div class="col-lg-12 col-12-mobile">
								<div style="float: left">
									<button class="btn btn-success font_bold_small">삭 제</button>
								</div>
								<div style="float: right">
									<button class="btn btn-success font_bold_small">검 색</button>
								</div>
								<div style="float: right; width: 20px; height: 1px;"></div>
								<div style="float: right">
									<input type="text"  class="form-control">
								</div>
								<%-- float clear용 빈 div --%>
								<div style="clear: both;"></div>
							</div>
							<div class="col-12"  style="margin-bottom: 3em;">
								<table class="table table-hover" style="text-align: center; margin-top: 1em;">
								    <thead>
								      <tr class="font_light_small">
								        <th style="width: 5%; "></th>
								        <th style="width: 13%; text-align: center;" class="hide1" >영화</th>
								        <th style="width: 14%;; text-align: center;">작성일</th>
								        <th style="width: 34%; text-align: center;" class="hide2">별점</th>
								        <th style="text-align: center;">영화제목</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								      	<td style="vertical-align: middle;"><input type="checkbox" class="form-check-input"></td>
								        <td class="hide1" style="vertical-align: middle;">
											<a href="#"><img width="90vh" src="/MovieHolic/images/tempimg/coco.jpg" title="코코 (2017)" /></a>
										</td>
								        <td style="vertical-align: middle;">
								        	<div class="font_light_small">2019</div>
								        	<div class="font_bold_mid" style="font-size: 2em;">5/6</div>
								        </td>
								        <td class="hide2" style="vertical-align: middle;">
									        <span style="font-size: 1em;">
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #222222;"></i>
											</span>
								        </td>
								        <td class="font_bold_mid" style="vertical-align: middle;"><span class="title">코코</span></td>
								      </tr>
								      <tr>
								      	<td style="vertical-align: middle;"><input type="checkbox" class="form-check-input"></td>
								        <td  class="hide1" style="vertical-align: middle;">
											<a href="#"><img width="90vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" /></a>
										</td>
								        <td style="vertical-align: middle;">
								        	<div class="font_light_small">2019</div>
								        	<div class="font_bold_mid" style="font-size: 2em;">5/6</div>
								        </td>
								        <td class="hide2" style="vertical-align: middle;">
									        <span style="font-size: 1em;">
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #222222;"></i>
											</span>
								        </td>
								        <td class="font_bold_mid" style="vertical-align: middle;"><span class="title">어벤져스:엔드게임</span></td>
								      </tr>
								      <tr>
								      	<td style="vertical-align: middle;"><input type="checkbox" class="form-check-input"></td>
								        <td class="hide1" style="vertical-align: middle;">
											<a href="#"><img width="90vh" src="/MovieHolic/images/tempimg/coco.jpg" title="코코 (2017)" /></a>
										</td>
								        <td style="vertical-align: middle;">
								        	<div class="font_light_small">2019</div>
								        	<div class="font_bold_mid" style="font-size: 2em;">5/6</div>
								        </td>
								        <td class="hide2" style="vertical-align: middle;">
									        <span style="font-size: 1em;">
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #222222;"></i>
											</span>
								        </td>
								        <td class="font_bold_mid" style="vertical-align: middle;"><span class="title">코코</span></td>
								      </tr>
								      <tr>
								      	<td style="vertical-align: middle;"><input type="checkbox" class="form-check-input"></td>
								        <td  class="hide1" style="vertical-align: middle;">
											<a href="#"><img width="90vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" /></a>
										</td>
								        <td style="vertical-align: middle;">
								        	<div class="font_light_small">2019</div>
								        	<div class="font_bold_mid" style="font-size: 2em;">5/6</div>
								        </td>
								        <td class="hide2" style="vertical-align: middle;">
									        <span style="font-size: 1em;">
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #ffca08;"></i>
											  <i class="fas fa-star" style="color: #222222;"></i>
											</span>
								        </td>
								        <td class="font_bold_mid" style="vertical-align: middle;"><span class="title">어벤져스:엔드게임</span></td>
								      </tr>
								    </tbody>
						  		</table>
						  	</div>
						  	<div class="col-12">
						  		<div style="float: left">
									<button class="btn btn-success font_bold_small">이 전</button>
								</div>
						  		<div style="float: right;">
									<button class="btn btn-success font_bold_small">다 음</button>
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
				
		
					</div>
							   		
				</div>
				<%-- 탭 메뉴 끝 --%>
				
				
			</div>
		</div>

				
	</div>

</div>
<%@ include file="/template/footer.jsp" %>