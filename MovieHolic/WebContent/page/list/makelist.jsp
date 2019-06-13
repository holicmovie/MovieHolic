<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
<%-- 영화 포스터 --%>
.movieImg {
	border: solid 1px white;
	width: 20vh;
	margin: 0.5em;
}
</style>
<script><%-- 영화 검색 모달 --%>
<%-- #### 영화 검색 모달(기본기능) #### --%>
	<%-- 영화 검색 모달 띄우기 --%>
	$(function() {
		$('#addMovie').focusin(function(){
			<%-- 모달 외부 클릭시 닫히지 않도록 처리 --%>
			$('#movieModal').modal({backdrop: 'static', keyboard: false});
			return false;
		});
	});
	
	<%-- modal의 종료버튼 클릭시 초기화 --%>
	$(function(){
		$('#movieModal .close').click(function(){
			modalClear();
			return false;
		});
	});
	<%-- modal 초기화 function --%>
	function modalClear(){
		$('#movieModal').modal('hide');
		$('#srchTitle').val('');
		$('#modalTable>tbody').empty();
	}
	
	<%-- #### 영화 검색 모달(검색기능) #### --%>
	<%-- 영화 검색 모달의 검색버튼 클릭 & enter키 이벤트 처리 --%>
	$(function(){
		$('#srchMVBtn').click(searchMV);
		$("#srchTitle").keypress(function(e){
			if (e.which == 13){
				searchMV();  // 실행할 이벤트
     		}
		});
	});
	
	<%-- 영화 검색 function --%>
	function searchMV(){
		var srchTitle = $('#srchTitle').val().trim();
		if(srchTitle == ""){
			return;
		} else {
			$.ajax({
				url: "<%= request.getContextPath()%>/list",
				data: 'act=srchMV&srchTitle=' + srchTitle,
				method: 'post',
				success:function(result){
					if(result != '\r\n') {
						$('#modalTable>tbody').html(result);
					} else {
						$('#modalTable>tbody').html('<tr><td>검색결과가 없습니다.</td></tr>');
					}
				}
			});
		}
		srchTitle = null;
	}
	
	<%-- 영화 검색 모달의 행 선택시 --%>
	$(function(){
		$(document).on("click", '#modalTable tr', function() {		<%-- 동적으로 생성된 요소에 이벤트 주는 방법 --%>
			<%-- 선택한 행의 img태그 객체 얻어오기 --%>
			var $mv = $(this).find('img');
			<%-- 포스터 및 영화정보전달용 hidden 추가 --%>
			/* var $poster = $('<img class="movieImg" src="' + movieImage + '" data-movieNm="' + movieNm + '" data-movieCdYoung="' + movieCdYoung + '" data-movieCdNaver="' + movieCdNaver + '"  data-prdtYear="' + prdtYear + '">'); */ 
			$('#addMovie').before(
					'<a class="chMovie" href="#")>'
					+ '<img class="movieImg" src="' + $mv.attr("src") + '">'
					+ '<input type="hidden" name="movieNm" value="' + $mv.attr("data-movieNm") + '">'
					+ '<input type="hidden" name="movieCdYoung" value="' + $mv.attr("data-movieCdYoung") + '">'
					+ '<input type="hidden" name="movieCdNaver" value="' + $mv.attr("data-movieCdNaver") + '">'
					+ '</a>'
					/*  + '<input type="hidden" name="prdtYear" value="' + $mv.attr("data-prdtYear") + '">' */
			);
			modalClear();
			return false;
		})
	});
</script>
<script><%-- 리스트 작성 --%>
<%-- #### list 작성 #### --%>
	<%-- 추가한 영화 삭제 --%>
	$(function(){
		$(document).on("click", ".chMovie", function(){
			if(confirm("선택한 영화를 삭제하시겠습니까?")) {
				$(this).remove();
			}
			return false;
		})
	});
	
	<%-- list 작성 취소 --%>
	$(function(){
		$('#cancle').click(function(){
			if(confirm("List 작성을 취소하시겠습니까?")) {
				history.back();
			}
			return false;
		});
	});
	
	<%-- 작성한 list 저장 --%>
	$(function(){
		$('#save').click(function(){
			var title = $('input[name="title"]').val();
			var content = $('textarea[name="content"]').val();
			var $imgArr = $('.movieImg');
			if(title == '') {
				alert("제목을 입력하세요.");
				return;
			} else if(content == ''){
				alert("내용을 입력하세요.");
				return;
			} else if($imgArr.length < 3) {
				alert("리스트에 추가할 영화를 2편 이상 선택하세요.")
				return;
			} else {
				if(confirm("작성한 List를 저장하시겠습니까?")) {
					$.ajax({
						url: "<%= request.getContextPath()%>/list",
						data: $('form').serialize() + "&act=saveList",
						method: 'post',
						success:function(result){
							if(result != 0) {
								alert("저장 되었습니다.");
								location.href = "/MovieHolic/list?act=sortList";
								$('input[name="title"]').val('');
								$('textarea[name="content"]').val('');
								$('.chMovie').remove();
							} else {
								alert("시스템 에러로 인해 저장에 실패하였습니다. 나중에 다시 시도하세요.");
							}
						}
					});
				} else {
					return false;
				}
			}
			return false;
		});
	});

</script>
<script>

</script>
</head>

<body class="left-sidebar is-preload">
<div id="page-wrapper">
<%-- Header --%>
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
				<a href="/
				MovieHolic/page/mypage/diary.jsp" class="font_bold_small">Diary</a>
			</div>
		</div>
		
	<%-- 페이지 제목 --%>
		<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
			<button class="btn btn-success font_bold_small" style="float: right;" id="save">저&nbsp;&nbsp;&nbsp;장</button>
			<button class="btn btn-success font_bold_small" style="float: right; margin-right: 10px;" id="cancle">취&nbsp;&nbsp;&nbsp;소</button>
			<div style="float: left;">나의 리뷰</div>
			<div style="clear: both;"></div>
		</div>
		<form>
	<%-- 리스트 제목 및 내용입력 --%>
		<div class="row" style="margin-top: 1em;">
			<div class="col-lg-12">
				<h3><label>YOUR LIST</label></h3>
				<input type="text" class="form-control form-control-lg" style="width: 50%;" placeholder="당신의  추천 리스트 제목을 입력하세요" name="title">
			</div>
			<div class="col-lg-12" style="margin-top: 1em;">
				<h3><label for="list-detail-description">ABOUT YOUR FAVORITE MOVIE</label></h3>
				<textarea class="form-control" rows="15" style="resize : none;" id="list-detail-description" name="content"></textarea>
			</div>
		</div>
		
	<%-- 영화 이미지 --%>
		<div class="font_bold_mid" style="width:100%; border-top: 2.5px solid #fff; margin-top: 3em; padding: 1.5em 1.2em 3em 1.2em;">
			<a id="addMovie" href="#"><img class="movieImg" src="/MovieHolic/images/getposter.png" width="200vh;" style="margin: 0.3em;"></a>
		</div>
		</form>
	</div>
</div>


<%-- The Modal --%>
<div id="movieModal" class="modal fade" role="dialog" style="top: 100px; height: 700px; ">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content" style="background-color: #555;">
    
			<%-- Modal Header --%>
			<div class="modal-header  text-center">
				<input type="text" id="srchTitle" class="form-control col-8" placeholder="검색할 영화제목 입력" style="margin-left: 20px;">
				<button id="srchMVBtn" type="button" class="btn btn-success font_bold_small" style="width: 60px; margin-left: 5px;">검&nbsp;색</button>
				<button type="button" class="close" data-dismiss="modal" style="width: 5vh;">&times;</button>
			</div>
      
			<%-- Modal body --%>
			<div class="modal-body" align="center">
				<table class="table table-hover font_bold_small" id="modalTable">
					<col width="10%">
					<col width="65%">
					<col width="25%">
					<tbody></tbody>
				</table>
			</div>
      
			<%-- Modal footer --%>
			<div class="modal-footer">
				<div class="input-group" align="left" style="padding-left: 5px;"></div>
			</div>
      
		</div>
	</div>
</div>

<%@ include file="/template/footer.jsp" %>