<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
/* 영화 포스터 */
.movieImg {
	border: solid 1px white;
	width: 19.2vh;
	margin: 0.3em;
}
</style>
<script>
<%-- 영화 검색 모달 --%>
	<%-- 영화 검색 모달 띄우기 --%>
	$(function() {
		$('#addMovie').focusin(function(){
			$('#movieModal').modal();
		});
		return false;
	});
	
	<%-- 영화 검색 모달의 검색버튼 클릭시 --%>
	$(function(){
		$('#srchMVBtn').click(function(){
			var srchTitle = $('#srchTitle').val().trim();
			if(srchTitle == ""){
				return;
			} else {
				$.ajax({
					url: "<%= request.getContextPath()%>/list",
					data: 'act=srchMV&srchTitle=' + srchTitle,
					method: 'post',
					success:function(result){
						$('#modalTable>tbody').html(result);
					}
				});
			}
		});
		return false;
	});
	
	<%-- 영화 검색 모달의 행 선택시 --%>
	$(document).on("click", '#modalTable tr', function() {		<%-- 동적으로 생성된 요소에 이벤트 주는 방법 --%>
		<%-- 선택한 행의 img태그에서 정보 받아오기 --%>
		var $mv = $(this).find('img');
		var movieNm = $mv.attr("data-movieNm");
		var movieCdYoung = $mv.attr("data-movieCdYoung");
		var movieCdNaver = $mv.attr("data-movieCdNaver");
		var movieImage= $mv.attr("src");
		var prdtYear = $mv.attr("data-prdtYear");
		
		<%-- 포스터 추가 --%>
		var $poster = $('<img class="movieImg" src="' + movieImage + '" data-movieNm="' + movieNm + '" data-movieCdYoung="' + movieCdYoung + '" data-movieCdNaver="' + movieCdNaver + '"  data-prdtYear="' + prdtYear + '">'); 
		/* var $poster = $('<img class="movieImg" src="https://movie-phinf.pstatic.net/20161123_188/1479862185516tYkKO_JPEG/movie_image.jpg" data-name="' + name + '" data-codd="' + code + '" data-prdtYear="' + prdtYear + '">'); */
		$('#addMovie').before($poster);
		
		<%-- modal 초기화 --%>
		$('#movieModal').modal('hide');
		$('#srchTitle').val('');
		$('#modalTable>tbody').empty();
	})

	
<%-- list 작성 --%>
	<%-- list 작성 취소 --%>
	$(function(){
		$('#cancle').click(function(){
			if(confirm("List 작성을 취소하시겠습니까?")) {
				history.back();
			} else {
				return false;
			}
		});
	});
	<%-- 작성한 list 저장 --%>
	$(function(){
		$('#save').click(function(){
			if(confirm("작성한 List를 저장하시겠습니까?")) {
			} else {
				return false;
			}
		});
	});

</script>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>


<%-- Main --%>
<div class="wrapper style1">

	<div class="container">

	<%-- 페이지 이동경로 --%>		
		<div class="row" style="margin-bottom:30px;">
			<div class="col-lg-12 col-12-mobile font_light_small">
				<span>✱&nbsp;&nbsp;</span>
				<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
				<span>&nbsp;&nbsp;❱❱&nbsp;&nbsp;</span>
				<a href="/MovieHolic/page/mypage/diary.jsp" class="font_bold_small" ">Diary</a>
			</div>
		</div>
		
	<%-- 페이지 제목 --%>
		<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
			<button class="btn btn-success font_bold_small" style="float: right;" id="save">저&nbsp;&nbsp;&nbsp;장</button>
			<button class="btn btn-success font_bold_small" style="float: right; margin-right: 10px;" id="cancle">취&nbsp;&nbsp;&nbsp;소</button>
			<div style="float: left;">나의 리뷰</div>
			<div style="clear: both;"></div>
		</div>
						   		
	<%-- 리스트 제목 및 내용입력 --%>
		<div class="row" style="margin-top: 1em;">
			<div class="col-lg-12">
				<h3><label>YOUR LIST</label></h3>
				<input type="text" class="form-control form-control-lg" style="width: 50%;" placeholder="당신의  추천 리스트 제목을 입력하세요" name="list-name">
			</div>
			<div class="col-lg-12" style="margin-top: 1em;">
				<h3><label for="list-detail-description">ABOUT YOUR FAVORITE MOVIE</label></h3>
				<textarea class="form-control" rows="15" style="resize : none;" id="list-detail-description" ></textarea>
			</div>
		</div>
		
	<%-- 영화 이미지 --%>
		<div class="font_bold_mid" style="width:100%; border-top: 2.5px solid #fff; margin-top: 3em; padding-top: 1.5em; padding-bottom: 3em;">
			<a id="addMovie" href="#"><img class="movieImg" src="/MovieHolic/images/getposter.png" width="200vh;" style="margin: 0.3em;"></a>
		</div>
		
	</div>
</div>


<%-- The Modal --%>
<div id="movieModal" class="modal fade" role="dialog" style="top: 100px; height: 700px; ">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content" style="background-color: #555;">
    
			<!-- Modal Header -->
			<div class="modal-header  text-center">
				<input type="text" id="srchTitle" class="form-control col-8" placeholder="검색할 영화제목 입력" style="margin-left: 20px;">
				<button id="srchMVBtn" type="button" class="btn btn-success font_bold_small" style="width: 60px; margin-left: 5px;">검&nbsp;색</button>
				<button type="button" class="close" data-dismiss="modal" style="width: 5vh;">&times;</button>
			</div>
      
			<!-- Modal body -->
			<div class="modal-body" align="center">
				<table class="table table-hover font_bold_small" id="modalTable">
					<col width="10%">
					<col width="65%">
					<col width="25%">
					<tbody></tbody>
				</table>
			</div>
      
			<!-- Modal footer -->
			<div class="modal-footer">
				<div class="input-group" align="left" style="padding-left: 5px;"></div>
			</div>
      
		</div>
	</div>
</div>

<%@ include file="/template/footer.jsp" %>