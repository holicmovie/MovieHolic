<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<%@ include file="/template/nav.jsp" %>
<!-- Main -->
<div class="wrapper style1">
	<h2 align="center">영화 수정 페이지</h2>
	<br> <br>
	<div class="container">
		<form>
			<div class="form-group">
				<div align="center">
					<img src="/MovieHolic/images/endgame.jpg" class="img-rounded"
						alt="Cinque Terre" width="15%" height="20%" align="center">
				</div>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-2" align="right">아이디</div>
					<div class="col-lg-4">
						<input class="form-control" type="text">
					</div>
					<div class="col-lg-2"></div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-2" align="right">비밀번호</div>
					<div class="col-lg-4">
						<input class="form-control" type="text">
					</div>
					<div class="col-lg-2"></div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-2" align="right">비밀번호 수정</div>
					<div class="col-lg-4">
						<input class="form-control" type="text">
					</div>
					<div class="col-lg-2"></div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-2" align="right">비밀번호 확인</div>
					<div class="col-lg-4">
						<input class="form-control" type="text">
					</div>
					<div class="col-lg-2"></div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-2" align="right">휴대폰 번호</div>
					<div class="col-lg-1">
						<select class="form-control input-lg">
							<option>010</option>
							<option>011</option>
							<option>019</option>
						</select>
					</div>
					<div class="col-lg-1">
						<input class="form-control" type="text">
					</div>
					<div class="col-lg-1">
						<input class="form-control" type="text">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-2" align="right">이메일</div>
					<div class="col-lg-2">
						<input class="form-control" type="text">
					</div>
					<div class="col-lg-2">
						<select class="form-control input-lg">
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>daum.net</option>
						</select>
					</div>
					<div class="col-lg-2"></div>
				</div>
				<br>
			</div>


			<div class="row">
				<div class="col-lg-5"></div>
				<div class="col-lg-1">
					<input type="button" value="수정">
				</div>
				<div class="col-lg-1">
					<input type="button" value="완료">
				</div>
				<div class="col-lg-5"></div>
			</div>


		</form>
	</div>
</div>
<%@ include file="/template/footer.jsp" %>