<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
<%-- 영화 포스터 --%>
.movieImg {
	border: solid 1px white;
	width: 22.5vh;
	margin: 0.3em;
	margin-bottom: 0.8em;
}
<%-- 좋아요 둥근 버튼을 위해 필요 --%>
.btn-circle.btn-xl {
    width: 50px;
    height: 50px;
    padding: 10px 10px;
    border-radius: 35px;
    font-size: 25px;
    line-height: 1.33;
}
.btn-circle {
    width: 50px;
    height: 50px;
    padding: 10px 10px;
    border-radius: 35px;
    text-align: center;
    font-size: 25px;
    line-height: 1.42857;
}
.comment{
	border-right-color: lightgray;
	border-right-style: solid;
}
</style>
<script>
<%-- 이전 버튼 클릭시 --%>
	$(function(){
		$('#back').click(function(){
			history.back();
			return false;
		});
	});

<%-- list 수정 버튼 클릭시 --%>
	$(function(){
		$('#modify').click(function(){
			location.href="list?act=selList&seq=" + seq;
			return false;
		});
	});
<%-- list 삭제 버튼 클릭시 --%>
	$(function(){
		$('#del').click(function(){
			var cnt = $('#cnt').text();
			$.ajax({
				url: "list",
				data: "act=delete&seq="+ seq + "&postDate=" + $('#writedate').text() + "&cnt=" + cnt,
				method: 'post',
				success:function(result){
					if(result != 0) {
						alert("삭제 되었습니다.");
						location.href = "/MovieHolic/page/list/movielist.jsp";
					} else {
						alert("시스템 에러로 인해 삭제 처리에 실패하였습니다. 나중에 다시 시도하세요.");
					}
				}
			});
			return false;
		});
	});
<%-- 좋아요&싫어요 버튼 클릭시 --%>
	$(function(){
		$('.btnCnt').click(function(){
			if($.ckID()){
				var btnStr = $(this).attr('href');
				var check = '해당 게시물을 평가(' + ((btnStr == "best") ? "좋아요" : "싫어요" ) + ')하시겠습니까?';
				if(confirm(check)) {
					$.ajax({
						url: 'list',
						data: 'act=evaluate&btnStr=' + btnStr + '&seq=' + seq,
						method: 'post',
						success: function(result){
							if(result != 0) {
								$('.btnCnt[href="'+ btnStr +'"]').next().text(result);
							} else {
								alert("시스템 에러로 인해 작업 처리에 실패하였습니다. 나중에 다시 시도하세요.");
							}
						}
					});
				}
			}
			return false;
		});
	});
<%-- 신고하기 버튼 클릭시 --%>
	$(function(){
		$('#notify').click(function(){
			if($.ckID()){
				if(confirm("해당 게시물을 신고하시겠습니까?")) {
					$.ajax({
						url: 'list',
						data: 'act=notify&seq=' + seq,
						method: 'post',
						success: function(result){
							if(result != 0) {
								alert("게시물 신고 처리가 완료되었습니다.");
							} else {
								alert("시스템 에러로 인해 작업 처리에 실패하였습니다. 나중에 다시 시도하세요.");
							}
						}
					});
				}
			}
			return false;
		});
	});
<%-- 댓글 작성 --%>
	$(function(){
		$('#save').click(function(){
			var comment = $('textarea').val().trim();
			if(comment == ''){
				alert("내용을 입력하세요.");
				return;
			} else {
				if(confirm("작성한 댓글을 저장하시겠습니까?")) {
					$.ajax({
						url: "<%= request.getContextPath()%>/list",
						data: "act=saveComment&seq=" + seq + "&content=" + comment +  "&subject=" + $('#subject').text() + "&writerId=" + $('#writerId').text(),
						method: 'post',
						success:function(result){
							if(result != 0) {
								alert("저장 되었습니다.");
								$.ajax({
									url: "<%= request.getContextPath()%>/list",
									data: "act=selComment&seq=" + seq,
									method: 'post',
									success:function(result){
										$('textarea').val('');
										$('tbody').empty();
										$('tbody').html(result);
										$('#cnt').text($('#commenCnt').attr("data-cnt"));
									}
								});
							} else {
								alert("시스템 에러로 인해 저장에 실패하였습니다. 나중에 다시 시도하세요.");
							}
						}
					});
				} 
			}
			return false;
		});
	});
</script>
<script>
<% session.setAttribute("userID", "a155@gmail.com"); %>
<%-- <% session.removeAttribute("userID");%> --%>
$(function(){
	seq = $('#back').attr('data-seq');
	$.ckID = function() {
		var userID = "${sessionScope.userID}";
		if(userID == "") {
			if(confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?")) {
				location.href="#";
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
});
</script>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">
<%-- Header --%>
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>
<%-- 변수 설정 --%>
<c:set var="board" value="${requestScope.board}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="comment" value="${requestScope.comment}"/>
<%-- Main --%>
<div class="wrapper style1">

	<div class="container">

		
		<%-- 리스트 제목 및 작성자 정보 --%>
		<div class="font_bold_mid" style="width:100%; margin-bottom: 2em;">
			<c:if test="${sessionScope.userID != null }">
				<c:if test="${sessionScope.userID == board.userId}">
			<button class="btn btn-success font_bold_small" style="float: right;" id="del" >삭&nbsp;&nbsp;&nbsp;제</button>
			<button class="btn btn-success font_bold_small" style="float: right; margin-right: 10px;" id="modify" >수&nbsp;&nbsp;&nbsp;정</button>
				</c:if>
			</c:if>
			<button class="btn btn-success font_bold_small" style="float: left; margin-right: 10px;" id="back" data-seq="${board.seq }">이&nbsp;&nbsp;&nbsp;전</button>
			<div style="clear: both;"></div>
		</div>
		<div class="font_bold_mid" style="width:100%; margin-bottom: 1em;">
			<span class="font_bold_lg" id="subject">${board.subject}</span> 
		</div>
		<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
			<div style="float: left">
				<a href="#"><img id="replywriter" class="profile_icon" alt="프로필 사진" src="/MovieHolic/images/profile/${user[0].profile}"></a>
				&nbsp;&nbsp;
			</div>
			<div style="float: left">
				<a id="writerId" class="font_bold_small" href="#" style="color: white">${user[0].userId}</a><br>
			</div>
			<div class="font_light_small" style="float: right;">
				<span class="font_bold_lg">&nbsp;</span>
				조회수 : <span id="viewcount">${board.viewCount}</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<span id="writedate">${board.postDate}</span>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		
		<%-- 리스트 내용 --%>
		<div class="row" style="margin-top: 1.5em;">
			<div class="col-lg-12">
				<div style="padding: 0 1em 3em 1em; font-size: 1.2em">${board.content}</div>
				<div class="font_bold_mid" style="width:100%; padding: 1em 1.1em 3em 1.1em;">
					<c:forEach var="film" items="${requestScope.film}">
					<tr>
						<a id="movie" href="img=${film.movieImage}&movieCdYoung=${film.movieCdYoung}&movieCdNaver="${film.movieCdNaver}"><img class="movieImg" src="${film.movieImage}" ></a>
					</tr>
					</c:forEach>
				</div>
				<div class="rounded-lg" style="background-color: #555; width:20vh; height: 100px; padding-top: 15px; margin:auto; text-align: center;">
					<div style="float:left; margin-left: 0.8em;">
						<a href="best" class="btnCnt"><img alt="좋아요 아이콘" src="/MovieHolic/images/like.png"></a>
						<span style="display: block;">${board.best}</span>
					</div>
					<div style="float:right; margin-right: 0.8em;">
						<a href="worst" class="btnCnt"><img alt="싫어요 아이콘" src="/MovieHolic/images/unlike.png"></a>
						<span style="display: block;">${board.worst}</span>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		
		<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin: 3em 0 2em 0; padding-bottom: 1em;">
			<a id="notify" class="font_light_small" href="#" style="float: right;">신고하기</a>
			<div style="clear: both;"></div>
		</div>
		
		
		
		<div class="row" >
			<%-- 댓글 작성 --%>
			<div class="col-lg-12">
				<textarea class="form-control" rows="5" placeholder="댓글을 입력해주세요." style="float: left; width: 90%; margin: 0 0.5em 0.5em 0;"></textarea>
				<button class="btn btn-success font_bold_small" id="save">등&nbsp;&nbsp;&nbsp;록</button>
				<!-- float clear용 빈 div -->
				<div style="clear: both;"></div>
			</div>

			<%-- 댓글 내용 --%>
			<div class="col-lg-12 font_bold_mid" style="border-bottom: 1px solid #fff; margin: 3em 0 0 0; padding-bottom: 1em;">
				<span>COMMENTS</span>(<span id="cnt"><c:choose><c:when test="${fn:length(comment) != 0}">${fn:length(comment)-1}</c:when><c:otherwise>0</c:otherwise></c:choose></span>)			
			</div>
			<div class="col-lg-12 font_light_small" style="margin: 0 0 20em 0; height: 500px; overflow-y: auto;">
				<table class="table table-hover" id="modalTable" >
					<col width="5%">
					<col width="20%">
					<col width="70%">
					<col width="5%">
					<tbody>
						<c:forEach begin="1" end="${fn:length(comment)-1}" var="i">
						<tr>
							<td style="text-align: center">
								<a href="#"><img class="profile_icon" src="/MovieHolic/images/profile/${user[i].profile}"></a>
							</td>
							<td style="vertical-align: middle;">
								<div>${comment[i].userId}</div>
								<div>${comment[i].postDate}</div>
							</td>
							<td class="font_bold_small" style="vertical-align: middle;">${comment[i].content}</td>
							<td style="vertical-align: middle;">
							<c:if test="${sessionScope.userID != null }">
								<c:if test="${sessionScope.userID == comment[i].userId}">
							<button type="button" id="replydelete" class="close" style="color: white">&times;</button>
								</c:if>
							</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
</div>

<%@ include file="/template/footer.jsp" %>