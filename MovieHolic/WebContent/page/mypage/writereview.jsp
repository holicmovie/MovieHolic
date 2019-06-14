<%@page import="com.kitri.dto.FilmDto"%>
<%@page import="com.kitri.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%-- datepicker --%>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<style>
<%--
modal의 닫기 버튼 --%> .close {
	color: white;
}

<%--
datepicker --%> div[role="body"] div, div[role="body"] table, div[role="body"] i
	{
	color: black;
}

<%--영화 포스터 --%> .movieImg {
	border: solid 2px white;
}

<%--
별점의 별 icon을 사용하기 위해 필요 --%> .starrating>input {
	display: none;
}

<%--
Remove radio buttons --%> .starrating>label:before {
	content: "\f005"; <%-- Star --%> margin : 3px;
	font-size: 2em;
	font-family: FontAwesome;
	display: inline-block;
}

.starrating>label {
	color: #222222;
	<%--
	Start
	color
	when
	not
	clicked
	--%>
}

.starrating>input:checked ~ label {
	color: #ffca08;
}

<%--
Set yellow color when star checked  --%> .starrating>input:hover ~ label
	{
	color: #ffca08;
}

<%--
Set yellow color when star hover  --%> <%-- 체크박스 --%> .form-check-input
	{
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
	position: relative;
	margin: 1.5em 1em 0em 0.6em;
}
</style>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
$(function () {
    $('.btndelete').click(function () {
      // getter
      var chkval = $('input[name="reviewdelete"]:checked');
      alert(chkval.length);
      
      $.ajax({
			url: '/MovieHolic/mypage?page=diary',
			method: 'post',
			data: chkval,
			success:function(result){
				  location.href = '/MovieHolic/mypage?page=diary';   
				alert("삭제 성공!!!"); 
			}
		});
		return false;  
   });
   
});	
<%-- datepicker --%>
	$(function() {
		$('#datepicker').datepicker({
			uiLibrary : 'bootstrap4'
		});
	});
<%-- 저장
function register() {
	if(document.getElementById("starRating").value ==""){
		alert("별점 입력하세요!");
		return;
	}else if(document.getElementById("reviewContent").value == ""){
		alert("sodyddlqfur");
		return;
	}else{
		document.getElementById("register").action = "<%=root%>/mypage";
		document.getElementById("register").submit();
	}
} --%>
$(function() {
	<%-- 리뷰 저장 이벤트 --%>
	$("#register").click(function(){
		var movieCdYoung = $(this).attr("movieCdYoung");
		var movieCdNaver = $(this).attr("movieCdNaver");
		var director = $(this).attr("director");
		var actor1 = $(this).attr("actor1");
		var actor2 = $(this).attr("actor2");
		var movieName = $(this).attr("movieName");
		var category = $(this).attr("category");
	 var chkval = $('input[name="reviewdelete"]:checked');
     alert(chkval.length);
	$.ajax({
		url: '/MovieHolic/mypage?page=register&&movieCdYoung='+ movieCdYoung + '&movieCdNaver='+ movieCdNaver
		+ '&director=' + director + '&actor1=' + actor1 + '&actor2=' + actor2
		+ '&movieName=' + movieName + '&category=' + category,
		method:'post',
		success: function(result){
			alert("save save");
		},
		error: function(error){
			alert(error);
		}
	});
	
	return false;
});
});
</script>
</head>
<body class="left-sidebar is-preload">
<% FilmDto dto = (FilmDto)request.getAttribute("writereview"); 
	BoardDto save = (BoardDto)request.getAttribute("register");	%>
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header"
			style="background-image: none; margin-bottom: 0px; padding-bottom: 0; height: 10px;">
			<%@ include file="/template/nav.jsp"%>
		</div>

		<%--List<BoardDto> write = (List<BoardDto>)request.getAttribute("writereview"); --%>

		<!-- Main -->
		<div class="wrapper style1">
			<div class="container">
			<form action="">
				<%--  페이지 제목 --%>
				<div class="row" style="margin-top: 0; margin-top: 10px;">
					<div
						style="width: 100%; border-bottom: 2.5px solid #fff; margin-bottom: 2em; padding-top: 0; padding-bottom: 0.8em;">
						<div class="font_bold_lg" style="float: left;">New Review</div>
						<div style="float: right; margin-right: 15px;">
							<input id="datepicker" width="150" />
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="row">

					<%-- 왼쪽 내용 start --%>
					<div class="col-lg-3 col-12-mobile top_margin">

						<%-- 포스터, 별점 --%>
						<div style="width: 100%; text-align: center;">
							<img class="movieImg"
								src="<%=dto.getMovieImage() %>" alt = "<%=dto.getMovieNm()%>"width="235vh">
						</div>
						
						<div id="likeunlike" class="rounded-lg"
							style="background-color: #555; margin-top: 20px; height: 100px; padding-top: 8px; text-align: center;">
							<span class="font_light_small">영화를 평가해주세요.</span>
							<div
								class="starrating risingstar d-flex justify-content-center flex-row-reverse" id="starRating"
								style="font-size: 1.3em;">
								<input type="radio" id="star5" name="rating" value="5" /><label
									for="star5" title="5 star"></label> <input type="radio"
									id="star4" name="rating" value="4" /><label for="star4"
									title="4 star"></label> <input type="radio" id="star3"
									name="rating" value="3" /><label for="star3" title="3 star"></label>
								<input type="radio" id="star2" name="rating" value="2" /><label
									for="star2" title="2 star"></label> <input type="radio"
									id="star1" name="rating" value="1" /><label for="star1"
									title="1 star"></label>
							</div>
						</div>

						<div id="likeunlike" class="rounded-lg"
							style="background-color: #555; margin-top: 10px; height: 80px; text-align: center;">
							<input type="checkbox" class="form-check-input" id="public"><label
								for="public" class="font_light_small">이 리뷰를 공개합니다.</label>
						</div>

					</div>
					<%-- 왼쪽 내용 end --%>

					<%-- 오른쪽 내용 start --%>
					<div class="col-lg-9 col-12-mobile top_margin">

						<%-- 작성 내용 --%>
						<div style="width: 100%; padding: 0;">
							<textarea class="form-control" id="reviewContent" rows="22"></textarea>
						</div>


					</div>
					<%-- 오른쪽 내용 end --%>

				</div>


				<div class="row"
					style="margin-top: 40px; border-top: 2.5px solid #fff;">
					<div class="col-12">
						<div style="float: right;">
							<button class="btn btn-success font_bold_small" movieCdYoung="<%=request.getParameter("movieCdYoung")%>" movieCdNaver="<%=request.getParameter("movieCdNaver")%>" movieName="<%=request.getParameter("movieName")%>" director="<%=request.getParameter("director")%>" actor1="<%=request.getParameter("actor1") %>" actor2="<%=request.getParameter("actor2") %>" category="<%=request.getParameter("category") %>" id="register">저&nbsp;&nbsp;&nbsp;장</button>
						</div>
						<div style="float: right; margin-right: 20px;">
							<button class="btn btn-success font_bold_small" id="reviewcancle">취&nbsp;&nbsp;&nbsp;소</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>






		<%-- The Modal --%>
		<div id="movieModal" class="modal fade" role="dialog"
			style="top: 100px; height: 700px;">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content" style="background-color: #555;">

					<!-- Modal Header -->
					<div class="modal-header  text-center">
						<input type="text" class="form-control col-8"
							placeholder="검색할 영화제목 입력" style="margin-left: 20px;">
						<button type="button" class="close" data-dismiss="modal"
							style="width: 5vh;">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" align="center">
						<table class="table table-hover font_bold_small"">
							<col width="10%">
							<col width="65%">
							<col width="25%">
							<%-- <%for(BoardDto dto : write){ %> --%>
							<tr>
								<td><img src="/MovieHolic/images/tempimg/endgame.jpg"
									height="100vh"></td>
								<td style="vertical-align: middle;">어벤져스:엔드게임</td>
								<td style="vertical-align: middle; text-align: center;">2017</td>
							</tr>
							<%-- <%} %> --%>

						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="input-group" align="left" style="padding-left: 5px;">

						</div>
					</div>

				</div>
			</div>
		</div>

		<%@ include file="/template/footer.jsp"%>