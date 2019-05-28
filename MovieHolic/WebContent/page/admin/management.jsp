<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>


<!--  style="width:100%; border-bottom: 0.3em solid #fff;" -->





<script type="text/javascript">
	jQuery(function($) {
		$(".datepicker").shieldDatePicker();
	});
</script>


<style>


tr>td>input {
		-ms-transform: scale(2); /* IE */
		-moz-transform: scale(2); /* FF */
		-webkit-transform: scale(2); /* Safari and Chrome */
		-o-transform: scale(2); /* Opera */
}
	



.container {
	background-image: url("/Content/img/datepicker/s4.png");
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
						<div class="dropdown">
							<button type="button" class="btn btn-success dropdown-toggle"
								data-toggle="dropdown">이름</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">아이디</a>
							</div>
						</div>
					</div>

					<div class="col-lg-5">
						<div class="input-group mb-3" align="right">
							<input type="text" class="form-control" placeholder="검색"
								id="name" name="name">
							<div class="input-group-append">
								<button type="submit" class="btn btn-success" style="z-index: 0">검색</button>
							</div>
						</div>
					</div>

					<hr style="color: #fff">
				</div>


				<hr class="line_light_w">

				<div align="right">
					<button type="submit" class="btn btn-success" style="z-index: 0">검색</button>
				</div>
				<!-- <button type="submit" class="btn btn-success">검색</button> -->


				<table class="table" style="border-bottom: 0.2em solid #fff;">
					<br>
					<thead>
						<tr>
							<th></th>
							<th>회원ID</th>
							<th>이름</th>
							<th>주민번호 앞자리</th>
							<th>연락처</th>
							<th>성별</th>
							<th>가입일</th>
							<th>탈퇴일</th>
							<td>휴면 여부</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>abc123@naver.com</td>
							<td>김무비</td>
							<td>940618</td>
							<td>111-1111-1111</td>
							<td>남</td>
							<td>2019.01.01</td>
							<td>-</td>
							<td>
								<div>
									<button type="button" class="btn btn-success dropdown-toggle"
										data-toggle="dropdown">활동</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">휴면</a>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>abc123@naver.com</td>
							<td>김무비</td>
							<td>940618</td>
							<td>111-1111-1111</td>
							<td>남</td>
							<td>2019.01.01</td>
							<td>-</td>
							<td>
								<div>
									<button type="button" class="btn btn-success dropdown-toggle"
										data-toggle="dropdown">활동</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">휴면</a>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>abc123@naver.com</td>
							<td>김무비</td>
							<td>940618</td>
							<td>111-1111-1111</td>
							<td>남</td>
							<td>2019.01.01</td>
							<td>-</td>
							<td>
								<div>
									<button type="button" class="btn btn-success dropdown-toggle"
										data-toggle="dropdown">활동</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">휴면</a>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>abc123@naver.com</td>
							<td>김무비</td>
							<td>940618</td>
							<td>111-1111-1111</td>
							<td>남</td>
							<td>2019.01.01</td>
							<td>-</td>
							<td>
								<div>
									<button type="button" class="btn btn-success dropdown-toggle"
										data-toggle="dropdown">활동</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">휴면</a>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>abc123@naver.com</td>
							<td>김무비</td>
							<td>940618</td>
							<td>111-1111-1111</td>
							<td>남</td>
							<td>2019.01.01</td>
							<td>2019.01.13</td>
							<td>
								<div>
									<button type="button" class="btn btn-success dropdown-toggle"
										data-toggle="dropdown">활동</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">휴면</a>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="row">

					<div class="col-lg-2">
						<button type="submit" class="btn btn-success">이전</button>
					</div>

					<div class="col-lg-2"></div>

					<div class="col-lg-4">
						<ul class="pagination"
							style="width: 240px; margin-left: auto; margin-right: auto;">
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
						</ul>
					</div>

					<div class="col-lg-2"></div>

					<div class="col-lg-2">
						<button type="submit" class="btn btn-success">다음</button>
					</div>


				</div>

			</div>
			<br> <br> <br>












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
					<button type="submit" class="btn btn-success" style="z-index: 0">삭제</button>
				</div>


				<table class="table" style="border-bottom: 0.2em solid #fff;">
					<br>
					<thead>
						<tr>
							<th></th>
							<th>번호</th>
							<th>분류</th>
							<th>작성자ID</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성일</th>
							<th>신고수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" /></td>
							<td>1</td>
							<td>List</td>
							<td>abc123</td>
							<td>으히히히</td>
							<td>신고게시물이다. 스포내용담고있음</td>
							<td>2019.05.25</td>
							<td>20</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td>2</td>
							<td>Review</td>
							<td>abc123</td>
							<td>으히히히</td>
							<td>신고게시물이다. 스포내용담고있음</td>
							<td>2019.05.25</td>
							<td>120</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td>3</td>
							<td>List</td>
							<td>abc12223</td>
							<td>으히히히</td>
							<td>신고게시물이다. 스포내용담고있음</td>
							<td>2019.05.25</td>
							<td>45</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td>4</td>
							<td>Review</td>
							<td>DDong</td>
							<td>으히히히</td>
							<td>신고게시물이다. 스포내용담고있음</td>
							<td>2019.05.25</td>
							<td>88</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td>5</td>
							<td>List</td>
							<td>abc123</td>
							<td>으히히히</td>
							<td>신고게시물이다. 스포내용담고있음</td>
							<td>2019.05.25</td>
							<td>1004</td>
						</tr>
					</tbody>
				</table>


				<div class="row">


					<div class="col-lg-2">
						<button type="submit" class="btn btn-success">이전</button>
					</div>

					<div class="col-lg-2"></div>

					<div class="col-lg-4">
						<ul class="pagination"
							style="width: 240px; margin-left: auto; margin-right: auto;">
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
						</ul>
					</div>

					<div class="col-lg-2"></div>

					<div class="col-lg-2">
						<button type="submit" class="btn btn-success">다음</button>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>





<%@ include file="/template/footer.jsp"%>