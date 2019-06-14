<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/MovieHolic/js/httpRequest.js"></script>










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






<script type="text/javascript">


var idcount = 1;
var resultView;
var birthresultView;

function idcheck() {
	
	resultView = document.getElementById("idresult");
	var searchId = document.getElementById("id").value;
	var emaildomain = document.getElementById("emaildomain").value;
	
	if (searchId.length < 4 || searchId.length > 16) {
		resultView.innerHTML = '<font color = "white">아이디는 4자 이상 16자리 이하입니다.</font>';
	} else {
		//resultView.innerHTML = '<font color = "white"></font>';
		var params = "act=idcheck&sid=" + searchId + "&emaildomain="+emaildomain;
		sendRequest("/MovieHolic/UsersFrontController", params, idcheckResult, "GET"); // 함수호출 3번째 collback은 갔다가 돌아올대 함수.
		resultView.innerHTML = '';
		
	}
	
};

function birthcheck(){
	
	birthresultView = document.getElementById("birthresult");
	var birth = document.getElementById("birth").value;

	if (birth.length == 10) {
		birthresultView.innerHTML = '<font color = "steelblue">확인</font>';
	} else{
		birthresultView.innerHTML = '<font color = "white">생년 월일을 8자리로 입력해 주세요.</font>';
	}
	
}



function idcheckResult() {
	if (httpRequest.readyState == 4) { // 데이터 정상으로 넘어왔다. 하지만 이상한 데이터(에러)로 넘어올 수 있음.
		if (httpRequest.status == 200) {
			//정상 처리
			var result = httpRequest.responseXML;
//			alert(result);
			idcount = parseInt(result.getElementsByTagName("cnt")[0].firstChild.data); 
			// <cnt>0</cnt> 전체를 얻어온거임. 그래서 .firstChild써줌 엘리먼트 안에 엘리먼트가 들어올 수 있음 그래서 .data를 써야뎀.
			// parseInt 자바 스크립트 것임. 자바 아님.
			
			if (idcount == 0) {
				resultView.innerHTML = '<font color = "steelblue">사용 가능합니다.</font>';
			} else {
				resultView.innerHTML = '<font color = "magenta">사용중입니다. 다른 아이디를 써주세요.</font>';
			}
			
		} else {
			//에러 처리
		}
	} else {
		//로딩중 아이디 중복검사는 안함.
	}
}


function register() {
	
	
	if(document.getElementById("name").value == "") {
		alert("이름을 입력하세요");
		return;
	 
	} else if(idcount != 0) {
		alert("아이디 중복 검사를  확인하세요");
		return; 
	} else if(document.getElementById("pass").value == "") {
		alert("비밀번호를 입력하세요");
		return;
	} else if(document.getElementById("pass").value.length < 4) {
		alert("비밀번호를 4자리 이상 입력하세요");
		return;
	} else if(document.getElementById("pass").value != document.getElementById("passcheck").value) {
		alert("비밀번호를 확인하세요");
		return;
	} else if(document.getElementById("birth").value.length < 8 ) {
		alert("생일을 확인해 주세요");
		return;
	} else if(document.getElementById("tel2").value.length != 4) {
		alert("휴대폰 번호를 확인해주세요");
		return;
	} else if(document.getElementById("tel3").value.length != 4 ) {
		alert("휴대폰 번호를 확인해주세요");
		return;
	} else {
		document.getElementById("signupform").action = "/MovieHolic/UsersFrontController";
		document.getElementById("signupform").submit();
		//<input type="hidden" name="act" value="register"> 개발자가 안보이게 넘길때.
	}
}
</script>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>회원가입</h2><br><br><br>
		
		
		<form id=signupform method="post" action="">
			<input type="hidden" name="act" value="register">
			
			
			<div align="left">
			<label for="email" >아이디&nbsp;&nbsp;&nbsp;&nbsp;<span id="idresult"></span></label>
			</div>
			<div class="form-group" align="left">
				<div id="email" class="row">
					
																							
					
					<div class="col-lg-6-inline"  style="padding:10; margin-left: 0; margin-top: 20;">
						<input type="text" class="form-control" id="id" name="id" placeholder="4자이상 16자 이하" onkeyup="javascript:idcheck();"> 
					</div>
					
					
					
					<div class="col-lg-1-inline" style="padding:10; margin: 0; padding-left:5; padding-right:5; margin-top: 20;">@</div>
					<div class="col-lg-5-inline" style="padding:10; margin: 0; margin-top: 20;">
						<select class="form-control" id="emaildomain" name="emaildomain" >
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
					
					
					
				</div>
			</div>
			
			
			
			
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="이름입력">
			</div>
			
			
			
			
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="pass" name="pass" placeholder="">
			</div>
			
			
			
			<div class="form-group" align="left">
				<label for="">비밀번호재입력</label>
				<input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="">
			</div>
			
			
			<div class="form-group" align="left">
				<label for="">생년월일 &nbsp;&nbsp;&nbsp;&nbsp;<span id="birthresult" ></span> </label>
				<input type="text" class="form-control" id="birth" name="birth" placeholder="2000-01-01" onkeyup="javascript:birthcheck();">
			</div>
			
			<div class="form-group" align="left">
				<div class="form-check">
					<label class="form-check-label" for="radio1">
					<input type="radio" class="form-check-input" id="man" name="gender" value="man" checked>남</label>
				</div>
				<div class="form-check">
					<label class="form-check-label" for="radio2">
					<input type="radio" class="form-check-input" id="woman" name="gender" value="woman">여</label>
				</div>
			</div>
			
			
			
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
				<select class="form-control" id="tel1" name="tel1">
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
			
			
			
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn" onclick="javascript:register();">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>










				


			</div><br><br><br><br>


		</div>







		<%@ include file="/template/footer.jsp"%>