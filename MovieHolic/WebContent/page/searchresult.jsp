<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
/* 영화 포스터 */
.movieImg {
	border: solid 1px white;
}
<%-- 마우스 올린 행 배경색 변경 --%>
	.table-hover > tbody > tr:hover {
	  background-color: #3a3a3a;
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
<%-- 프로필 사진 큰 버전 --%>
.profile_edit_icon {
	width: 10vh;
	border-radius: 85px; /* 이미지 반크기만큼 반경을 잡기*/
	border: 5px solid white;
	margin-bottom:20px;
}
</style>
<script>
$(function(){
	$(document).on("click", '.table-hover tr', function() {		<%-- 동적으로 생성된 요소에 이벤트 주는 방법 --%>
		var mvdetail = "/MovieHolic/film?act=viewfilmdetail&movieCdYoung=" + $(this).find('img').attr('data-movieCdYoung') + "&movieCdNaver=" + $(this).find('img').attr('data-movieCdNaver');
		location.href=mvdetail;
		return false;
	})
});
</script>
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
	
						
		<%-- 영화 검색 결과 --%>
		<div class="row" style="padding-bottom: 10em;">
			<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
				<div style="float: left;">영화 검색 결과</div>
			</div>
			<table class="table table-hover col-lg-12 col-mobile-12" style="text-align:center; margin-top: 0;">
				<thead>
					<tr class="font_light_small">
						<th style="width:15%;"></th>
						<th style="width:40%;">영화 제목</th>
						<th style="width:20%;">개봉 일자</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${fn:length(requestScope.list) > 0}">
						<c:forEach var="mv" items="${requestScope.list}">
						<tr class="font_bold_mid">
							<td><img class="movieImg" src="${mv.movieImage}" alt="${mv.movieImage}" width="115vh" data-movieNm="${mv.movieNm}" data-movieCdYoung="${mv.movieCdYoung}" data-movieCdNaver="${mv.movieCdNaver}" data-prdtYear="${mv.prdtYear}"></td>
							<td style="vertical-align: middle;">${mv.movieNm}</td>
							<td style="vertical-align: middle; text-align: center;">${mv.prdtYear}</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td>검색결과가 없습니다.</td></tr>
					</c:otherwise>
				</c:choose>
					<!-- <tr class="font_bold_small">
						<td style="vertical-align: middle;">
							<img class="movieImg" width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" />
						</td>
				        <td style="vertical-align: middle">
				        	<h4 class="title font_bold_mid">어벤져스:엔드게임</h4>
				        </td>
				        <td style="vertical-align: middle">
				        	<h4 class="title font_bold_mid">2019.05.30.</h4>
				        </td>
					</tr> -->
				</tbody>
			</table>
		</div>
		
		
		
		<%-- 리스트 검색 결과 --%>
		<%-- <div class="row" style="margin-top: 10em;">
			<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
				<div style="float: left;">리스트 검색 결과</div>
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
			<div class="col-12">
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
				float clear용 빈 div
				<div style="clear: both;"></div>
		 	</div>
		</div> --%>
				
						
			
	</div>

</div>
<%@ include file="/template/footer.jsp" %>