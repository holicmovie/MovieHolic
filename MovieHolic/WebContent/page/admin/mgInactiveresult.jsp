<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<c:set var="ap" value="${requestScope.ap}" />
<c:set var="np" value="${requestScope.np}" />




<!-- 휴면페이지에서 휴면 눌렀을때 다시 페이징 처리하기 위해서 만듬 -->





<script>
	/* 회원관리 게시판 목록종류 */
$(function() {
	$("div>span>span>a").click(function() {
	$("div.wrapper>div.container>div.member_search_result").empty();
		var url = $(this).attr("href");
		$.ajax({
			url : url,
			method : 'get',
			success : function(result) {
				$("div.wrapper>div.container>div.member_search_result").html(result.trim());
				$(".secession").show();//more버튼 숨기기
			}
		});
	return false;
	});
});

	
	
	
/* 회원관리 게시판 목록종류(탈퇴) */
$(function() {
	$("div>span>span>span>a").click(function() {
	$("div.wrapper>div.container>div.member_search_result").empty();
	var url = $(this).attr("href");
		$.ajax({
			url : url,
			method : 'get',
			success : function(result) {
				$("div.wrapper>div.container>div.member_search_result").html(result.trim());
				$(".secession").hide();//more버튼 숨기기
			}
		});
	return false;
	});
});

	
	
	
//.on으로 바꾸면 정적과 동적 둘다 사용 가능. notify
$(document).on("click",".page>a",function() {
	var currentPage = $(this).attr("href");
	$("div.wrapper>div.container>div.member_search_result").empty();
	$.ajax({
		url : '/MovieHolic/admin?act=alllist&'+ 'currentPage=' + currentPage,
		method : 'get',
		success : function(result) {
		$("div.wrapper>div.container>div.member_search_result").html(result.trim());
		}
	});
	return false;
});

	
	
	
// 휴면 페이징 처리.
$(document).on("click",".page_inactive>a",function() {
	var currentPage = $(this).attr("href");
	$("div.wrapper>div.container>div.member_search_result").empty();
	$.ajax({
		url : '/MovieHolic/admin?act=inactiveList&' + 'currentPage=' + currentPage,
		method : 'get',
		success : function(result) {
			$("div.wrapper>div.container>div.member_search_result").html(result.trim());
		}
	});
	return false;
});




// 신고게시물 페이징 처리
$(document).on("click", ".page_notify>a", function() {
	var currentPage = $(this).attr("href");
	$(".notify_search_result").empty();
	$.ajax({
		url : '/MovieHolic/admin?notify=notify&currentPage=' + currentPage,
		method : 'get',
		/* data : 'alllist=' + alllist,  */
		success : function(result) {
			$(".notify_search_result").html(result.trim());
		}
	});
	return false;
});




// 유저 전체선택
$(document).on("click", ".allcheckbox", function() {
	//클릭되었으면
	if ($(".ap_checkbox").prop("checked")) {
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		$(".ap_checkbox").prop("checked", false);
		//클릭이 안되있으면
		return false;
	} else {
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		$(".ap_checkbox").prop("checked", true);
		return false;
	}
});




// 신고게시물 전체선택
$(document).on("click", ".allcheckbox2", function() {
	//클릭되었으면
	if ($(".np_checkbox").prop("checked")) {
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		$(".np_checkbox").prop("checked", false);
		//클릭이 안되있으면
		return false;
	} else {
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		$(".np_checkbox").prop("checked", true);
		return false;
	}
});




//체크박스 선택(탈퇴)
$(document).on("click", ".secession", function(){	
	var mgInactiveList = $(".mgInactiveList").val();
	var searchresult = $(".searchresult").val();
	$.ajax({
		url: '/MovieHolic/admin?act=secession',
		method: 'post',
		data: $('.ap_checkbox').serialize(),
		success:function(result){
			$(":input[name=ap_checkbox]").prop("checked", false);
			
			if (mgInactiveList == "mgInactiveList") {
				location.href = "/MovieHolic/admin?act=inactive&notify=notify";
			} else if (searchresult == "searchresult") {
				var href = $("span.enable>a").attr("href");
				location.href = href;
			} else {
				location.href = "/MovieHolic/admin?act=alllist&notify=notify";
			}
		}
	});
	return false;
});





// 체크박스 선택시 신고게시물 삭제
$(document).on("click", ".np_delete", function() {
	var mgInactiveList = $(".mgInactiveList").val();
	var searchresult = $(".searchresult").val();
	alert("searchresult = " + searchresult);
	alert("mgInactiveList = " + mgInactiveList);
	$.ajax({
		url : '/MovieHolic/admin?act=np_delete',
		method : 'post',
		data : $('.np_checkbox').serialize(),
		success : function(result) {
			$(":input[name=np_checkbox]").prop("checked", false);

			if (mgInactiveList == "mgInactiveList") {
				location.href = "/MovieHolic/admin?act=inactive&notify=notify";
			} else if (searchresult == "searchresult") {
				location.href = "/MovieHolic/admin?act=search&notify=notify";
			} else {
				location.href = "/MovieHolic/admin?act=alllist&notify=notify";
			}

			alert("게시물 삭제에 성공하셨습니다.");
		}
	});
	return false;
});



// 휴면 처리 
// Ajax 안쓰고 밑에서 처리함.



// 검색 : 이름 - 0 아이디 - 1
$(document).on("click",".search",function() {
	var index = $(".searchType option").index(
	$(".searchType option:selected"));
	var text = $("#usertext").val();
	$("div.wrapper>div.container>div.member_search_result").empty();
		$.ajax({
			url : '/MovieHolic/admin?act=search&index=' + index + '&text=' + text,
			method : 'post',
			//data: $('.np_checkbox').serialize()
			success : function(result) {
				$("div.wrapper>div.container>div.member_search_result").html(result.trim());
				$("#usertext").val("");
			}
		});
	return false;
});


	//   --------------------------------------------------
</script>





<style>
.searchType {
	width: 90px;
	font-family: 'Noto Sans KR', sans-serif;
	display: block;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 15px;
	font-weight: bold;
	line-height: 1.5;
	color: #ffcd07;
	background-color: #034741;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	border-color: #28a745;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

tr>td>input {
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
}

.container {
	/* background-image: url("/Content/img/datepicker/s4.png"); /* ???*/
	background-position: center;
	background-repeat: no-repeat;
	height: 740px;
	text-align: center;
}

.top {
	padding-top: 290px;
}

#field {
	width: 200px;
	line-height: 37px;
	text-align: center;
	background-color: white;
	opacity: 0.83;
	padding: 7px;
	margin: 0 auto;
}

/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
	position: static;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
}
</style>



</head>

<body class="left-sidebar is-preload">


	<div id="page-wrapper">


		<!-- Header -->
		<div id="header" style="background-image: none;">
			<%@ include file="/template/nav.jsp"%>
		</div>



		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">

				<!-- 회원 관리 -->
				<div class="row" style="margin-bottom: -5em;">

					<div class="col-lg-6">
						<h2 align="left">회원 관리</h2>
					</div>

					<div class="col-lg-1">
						<select name="searchType" id="searchType" class="searchType">
							<option value="name">이름</option>
							<option value="id">아이디</option>
						</select>
					</div>

					<div class="col-lg-5">
						<div class="input-group mb-3" align="right">

							<input type="text" class="form-control" placeholder="검색"
								id="usertext" name="name">

							<div class="input-group-append">
								<span class="search"><button type="button"
										class="btn btn-success" style="z-index: 0">검색</button></span>
							</div>

						</div>
					</div>


					<hr style="color: #fff">
				</div>


				<hr class="line_light_w">

				<div align="right">
					<span class="dropdown">
						<button type="button" class="btn btn-success dropdown-toggle"
							data-toggle="dropdown">목록</button> <span class="dropdown-menu">
							<a class="dropdown-item" href="/MovieHolic/admin?act=alllist">전체목록</a>
							<%-- DB number값이 1일때 휴면. --%> <a class="dropdown-item"
							href="/MovieHolic/admin?act=inactiveList">휴면목록</a> <span
							class="btnUn"><a class="dropdown-item"
								href="/MovieHolic/admin?act=unsubscribelist">탈퇴목록</a></span>
					</span>
					</span> <span class="secession"><button type="button"
							class="btn btn-success" style="z-index: 0">탈퇴</button></span>
				</div>







				<!-- <member_search_result> -->
				<div class="member_search_result">


					<!-- 휴면후 탈퇴 적용시키기 위해 사용 -->
					<input type="hidden" class="searchresult" name="searchresult" value="no">
					<input type="hidden" class="mgInactiveList" name="mgInactiveList" value="mgInactiveList">
					
					
					<table class="table" style="border-bottom: 0.2em solid #fff;">
						<br>
						<thead>
							<tr>
								<th><span class="allcheckbox"><button type="button"
											class="btn btn-success" style="z-index: 0;">전체선택</button></span></th>
								<th>회원ID</th>
								<th>이름</th>
								<th>주민번호 앞자리</th>
								<th>연락처</th>
								<th>성별</th>
								<th>가입일</th>
								<th>탈퇴일</th>
								<th>휴면여부</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="ap" items='${ap.list}'>
								<tr>
									<td><c:if test="${ap.outdate == null}">
											<input type="checkbox" class="ap_checkbox" name="ap_checkbox"
												value="${ap.userId}" />
										</c:if></td>
									<td>${ap.userId}</td>
									<td>${ap.name }</td>
									<td>${ap.birth }</td>
									<td>${ap.phoneFirst }-${ap.phoneMid } - ${ap.phoneLast }</td>
									<td>${ap.gender }</td>
									<td>${ap.joinDate }</td>
									<td>${ap.outdate }</td>
									<td>
										<div>
											<button type="button" class="btn btn-success dropdown-toggle"
												data-toggle="dropdown">

												<c:if test="${ap.enable == 1}">휴면</c:if>
												<c:if test="${ap.enable == 0}">활동</c:if>

											</button>


											<div class="dropdown-menu">
												<span class="enableinactive"> <a
													class="dropdown-item"
													href="/MovieHolic/admin?act=enableinactive&ap_userId=${ap.userId}">
														<c:if test="${ap.enable == 1}">활동</c:if> <c:if
															test="${ap.enable == 0}">휴면</c:if>
												</a>
												</span>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>




					<div class="row">

						<div class="col-lg-2">


							<c:if test="${ap.startPage > 1 }">

								<span class="page_inactive"> <a
									href="${ap.startPage - 1}"><button class="btn btn-success">이전</button></a>
								</span>

							</c:if>


						</div>


						<div class="col-lg-2"></div>

						<div class="col-lg-4" style="align-content: center;">
							<ul class="pagination"
								style="width: 240px; margin-left: auto; margin-right: auto;">

								<c:forEach begin="${ap.startPage}" end="${ap.endPage}" var="i">
									<c:choose>

										<c:when test="${ap.currentPage == i}">
											<li class="page-item"><span><a class="page-link">${i}</a></span></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><span class="page_inactive"><a
													class="page-link" href="${i}">${i}</a></span></li>
										</c:otherwise>

									</c:choose>
								</c:forEach>

							</ul>
						</div>



						<div class="col-lg-2"></div>





						<div class="col-lg-2">

							<c:if test="${ap.totalPage > ap.endPage }">

								<span class="page_inactive"> <a href="${ap.endPage+1}"><button
											class="btn btn-success">다음</button></a>
								</span>

							</c:if>

						</div>


					</div>



				</div>
				<!-- member_search_result -->

			</div>
			<br> <br> <br>
			<%-- -------------------------------------------------------------------------------------------------- --%>



			<!-- 신고 게시글 관리 -->
			<div class="container">


				<div class="row" style="margin-bottom: -5em;">
					<div class="col-lg-4">
						<h2 align="left">신고 게시글 관리</h2>
					</div>
					<div class="col-lg-4"></div>
					<div class="col-lg-4"></div>

					<hr style="color: #fff">
				</div>


				<hr class="line_light_w">

				<div align="right">
					<span class="np_delete">
						<button class="btn btn-success" style="z-index: 0">삭제</button>
					</span>
				</div>










				<!-- notify_search_result -->
				<div class="notify_search_result">


					<table class="table" style="border-bottom: 0.2em solid #fff;">
						<br>
						<thead>
							<tr>
								<th><span class="allcheckbox2"><button type="button"
											class="btn btn-success" style="z-index: 0;">전체선택</button></span></th>
								<th>글번호</th>
								<th>분류</th>
								<th>작성자ID</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일</th>
								<th>신고수</th>
							</tr>
						</thead>
						<tbody>


							<c:forEach var="np" items='${np.list}'>
								<tr>
									<td><input type="checkbox" class="np_checkbox"
										name="np_checkbox" value="${np.seq }" /></td>
									<td>${np.seq }</td>
									<td>${np.boardName }</td>
									<td>${np.userId }</td>
									<td>${np.subject }</td>
									<td>${np.content }</td>
									<td>${np.postDate }</td>
									<td>${np.notify }</td>
								</tr>
							</c:forEach>




						</tbody>
					</table>


					<div class="row">


						<div class="col-lg-2">


							<c:if test="${np.startPage > 1 }">
								<span class="page_notify"> <a href="${np.startPage - 1}"><button
											class="btn btn-success">이전</button></a>
								</span>

							</c:if>


						</div>

						<div class="col-lg-2"></div>

						<div class="col-lg-4">
							<ul class="pagination"
								style="width: 240px; margin-left: auto; margin-right: auto;">

								<c:forEach begin="${np.startPage}" end="${np.endPage}" var="i">
									<c:choose>

										<c:when test="${np.currentPage == i}">
											<li class="page-item"><span><a class="page-link">${i}</a></span></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><span class="page_notify"><a
													class="page-link" href="${i}">${i}</a></span></li>
										</c:otherwise>

									</c:choose>
								</c:forEach>

							</ul>
						</div>

						<div class="col-lg-2"></div>

						<div class="col-lg-2">
							<c:if test="${np.totalPage > np.endPage }">

								<span class="page_notify"> <a href="${np.endPage+1}"><button
											class="btn btn-success">다음</button></a>
								</span>

							</c:if>
						</div>
					</div>



				</div>
				<!-- notify_search_result -->


			</div>
			<br>
			<br>
			<br>
			<br>


		</div>







		<%@ include file="/template/footer.jsp"%>