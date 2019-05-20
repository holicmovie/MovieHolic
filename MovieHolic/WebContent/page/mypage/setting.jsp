<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/nav.jsp" %>

		<!-- Main 시작 -->
		<div class="wrapper style1">

			<div class="container">
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
					<div class="col-12 col-12-mobile">
						<h2>Account Setting</h2>
					</div>
				</div>
				<!-- **첫번째 행 끝 -->

				<!-- 프로필 내용 편집 form 시작 -->
				<form action="#">
				
					<!-- **두번째 행 시작 -->
					<div class="row">
										
						<!-- 프로필 사진 -->
						<div class="col-2 col-12-mobile" id="content">
						
							<div align="center">
								<img src="/MovieHolic/images/user.png" width="100%" alt="user icon" /><br>
								<button class="btn btn-primary">Edit</button>
							</div>
							
						</div>

						<!-- id, 닉네임, 비번, 비번확인 -->
						<div class="col-5 col-12-mobile">

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
						<div class="col-5 col-12-mobile">
						
							<div class="form-group">
								<label for="tel">전화번호</label>
									<input type="text"
										class="form-control" id="tel" name="tel" value="010-1234-5678">
							</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" value="abc1234@naver.com">
								</div>
								<div class="form-group">
									<label for="bio">자기소개</label>
									<textarea class="form-control" rows="1" readonly id="bio">안녕하세요. 반갑습니다.</textarea>
								</div>
								
							</div>
							
						</div>
						<!-- **두번째 행 끝 -->

						<!-- **세번째 행 시작 -->
						<div class="row">
						
							<!-- 간격 띄움 용 실선 -->
							<div class="col-12 col-12-mobile">
								<hr></hr>
							</div>
						
						</div>
						<!-- **세번째 행 끝 -->

						<!-- **네번째 행 시작 -->
						<div class="row">
						
							<!-- 저장, 탈퇴 버튼 -->
							<div class="col-12 col-12-mobile" align="center">
								<button type="submit" class="btn btn-primary" style="margin-right:5%">저장</button>
								<button type="submit" class="btn btn-primary">탈퇴</button>
							</div>
							
						</div>
						<!-- **네번째 행 끝 -->
						
				</form>
				<!-- 프로필 내용 편집 form 끝 -->
				
			</div>
		</div>
		<!-- Main 끝 -->

<%@ include file="/template/footer.jsp" %>