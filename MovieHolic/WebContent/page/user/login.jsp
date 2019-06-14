<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>











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

/* $(document).ready(function(){
	
	var $loginFormObj = $("#loginform");
	$loginFormObj.submit(login);
	var $registerBtnObj = $("#moveRegisterBtn");
	
	$registerBtnObj.click(function (){
		$("nav>ul>li>a[href='user/member.html']").trigger("click"); 
		// trigger는 강제로 이벤트를 발생시켜라. semantic.html에서 click이벤트가 있으므로 거기있는것을 씀??
	});
	

}); */

$(document).ready(function(){
	$("#loginform").submit(function(){	 
			$.ajax({
				url:'/MovieHolic/UsersFrontController?act=login',
				method:'post',
				data:$('form').serialize(), // jqery만 사용하는 메소드
				success:function(result){ 
					if (result == 1) {
						alert("로그인 되었습니다.");
						location.href = "/MovieHolic/film";
					} else {
						alert("로그인이 실패되었습니다.")
					}
				}
			});
		return false;
	});
});



</script>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>로그인</h2>
		<form id="loginform" method="post">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" required="required" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="pass" name="pass" required="required" placeholder="">
			</div>
		</form>
		<div align="center">
			<button class="btn btn-warning" form="loginform" id="loginBtn" >로그인</button> <!-- onclick="javascript:login();" -->
			<a href="/MovieHolic/page/user/signup.jsp"><button class="btn btn-primary" id="moveRegisterBtn">회원가입</button></a>
		</div>
	</div>
</div>






				


			</div><br><br><br><br>


		</div>







		<%@ include file="/template/footer.jsp"%>