<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_340.jsp" %>
<%@ include file="/template/boot_400.jsp" %>
<style>
<!-- 좋아요 둥근 버튼을 위해 필요 -->
.btn-circle.btn-xl {
    width: 70px;
    height: 70px;
    padding: 10px 16px;
    border-radius: 35px;
    font-size: 24px;
    line-height: 1.33;
}
.btn-circle {
    width: 40px;
    height: 40px;
    padding: 6px 0px;
    border-radius: 22px;
    text-align: center;
    font-size: 12px;
    line-height: 1.42857;
}
</style>
<%@ include file="/template/nav.jsp" %>

		<!-- Main 시작-->
		<div class="wrapper style1">

			<div class="container">
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
					
					<div class="col-12 col-12-mobile">
					<!-- 탭 메뉴 시작-->
						<!-- 탭 2개 선언 -->
						<ul class="nav nav-tabs">
 						    <li class="active"><a data-toggle="tab" href="#followings">Followings</a></li>
						    <li><a data-toggle="tab" href="#followers">Followers</a></li>
					  	</ul>
					  
					  <!-- 탭 페이지 2개 구성 -->
					  <div class="tab-content">
					  
						  <!-- 첫번째 탭 페이지 -->
							<div id="followings" class="tab-pane fade in active">
							<br>
								<table class="table table-hover table-dark">
								  <thead>
								    <tr>
								      <th scope="col">no.</th>
								      <th scope="col">Name</th>
								      <th scope="col">Lists</th>
								      <th scope="col">Likes</th>
								      <th scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <th scope="row">1</th>
								      <td>Mark</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 100</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 300</td>
								      <td>
								      	<button type="button" class="btn btn-danger btn-circle btn-xl"><i class="fa fa-times"></i></button>
									  </td>
								    </tr>
								    <tr>
								      <th scope="row">2</th>
								      <td>Jacob</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 200</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 150</td>
								      <td>
								      	<button type="button" class="btn btn-success btn-circle btn-xl"><i class="fa fa-check"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Larry</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 400</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 342</td>
								      <td>
								      	<button type="button" class="btn btn-success btn-circle btn-xl"><i class="fa fa-check"></i></button>
								      </td>
								    </tr>
								  </tbody>
								</table>
  					   		</div>
  					   		
  					   		 <!-- 두번째 탭 페이지 -->
							<div id="followers" class="tab-pane fade">
							<br>
								<table class="table table-hover table-dark">
								  <thead>
								    <tr>
								      <th scope="col">no.</th>
								      <th scope="col">Name</th>
								      <th scope="col">Lists</th>
								      <th scope="col">Likes</th>
								      <th scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <th scope="row">1</th>
								      <td>Ace</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 100</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 300</td>
								      <td>
								      	<button type="button" class="btn btn-default btn-circle btn-xl"><i class="fa fa-plus"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">2</th>
								      <td>Jamy</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 200</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 150</td>
								      <td>
								      	<button type="button" class="btn btn-default btn-circle btn-xl"><i class="fa fa-plus"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Emma</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 400</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 342</td>
								      <td>
								      	<button type="button" class="btn btn-default btn-circle btn-xl"><i class="fa fa-plus"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">4</th>
								      <td>Jimmy</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 500</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 342</td>
								      <td>
								       	<button type="button" class="btn btn-success btn-circle btn-xl"><i class="fa fa-check"></i></button>
								      </td>
								    </tr>
								  </tbody>
								</table>
  					   		</div>
  					   		
					  </div>
					<!-- 탭 메뉴 끝 -->
					
					</div>
				</div>
				<!-- **첫번째 행 끝 -->
				
			</div>

		</div>
		<!-- Main 끝-->
<%@ include file="/template/footer.jsp" %>