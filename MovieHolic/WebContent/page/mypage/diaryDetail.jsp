<%@page import="com.kitri.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<style>
/* 좋아요 둥근 버튼을 위해 필요 */
.btn-circle.btn-xl {
	width: 70px;
	height: 70px;
	padding: 10px 16px;
	border-radius: 35px;
	font-size: 24px;
	line-height: 1.33;
}

.btn-circle {
	width: 40px;
	height: 40px;
	padding: 6px 0px;
	border-radius: 22px;
	text-align: center;
	font-size: 12px;
	line-height: 1.42857;
}

/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
    top:1em;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
	top:1em;
}

/* 구분선 얇은 것 (회색) */
hr.line_light_g {
	background-color: gray;
	position: static;
	top:1em;
}

/* 위의 공간 띄울 때 */
.top_margin {
	margin-top: 20px;
}

.top_margin_lg {
	margin-top: 40px;
}

/* 영화 포스터 */
.movieImg {
	border: solid 1px white;
	height: 350px;
}

/* 별모양 */
.fas {
	font-style:normal;
	font-family: FontAwesome;
	font-size: 2.5em;
}

/* 신고버튼 */
.report {
	color: white;
	text-decoration: underline;
}
</style>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

</head>
<script>
$(document).ready(function(){

			$("#back").click(function(){
				window.history.back();
			});
		});
</script>
<body class="left-sidebar is-preload">
<c:set var ="dto" value="${requestScope.reviewdetail}"/>
<%BoardDto dto = (BoardDto)request.getAttribute("reviewdetail");%>

	<div id="page-wrapper">

		<!-- Header -->
		<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
			<%@ include file="/template/nav.jsp"%>
		</div>

		<!-- Main 시작 -->

		<div class="wrapper style1" style="color: white;">

			<div class="container">

					<%-- 페이지 이동경로 --%>		
					<div class="row" style="margin-bottom:30px;">
						<div class="col-lg-12 col-12-mobile font_light_small">
							<span>✱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
							<span>&nbsp;&nbsp;❱❱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/diary.jsp" class="font_bold_small">Diary</a>
						</div>
					</div>

				<div class="row">
					<div class="col-lg-12 col-12-mobile">
						<div style="float: left">
							<button class="btn btn-success font_bold_small" id="back">이&nbsp;&nbsp;&nbsp;전</button>
						</div>
						<div style="float: right">
							<button class="btn btn-success font_bold_small">삭&nbsp;&nbsp;&nbsp;제</button>
						</div>
						<div style="float: right; width: 20px; height: 1px;"></div>
						<div style="float: right">
							<button class="btn btn-success font_bold_small">수&nbsp;&nbsp;&nbsp;정</button>
						</div>
						<!-- float clear용 빈 div -->
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="row">

					<!-- 왼쪽 내용 start -->
					<div class="col-lg-3 col-12-mobile top_margin" align="center">

						<!-- 포스터 -->
						<section class="movieImg-wrap">
							<a href="#"><img class="movieImg" alt="<%=dto.getMovieName2() %>"
								src="<%= dto.getUrl2() %>" border="solid 1px white"></a>
						</section>
					</div>
					<!-- 왼쪽 내용 end -->

					<!-- 오른쪽 내용 start -->
					<div class="col-lg-9 col-12-mobile top_margin">
						<!-- 영화명, 개봉연도, 조회수, 작성일 -->
						<div class="title">
							<div class="movietitle" style="float: left;">
								<span class="font_bold_lg">${dto.movieName2}</span> <span
									class="font_light_mid">&nbsp;${dto.postDateY}</span> &nbsp;&nbsp;
									<c:choose>
									<c:when test="${dto.enable==0}">
										<img alt="잠금 여부 표시 아이콘" src="/MovieHolic/images/lock.png"	style="margin-bottom: 12px;">
									</c:when>
									<c:when test="${dto.enable==1}">
										<img alt="" src=""style="margin-bottom: 12px;">
									</c:when>									
									</c:choose>
							</div>
							<div class="writeinfo" style="float: right;">
								<span class="font_light_small">
									<span class="font_bold_lg">&nbsp;</span>
									조회수 : <span id="viewcount">${dto.viewCount}</span>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<span id="writedate">${dto.postDate}</span>
								</span>
							</div>
							
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>


						<!-- 별점, 작성자 -->
						<div style="float: left">
							<span style="font-size: 1em;">
							<%for(int i =1;i<=dto.getStarPoint();i++){ %>
								<i class="fas fa-star" style="color: #ffca08;"></i>
								<%} %>
							<%for(int i = 1;i<=5-dto.getStarPoint();i++){ %>
								<i class="fas fa-star" style="color: #222222;"></i>
								<%} %>
							</span>
						</div>

						<!-- 작성자 프사, 아이디 -->
						<div class="" style="float: right">
							<a href="#">
								<img class="profile_icon" alt="작성자 프로필 사진" src="/MovieHolic/images/profile/user.jpg">
							</a>
							&nbsp;
							<span class="font_light_small">by&nbsp;
							<a id="writerId" class="font_bold_small" href="#" style="color: white">${dto.userId}</a></span>
						</div>

						<!-- float clear용 빈 div -->
						<div style="clear: both;"></div>

						<!-- 구분선 -->
						<hr class="line_bold">

						<!-- 작성 내용 -->
						<div class="font_light_small top_margin">
							<p>
								${dto.content}
							</p>
						</div>

						<!--신고하기 -->
						<div class="top_margin_lg">
							<div class="font_light_small" style="float: right">
							<c:choose>
							<c:when test="${dto.enable==0}">
								<a class="report" href="#" style="display:none">신고하기</a>
								</c:when>
								<c:otherwise>
								<a class="report" href="#">신고하기</a>
								</c:otherwise>
								</c:choose>
							</div>
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>


						<!-- 구분선 -->
						<hr class="line_bold">
						
						<!-- 댓글 start -->
						<%-- <c:set var="dto" value="${requestScope.reviewcomment}"/>
						<div class="font_bold_small top_margin_lg">
							<span>COMMENTS</span>(<span id="commentcount">2</span>)
						</div>

						<!-- 구분선 -->
						<hr class="line_light_w">

						<!-- 댓글 한 개 -->
						<c:forEach var="comm" items="${requestScope.reviewcomment}">
						<div class="font_light_small">
							<div style="float: left">
								<a href="#"><img id="replywriter" class="profile_icon"
									alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a>
								&nbsp;&nbsp;
							</div>
							<div style="float: left">
								<a id="replywriterId" class="font_bold_small" href="#"
									style="color: white">${comm.userId}</a><br> <span>3시간 전</span>
							</div>
							<div style="float: left; margin-left: 20px;">
								<p id="replycontent">${comm.content}
								</p>
							</div>
							<div style="float: right">
								<button type="button" id="replydelete" class="close"
									style="color: white">&times;</button>
							</div>

							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
							<!-- 구분선 -->
							<hr class="line_light_g">

						</div>
						</c:forEach>
						
						<!-- 댓글 입력칸 -->
						<div class="font_light_small top_margin_lg">
							<textarea class="form-control" rows="4" id="mycomment"
								placeholder="댓글을 입력해주세요." style="resize: none;"></textarea>
							<button class="btn btn-success font_bold_small top_margin"
								style="float: right">등&nbsp;&nbsp;&nbsp;록</button>
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>

						<!-- 댓글 end --> --%>

					</div>
					<!-- 오른쪽 내용 end -->

				</div>

			</div>

		</div>
		<!-- Main 끝 -->

		<%@ include file="/template/footer.jsp"%>