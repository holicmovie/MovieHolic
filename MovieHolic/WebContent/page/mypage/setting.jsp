<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

<!-- 생년월일의 datepicker용 -->
<link href="/MovieHolic/assets/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="/MovieHolic/assets/js/datepicker.min.js"></script>
<!-- Include 한글버전 -->
<script src="/MovieHolic/assets/js/datepicker.kr.js"></script>
<!-- 생년월일의 datepicker용 -->

</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>


		<!-- Main 시작 -->
		<div class="wrapper style1">

			<div class="container">
			
			<div class="row" style="margin-bottom:30px; color:white">
					<div class="col-lg-12 col-12-mobile">
						<span>· My Page</span>
						<span class=""> > Setting</span>
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
								<img src="/MovieHolic/images/user.png" width="100%" alt="user icon" /><br>
								<label class="btn btn-dark">Search<input type="file" style="display: none;"></label>
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

						<!-- 전화번호, email, 자기소개 -->
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
									<input type="text" class="datepicker-here" data-language='kr' id="birth" value="1995-01-01">
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
								<button type="submit" class="btn btn-dark" style="margin-right:5%">저장</button>
								<button type="submit" class="btn btn-danger">탈퇴</button>
							</div>
							
						</div>
						<!-- **네번째 행 끝 -->
						
				</form>
				<!-- 프로필 내용 편집 form 끝 -->
				
			</div>
		</div>
		<!-- Main 끝 -->

<%@ include file="/template/footer.jsp" %>