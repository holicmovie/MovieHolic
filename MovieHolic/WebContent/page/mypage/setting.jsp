<%@page import="com.kitri.dto.UserDto"%>
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

/* 프로필 사진 큰 버전 */
.profile_edit_icon {
	width: 170px;
	height: 170px;
	border-radius: 85px; /* 이미지 반크기만큼 반경을 잡기*/
	border: 5px solid white;
	margin-bottom:20px;
}

/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
    top:1em;
}
</style>

<script>
<%-- datepicker --%>
$(function(){
	$('#datepicker').datepicker({
	    uiLibrary: 'bootstrap4'
	});
});
$(function(){	
	$("#modify").click(function(){
		var form = $('form')[0];           // 첫번째 폼 객체
		var formData = new FormData(form); // formData = 
		console.log(formData.get('a'));
		console.log(formData.get('f1'));
		$.ajax({
			url:'mypage',
			method:'post',
			processData: false,
            contentType: false,
			data:formData,
			success:function(result){
				alert("파일업로드 OK");
				$("img").html(result.trim());				
			}
		});
		return false;
	});
});
$(function() {
	$("#save").click(function () {
		alert("저장완료");
	});
});
</script>

</head>
<body class="left-sidebar is-preload">
<%UserDto dto = (UserDto)request.getAttribute("setting"); 
String gender = dto.getGender();%>
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
							<a href="/MovieHolic/page/mypage/setting.jsp" class="font_bold_small">Setting</a>
						</div>
					</div>
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
					<div class="col-lg-12 col-12-mobile">
						<h2>나의 정보 수정</h2>
						<hr class="line_bold">
					</div>
				</div>
				<!-- **첫번째 행 끝 -->

				<!-- 프로필 내용 편집 form 시작 -->
				<form method="post" enctype="multipart/form-data" action="mypage">
				
					<!-- **두번째 행 시작 -->
					<div class="row">
										
						<!-- 프로필 사진 -->
						<div class="col-lg-2 col-12-mobile" id="content">
						
							<div align="center">
								<img id="profile"src="/MovieHolic/images/profile/user.jpg" class="profile_edit_icon" alt="user icon"></img>
							
								
							<br>
								<label id="modify"class="btn btn-success">수&nbsp;&nbsp;&nbsp;정<input id="input"type="file" style="display:none"></label>
							</div>
							
						</div>

						<!-- id, 닉네임, 비번, 비번확인 -->
						<div class="col-lg-5 col-12-mobile font_light_small">

							<div class="form-group">
								<label for="id">ID</label> <input type="text"
									class="form-control" id="id" value="<%=dto.getUserId() %>" disabled="disabled">
							</div>
							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									class="form-control" id="name" value="<%= dto.getName()%>">
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
						<div class="col-lg-5 col-12-mobile font_light_small">
						
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
										<input type="text" class="form-control" id="tel2" name="tel2" value="<%=dto.getPhoneMid()%>"> _
										<input type="text" class="form-control" id="tel3" name="tel3" value="<%=dto.getPhoneLast()%>">
									</div>
							</div>
									<div class="form-group">
									<label for="birth">생년월일</label>
									<input id="datepicker" width="150" name="birth" value="<%=dto.getBirth()%>"/>
    						    </div>
    						    
    						    <div class="form-group">
									<label for="birth">성별</label>
    						    <%if(gender.equals("남")){ %>
    						    <div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="optradio" checked>남
								  </label>
								</div>
								<div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="optradio">여
								  </label>
								</div>
								  <%}else{ %>
								  <div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="optradio" checked>여
								  </label>
								</div>
								<div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="optradio">남
								  </label>
								</div>
								  <%} %>
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
								<button id="save"class="btn btn-success" style="margin-right:5%">저&nbsp;&nbsp;&nbsp;장</button>
								<button id="delete"class="btn btn_red">탈&nbsp;&nbsp;&nbsp;퇴</button>
							</div>
							
						</div>
						<!-- **네번째 행 끝 -->
						
				</form>
				<!-- 프로필 내용 편집 form 끝 -->
				
			</div>
		</div>
		<!-- Main 끝 -->

<%@ include file="/template/footer.jsp" %>