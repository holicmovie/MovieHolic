<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

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
.btn_green{
    color: #fff;
    background-color: #5cb85c;
    border-color: #4cae4c;
}
</style>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main 시작-->
		<div class="wrapper style1">

			<div class="container">
			
			<div class="row" style="margin-bottom:30px; color:white">
					<div class="col-lg-12 col-12-mobile">
						<span>· My Page</span>
						<span class=""> > Social</span>
					</div>
				</div>
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
					
					<div class="col-lg-12 col-12-mobile">
					<!-- 탭 메뉴 시작-->
						<!-- 탭 2개 선언 -->
						<ul class="nav nav-tabs" role="tablist">
 						    <li class="nav-item">
 						    	<a class="nav-link active"  data-toggle="tab" href="#followings">Followings</a>
 						    </li>
						    <li class="nav-item">
						    	<a class="nav-link" data-toggle="tab" href="#followers">Followers</a></li>
					  	</ul>
					  
					  <!-- 탭 페이지 2개 구성 -->
					  <div class="tab-content">
					  
						  <!-- 첫번째 탭 페이지 -->
							<div id="followings" class="container tab-pane active">
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
								      	<button type="button" class="btn btn_green btn-circle btn-xl"><i class="fa fa-check"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Larry</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 400</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 342</td>
								      <td>
								      	<button type="button" class="btn btn_green btn-circle btn-xl"><i class="fa fa-check"></i></button>
								      </td>
								    </tr>
								  </tbody>
								</table>
								
								<!-- 페이지 처리 -->
								<div class="row">
									<div class="col-lg-12 col-12-mobile">
						  		<div style="float: left">
									<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
								</div>
						  		<div style="float: right;">
									<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
								</div>
							  	<ul class="pagination justify-content-center">
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
							 	 </ul>
								<%-- float clear용 빈 div --%>
								<div style="clear: both;"></div>
						 		</div>
								</div>
  					   		</div>
  					   		
  					   		 <!-- 두번째 탭 페이지 -->
							<div id="followers" class="container tab-pane fade">
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
								      	<button type="button" class="btn btn-secondary btn-circle btn-xl"><i class="fa fa-plus"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">2</th>
								      <td>Jamy</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 200</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 150</td>
								      <td>
								      	<button type="button" class="btn btn-secondary btn-circle btn-xl"><i class="fa fa-plus"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Emma</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 400</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 342</td>
								      <td>
								      	<button type="button" class="btn btn-secondary btn-circle btn-xl"><i class="fa fa-plus"></i></button>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">4</th>
								      <td>Jimmy</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> 500</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i> 342</td>
								      <td>
								       	<button type="button" class="btn btn_green btn-circle btn-xl"><i class="fa fa-check"></i></button>
								      </td>
								    </tr>
								  </tbody>
								</table>
								
								<!-- 페이지 처리 -->
								<div class="row">
									<div class="col-lg-12 col-12-mobile">
						  		<div style="float: left">
									<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
								</div>
						  		<div style="float: right;">
									<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
								</div>
							  	<ul class="pagination justify-content-center">
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
								    <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
							 	 </ul>
								<%-- float clear용 빈 div --%>
								<div style="clear: both;"></div>
						 		</div>
								</div>
								
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