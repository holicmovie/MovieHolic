<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

<style>
<%-- 마우스 올린 행 배경색 변경 --%>
	.table-hover > tbody > tr:hover {
	  background-color: #3a3a3a;
	}
	@media screen and (max-width: 990px) {
		.hide1 {
			display: none;
		}
		.fas {
			font-size: 1.8em;
		}
	}
	
	@media screen and (max-width: 765px) {
		.hide2 {
			display: none;
		}
	}
<%-- 인기 영화 랭킹 스타일 --%>
	div.interated_network_movie_info_img{
		width:100%;
		float: none;
		display: table-cell;
		vertical-align: top;
		position: relative;
	}
	span.movie_ranking_number {
	position: absolute;
	vertical-align: top;
	    top: 0;
	    left: 0;
	    width: 38px;
	    padding: 6px 0 6px 0;
	    font-size: 20px;
	    background-color : #ff4e00;
	    font-weight: 700;
	    color: #fff;
	    text-align: center;
	    z-index: 1000;
	}
</style>
<script>
<%-- 페이지 로딩 후 리스트 뿌리기(최신순) --%>
$(function(){
	$.ajax({
		url: "<%= request.getContextPath()%>/list",
		data: "act=sortLatest",
		method: 'post',
		success:function(result){
				$('tbody').empty();
				$('tbody').html(result);
		}
	});
});
<%-- 리스트 작성 버튼 이벤트 --%>
$(function(){
	$('#writeList').click(function(){
		var userID = "${sessionScope.loginInfo}";
		if(userID == "") {
			if(confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?")) {
				location.href="/MovieHolic/page/user/login.jsp";
			} else {
				return false;
			}
		} else {
			location.href="/MovieHolic/page/list/makelist.jsp";
		}
		return false;
	});
});
	
	
<%-- 리스트 검색 버튼 이벤트 --%>
$(function(){
	$('#srchList').click(function(){
		$.ajax({
			url: "<%= request.getContextPath()%>/list",
			data: "act=srchList&srchStr=" + $('#srchStr').val().trim(),
			method: 'post',
			success:function(result){
				$('tbody').empty();
				$('tbody').html(result);
				$('#srchStr').val('');
			}
		});
		return false;
	});
	$("#srchStr").keyup(function(e){
		if (event.which == 13 ) {
			if($('#srchStr').val() != "") {	<%-- 검색어가 공백이 아닌 경우 srchKey로 받아옴 --%>
				$.ajax({
					url: "<%= request.getContextPath()%>/list",
					data: "act=srchList&srchStr=" + $('#srchStr').val().trim(),
					method: 'post',
					success:function(result){
						$('tbody').empty();
						$('tbody').html(result);
						$('#srchStr').val('');
					}
				});
			}
		}
		return false;
	});
});

<%-- 최신순 정렬 리스트의 tr 이벤트 --%>
$(function(){
	$(document).on("click", '.table-hover tr', function() {		<%-- 동적으로 생성된 요소에 이벤트 주는 방법 --%>
		var mvdetail = $(this).find('input').val();
		location.href=mvdetail;
		return false;
	})
});

</script>
</head>
<body class="left-sidebar is-preload" style="background-color: black;">
<div id="page-wrapper">
<c:set var="boardListP" value="${requestScope.boardListP}"/>	<%-- boardList = List<BoardDto> --%>
<c:set var="flListP" value="${requestScope.flListP}"/>	<%-- flList = List<List<BoardDto>> --%>
<c:set var="boardCnt" value="${fn:length(boardListP)}"/>	<%-- 리스트 개수 --%>
	<!-- Header -->
	<div id="header" style="background-image: none; padding: 4em 0 0 0;">
		<%@ include file="/template/nav.jsp"%>
	</div>
	<!-- boxoffice -->
				
		<div style="padding: 4em 0 0 0;">		
			<h2 style="text-align: center; border-top: 5px solid #fff; border-bottom: 5px solid #fff; padding: 10px 0 10px 0;">
				<span><strong>주간 인기 리스트</strong></span>
			</h2>
		</div>
		<br>
	<!-- good rank list -->
	<section class="carousel"style="padding:1.5em 0 0 0;">
		<div class="reel" id="sortPopular">
			<c:if test="${boardCnt > 0}">
			<c:forEach begin="0" end="${boardCnt-1}" var="i">
				<c:set var="filmList" value="${flListP[i]}"/>
				<c:set var="filmCnt" value="${fn:length(boardListP[i].movieCodeNaver)}"/>
			<div class="interated_network_movie_info_img">
				<span class="movie_ranking_number" id="rankNum">${filmCnt}</span>
				<article style="background-color: rgb(3, 39, 49);">
					<a href="list?act=listDetail&seq=${boardListP[i].seq}" class="image featured">
						<img src="${filmList[0].movieImage}" />
					</a>
					<header>
						<h6>${boardListP[i].subject}<br>by&nbsp;${boardListP[i].userId}&nbsp;<br>|&nbsp;${boardListP[i].postDateY}&nbsp;|<br>💕&nbsp;:&nbsp;${boardListP[i].best}&nbsp;&nbsp;💔&nbsp;:&nbsp;${boardListP[i].worst}</h6>
					</header>
				</article>
			</div>
			</c:forEach>
			</c:if>
		</div>
	</section>


	<!-- 최신 유저 리스트 -->

	<!-- new list -->

	<div class="row" style="margin: 8em 14em 3em 14em;">
		<div style="width: 100%; padding: 10px 0 10px 0;">
			<h2 style="text-align: center; border-top: 5px solid #fff; border-bottom: 5px solid #fff; padding: 10px 0 10px 0;">
				<span><strong>전체 리스트</strong></span>
			</h2>
		</div>
		<div class="col-12" style="text-align:right; margin: 1em 0 2em 0; padding: 1em 0 1em 0;">
			<button class="btn btn-success font_bold_small" style="float: left; width: 8em;" id="writeList">리스트&nbsp;작성</button>
			<button class="btn btn-success font_bold_small" style="float: right;" id="srchList">검&nbsp;&nbsp;&nbsp;색</button>
			<input type="text" id="srchStr" class="form-control" style="height: 40px; width: 13em; float: right; margin-right: 1em;" placeholder="리스트 검색">
			<div style="clear: both;"></div>
		</div>
		
		<div class="col-12" style="height: 800px; overflow-y: auto; padding: 0;">
			<table class="table table-hover" style="margin-top: 2em;">
				<col width="40%">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

</div>

	<div class="row" style="padding: 5em;"></div>
	<%@ include file="/template/footer.jsp"%>