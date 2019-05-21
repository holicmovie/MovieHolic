<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<%@ include file="/template/nav.jsp" %>







<!-- 날짜 -->

<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>


<script type="text/javascript">
    jQuery(function ($) {
        $("#datepicker").shieldDatePicker();
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
        opacity:0.83;
        padding: 7px;
        margin: 0 auto;
    }
</style>	
	
	
	
	
	<!-- Main -->
	<div class="wrapper style1">

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
							<div class="col-sm-8">
								<div class="col-sm-12">
									<span style="color:#D4D4D4; font-weight:900; font-size:17px; opacity:1;"></span>
	        						<input id="datepicker"/>
								</div>
								<div class="col-sm-12">
									<div class="col-sm-10"></div>
										<div class="form-group">
									      <label for="usr"></label>
									      <input type="text" class="form-control" id="usr" name="username">
									    </div>
									<button type="button" class="btn btn-dark">검색</button>
								</div>
							</div>
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
						<div class="btn-group btn-group-lg" >
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
					<div class="btn-group btn-group-lg" >
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
					<div class="btn-group btn-group-lg" >
					    <button type="button" class="btn btn-primary">해제</button>
					    <button type="button" class="btn btn-primary">삭제</button>
				 	</div>
				</div>

			</div>

		</div>
	</div>		
<%@ include file="/template/footer.jsp" %>