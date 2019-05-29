<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%-- datepicker --%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<!-- 생년월일의 datepicker용 -->
<!-- <link href="/MovieHolic/assets/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="/MovieHolic/assets/js/datepicker.min.js"></script> -->
<!-- Include 한글버전 -->
<script src="/MovieHolic/assets/js/datepicker.kr.js"></script>

<style>
.btn_red{
	border: 1px solid red;
	width : 90px;
	background-color: #bf151d;
	color: #ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 15px;
}
</style>

<script>
<%-- datepicker --%>
$(function(){
	$('#datepicker').datepicker({
	    uiLibrary: 'bootstrap4'
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


		<!-- Main 시작 -->
		<div class="wrapper style1">

			<div class="container">
			
			<%-- 페이지 이동경로 --%>		
					<div class="row" style="margin-bottom:30px;">
						<div class="col-lg-12 col-12-mobile font_light_small">
							<span>✱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
							<span>&nbsp;&nbsp;❱❱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/setting.jsp" class="font_bold_small" ">Setting</a>
						</div>
					</div>
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
					<div class="col-lg-12 col-12-mobile">
						<h2>Account Setting</h2>
					</div>
				</div>
				<!-- **첫번째 행 끝 -->

				<!-- 프로필 내용 편집 form 시작 -->
				<form action="#">
				
					<!-- **두번째 행 시작 -->
					<div class="row">
										
						<!-- 프로필 사진 -->
						<div class="col-lg-2 col-12-mobile" id="content">
						
							<div align="center">
								<img src="/MovieHolic/images/user.png" width="100%" alt="user icon" style="margin-bottom:10px;" /><br>
								<label class="btn btn-success">수&nbsp;&nbsp;&nbsp;정<input type="file" style="display: none;"></label>
							</div>
							
						</div>

						<!-- id, 닉네임, 비번, 비번확인 -->
						<div class="col-lg-5 col-12-mobile">

							<div class="form-group">
								<label for="id">ID</label> <input type="text"
									class="form-control" id="id" value="shzy232" disabled="disabled">
							</div>
							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									class="form-control" id="name" value="김무비">
							</div>
							<div class="form-group">
								<label for="pass">비밀번호<font color="red">*</font></label> <input type="password"
									class="form-control" id="pass" placeholder="Password">
							</div>
							<div class="form-group">
								<label for="passck">비밀번호 확인<font color="red">*</font></label> <input type="password"
									class="form-control" id="passck" placeholder="Password Check">
							</div>

						</div>

						<!-- 전화번호, 생년월일, 성별 -->
						<div class="col-lg-5 col-12-mobile">
						
							<div class="form-group">
									<label for="tel">전화번호</label>
									<div id="tel" class="custom-control-inline">
										<select class="form-control" id="tel1" name="tel1" style="height:52px">
											<option value="010">010</option>
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="041">041</option>
											<option value="051">051</option>
											<option value="061">061</option>
										</select> _
										<input type="text" class="form-control" id="tel2" name="tel2" placeholder="1234"> _
										<input type="text" class="form-control" id="tel3" name="tel3" placeholder="5678">
									</div>
							</div>
									<div class="form-group">
									<label for="birth">생년월일</label>
									<input id="datepicker" width="150" name="birth" value="01/01/1995"/>
    						    </div>
    						    
								<div class="form-group">
									<label for="birth">성별</label>
									<div class="custom-control custom-radio">
										<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input" checked>
										<label class="custom-control-label" for="jb-radio-1">여</label>
									</div>
									<div class="custom-control custom-radio">
										<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
										<label class="custom-control-label" for="jb-radio-2">남</label>
									</div>
								</div>
								
							</div>
							
						</div>
						<!-- **두번째 행 끝 -->

						<!-- **세번째 행 시작 -->
						<div class="row">
						
							<!-- 간격 띄움 용 실선 -->
							<div class="col-lg-12 col-12-mobile">
								<hr></hr>
							</div>
						
						</div>
						<!-- **세번째 행 끝 -->

						<!-- **네번째 행 시작 -->
						<div class="row">
						
							<!-- 저장, 탈퇴 버튼 -->
							<div class="col-lg-12 col-12-mobile" align="center">
								<button class="btn btn-success" style="margin-right:5%">저&nbsp;&nbsp;&nbsp;장</button>
								<button class="btn btn_red">탈&nbsp;&nbsp;&nbsp;퇴</button>
							</div>
							
						</div>
						<!-- **네번째 행 끝 -->
						
				</form>
				<!-- 프로필 내용 편집 form 끝 -->
				
			</div>
		</div>
		<!-- Main 끝 -->

<%@ include file="/template/footer.jsp" %>