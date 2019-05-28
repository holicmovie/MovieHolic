<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>


<!-- 날짜 -->
<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript"	src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"	src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>


<script type="text/javascript">
	jQuery(function($) {
		$(".datepicker").shieldDatePicker();
	});
</script>


<style>
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
</style>

</head>

<body class="left-sidebar is-preload">


<div id="page-wrapper">


<!-- Header -->
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>
<!-- Main -->

<div class="wrapper style1">



	<%-- 회원 관리 테이블 --%>
	<div class="container">
		<div class="row">

			<div class="col-lg-4">
				<img src="/MovieHolic/images/증명사진.PNG" class="img-thumbnail"
					width="170" height="220">
			</div>

			<div class="col-lg-8">
				<div class="col-lg-12">
					<h2 align="left">Member Management Table</h2>
					<p align="left">This table is a table to manage members :</p>
				</div>
				<div class="col-lg-12">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="user name"
							id="name" name="name">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary">Search</button>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="float-right">
							<span
								style="color: #D4D4D4; font-weight: 900; font-size: 17px; opacity: 1;">Old
								Date:</span> <input class="datepicker" /> &nbsp;<strong>~</strong>&nbsp;
							<span
								style="color: #D4D4D4; font-weight: 900; font-size: 17px; opacity: 1;">Now
								Date:</span> <input class="datepicker" />
						</div>
					</div>
				</div>
			</div>
		</div>



		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>연령</th>
					<th>연락처</th>
					<th>성별</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>임꺽정</td>
					<td>Rjrwjd</td>
					<td>130</td>
					<td>111-1111-1111</td>
					<td>남</td>
					<td>Rjrwjd@naver.com</td>
				</tr>
				<tr>
					<td>2</td>
					<td>임춘자</td>
					<td>cnswk</td>
					<td>110</td>
					<td>111-1234-1111</td>
					<td>여</td>
					<td>cnswk@naver.com</td>
				</tr>
				<tr>
					<td>3</td>
					<td>dygks</td>
					<td>Rjrwjd</td>
					<td>30</td>
					<td>111-1111-1234</td>
					<td>남</td>
					<td>dygks@naver.com</td>
				</tr>
			</tbody>
		</table>


		<!-- 테이블 하단 -->
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-4">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
			<div class="col-lg-2"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2">
				<div class="btn-group btn-group-lg">
					<button type="button" class="btn btn-primary">삭제</button>
				</div>
			</div>
		</div>
	</div>







	<%-- 신고 관리 테이블 --%>
	<div class="container">
		<div class="row">


			<div class="col-lg-12">
				<div class="col-lg-12">
					<h2 align="left">Declaration Management Table</h2>
					<p align="left">This table is a Declaration Management Table :
					</p>
				</div>
				<div class="col-lg-12">


					<div class="input-group lg-12">


						<div class="col-lg-2">
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">Dropdown button</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">이름</a> <a
										class="dropdown-item" href="#">아이디</a> <a
										class="dropdown-item" href="#">제목</a>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="moive name"
							id="name" name="name">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary">Search</button>
						</div>


					</div><br>





					<div class="col-lg-12">
						<div class="float-right">
							<span
								style="color: #D4D4D4; font-weight: 900; font-size: 17px; opacity: 1;">Old
								Date:</span> <input class="datepicker" /> &nbsp;<strong>~</strong>&nbsp;
							<span
								style="color: #D4D4D4; font-weight: 900; font-size: 17px; opacity: 1;">Now
								Date:</span> <input class="datepicker" />
						</div>
					</div><br><br>
					
					
				</div>
			</div>
		</div>




		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>게시물 제목</th>
					<th>게시물 내용</th>
					<th>작성일</th>
					<th>분류</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>임꺽정</td>
					<td>Rjrwjd</td>
					<td>으아아아아</td>
					<td>안녕하세요 신고 게시물입니다...</td>
					<td>2019-05-21</td>
					<td>분류1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>임춘자</td>
					<td>cnswk</td>
					<td>으아아아아</td>
					<td>신고합니다아아아아아...</td>
					<td>2019-05-21</td>
					<td>분류1</td>
				</tr>
				<tr>
					<td>3</td>
					<td>dygks</td>
					<td>Rjrwjd</td>
					<td>으아아아아</td>
					<td>신고한다아아아아아ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄴㅇㄹㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ글자제한하기...</td>
					<td>2019-04-44</td>
					<td>분류2</td>
				</tr>
			</tbody>
		</table>

		<!-- 테이블 하단 -->
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-4">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
			<div class="col-lg-2"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2">
				<div class="btn-group btn-group-lg">
					<button type="button" class="btn btn-primary">삭제</button>
				</div>
			</div>
		</div>

	</div>


</div>

<%@ include file="/template/footer.jsp"%>