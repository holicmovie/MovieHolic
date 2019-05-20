<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<%@ include file="/template/nav.jsp" %>
	<!-- Main -->
	<div class="wrapper style1">


		<!-- 관리테이블 메뉴 -->

		<section id="banner">
			<header>
				<nav id="nav2">
					<ul>
						<li><a href="#">Management Table</a></li>
						<li><a href="/MovieHolic/admin/statistics.html">Statistical
								Chart</a></li>
					</ul>
				</nav>
			</header>
		</section>
		<br><br>


		<!-- 영화 관리 테이블 -->

		<div class="container">
			<h2>영화관리 Table</h2>
			<p>The .table-bordered class adds borders to a table:</p>
			<br>

			<div class="container">
				<form>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<img src="/MovieHolic/images/endgame.jpg" class="img-thumbnail" alt="Cinque Terre" width="150" height="200"> 
							</div>
							<div class="col-sm-6">
								<input type="text" id="usr">
							</div>
							<div class="col-sm-1">
								<input type="button" id="button" value="검색">
							</div>
							<div class="col-sm-1"></div>
						</div>
					</div>
				</form>
			</div>

			<div class="container">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th>영화제목</th>
							<th>감독</th>
							<th>개봉시기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>엔드게임</td>
							<td>엔소니 루소</td>
							<td>2019-04-25</td>
						</tr>
						<tr>
							<td>2</td>
							<td>두번째영화</td>
							<td>감독2</td>
							<td>2019-02-22</td>
						</tr>
						<tr>
							<td>3</td>
							<td>세번째영화</td>
							<td>감독3</td>
							<td>1994-06-18</td>
						</tr>
					</tbody>
				</table>



				<!-- 테이블 하단 -->
				<div class="row">

					<div class="col-lg-3"></div>
	
					<div class="col-lg-4">
						<div class="container">
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
					</div>
					<div class="col-lg-2"></div>
	
					<div class="col-lg-3">
						<div class="btn-group btn-group-lg" >
						    <button type="button" class="btn btn-primary"><a href="/MovieHolic/admin/edit-movie.html">수정</a></button>
						    <button type="button" class="btn btn-primary">삭제</button>
					 	</div>
					</div>

				</div>
			</div>
			
			<br><br><br><br><br>
		
		</div>


	<!-- 회원 관리 테이블 -->



		<div class="container">
			<h2>회원관리 Table</h2>
			<p>The .table-bordered class adds borders to a table:</p>
			<br>

			<div class="container">
				<form>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4">
								<img src="/MovieHolic/images/증명사진.PNG" class="img-thumbnail"
									alt="Cinque Terre" width="150" height="200">
							</div>
							<div class="col-sm-6">
								<input type="text" id="usr">
							</div>
							<div class="col-sm-1">
								<input type="button" id="button" value="검색">
							</div>
							<div class="col-sm-1"></div>
						</div>
					</div>
				</form>
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
					<div class="container">
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
				</div>
				<div class="col-lg-2"></div>

				<div class="col-lg-3">
					<div class="btn-group btn-group-lg" >
					    <button type="button" class="btn btn-primary">수정</button>
					    <button type="button" class="btn btn-primary">삭제</button>
				 	</div>
				</div>
			</div>
			
			<br><br><br><br><br>
			
		</div>
		

	<!-- 게시물 관리 테이블 -->

		<div class="container">
			<h2>신고 게시물 관리 Table</h2>
			<p>The .table-bordered class adds borders to a table:</p>
			<br>

			<div class="container">
				<form>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-6">
								<input type="text" id="usr">
							</div>
							<div class="col-sm-1">
								<input type="button" id="button" value="검색">
							</div>
							<div class="col-sm-1"></div>
						</div>
					</div>
				</form>
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
					<div class="container">
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
				</div>
				<div class="col-lg-2"></div>

				<div class="col-lg-3">
					<div class="btn-group btn-group-lg" >
					    <button type="button" class="btn btn-primary">수정</button>
					    <button type="button" class="btn btn-primary">삭제</button>
				 	</div>
				</div>

			</div>

		</div>
	</div>		
<%@ include file="/template/footer.jsp" %>