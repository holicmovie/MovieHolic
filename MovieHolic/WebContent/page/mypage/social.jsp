<%@page import="com.kitri.dto.mypage.PageBean"%>
<%@page import="com.kitri.dto.SocialDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- 소셜 페이지 눌렀을 때 출력 -->
  <script>
 $(function(){

	<%--following 아이디 목록 --%>
	$.ajax({
		url: '/MovieHolic/mypage?page=social', 
		method:'get', 
		success:function(result){
			alert("following");
			$("#followingsection").html(result.trim());
		}
	});
	
	return false;
	
});  
  
  
  
 
  
$(function(){
	
	$(".deletef").click(function() {
			
			var followingid = $(this).find("table>tbody>td.followingid").html();
				
			$.ajax({
				url:"/MovieHolic/mypage?page=social",
				method: "GET",
				data:"deletefollowing=" + followingid,
				success: function(result){
					System.out.println(followingid);
				}
			});
			return false;
		});
	
	
	$("followingpaging").click(function(){
	
		var currentpage=$(this).attr("href");
		alert(currentPage+"페이지를 보여줍니다.");
		 $.ajax({
			url:url,
			method:"GET",
			success:function(result){
				$("section").html(result.trim());
			}
		});
		return false;
	}); 
	
});	
 $(function(){
	$("followerpaging").click(function(){
		
		var currentpage=$(this).attr("href");
		alert(currentPage+"페이지를 보여줍니다.");
		 $.ajax({
			url:url,
			method:"GET",
			success:function(result){
				$("section").html(result.trim());
			}
		});
		return false;
	});
}); 

$(function(){
	$(".deletef").click(function() {
			
			var followingid = $(this).find("table>tbody>td.followingid").html();
				
			$.ajax({
				url:"/MovieHolic/mypage?page=social",
				method: "GET",
				data:"deletefollowing=" + followingid,
				success: function(result){
					System.out.println(followingid);
				}
			});
			return false;
		});
});
	 
	
</script>
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
			
			<%-- 페이지 이동경로 --%>		
					<div class="row" style="margin-bottom:30px;">
						<div class="col-lg-12 col-12-mobile font_light_small">
							<span>✱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/social.jsp" class="font_bold_small">Social</a>
						</div>
					</div>
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
					<%		String test = (String)request.getAttribute("test"); %>
					<div class="col-lg-12 col-12-mobile">
					
					<!-- 탭 메뉴 시작-->
						<!-- 탭 2개 선언 -->
						<button class="btn btn-success font_bold_small" id = "btnFollowing">Followings</button>
						<button class="btn btn-success font_bold_small" id = "btnFollowers">Followers</button>
						
<!-- 						<ul class="nav nav-tabs" role="tablist" id="myTab">
 						  
 						   	<li class="nav-item" id="myTab1">
 						    	<a class="nav-link active"  data-toggle="tab" href="#followings">Followings</a>
 						    </li>
 						    <li class="nav-item" id="myTab2">
						    	<a class="nav-link" data-toggle="tab" href="#followers">Followers</a>
						    </li>
						   
					  	</ul>
 -->					  
					<section id = "followingsection">	</section>
					
					  <!-- 탭 페이지 2개 구성 -->
				<!-- 	  <div class="tab-content"> -->
					  
						  <!-- 첫번째 탭 페이지 -->
							<%-- <div id="followings" class="container tab-pane active" role = "tabpanel">
							<br>
								<table class="table table-hover table-dark">
								  <thead>
								    <tr>
								      <th scope="col">no.</th>
								      <th scope="col">ID</th>
								      <th scope="col">Name</th>
								      <th scope="col">Lists</th>
								      <th scope="col">Likes</th>
								      <th scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								<%PageBean pb = (PageBean)request.getAttribute("pb");
									System.out.println(pb);
								%>						  
						
								<c:set var = "pb" value="${requestScope.pb}"/>
								  
								  social following page 위한 for문
								   
								    <c:forEach var="pb" items='${pb.list}'>
								    <tr>
								    
								      <th scope="row">${pb.no}</th>
								      <td class = "followingid">${pb.followingId}</td>
								      <td>${pb.name}</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> ${pb.best_count }</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i>${pb.list_count }</td>
								      <td>
								      	<button type="button" class="btn btn-danger btn-circle btn-xl deletef" ><i class="fa fa-times"></i></button>
									  </td>
								    </tr>
								    
								    
								   </c:forEach>
								  </tbody>
								</table>
								
								
								
								<!-- 페이지 처리 -->
								<div class="row">
									<div class="col-lg-12 col-12-mobile" id = "">
									
					
						<div style="float: left">
							<c:if test="${pb.startPage > 1 }">
								<a href="/MovieHolic/mypage?page=social&followingpage=${pb.startPage - 1}"><button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button></a>
								
							</c:if>
						</div>
								
								
								
						<div style="float: right;">
							<c:if test="${pb.totalPage > pb.endPage }">
							<a href="/MovieHolic/mypage?page=social&followingpage=${pb.endPage+1}"><button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button></a>
							</c:if>
						</div>
				
							  	<ul class="pagination justify-content-center">
							  	<c:forEach begin="${pb.startPage}" end="${pb.endPage}" var="i">
									<c:choose>

										<c:when test="${pb.currentPage == i}">
											<li class="page-item"><a class="page-link a">${i}</a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item">
											<a class="page-link a" href="/MovieHolic/mypage?page=social&followingpage=${i}">${i}</a></li>
										</c:otherwise>

									</c:choose>
								</c:forEach>
							  	 
							 	 
							 	 </ul>
								float clear용 빈 div
								<div style="clear: both;"></div>
						 		</div>
								</div>
  					   		</div>
  					   		 --%>
  					   		
  					   		
  					   		
  					   		
  					   		
  					   		 <!-- 두번째 탭 페이지 -->
							<%-- <div id="followers" class="container tab-pane" role = "tabpanel">
							<br>
								<table class="table table-hover table-dark">
								  <thead>
								    <tr>
								      <th scope="col">no.</th>
								      <th scope="col">ID</th>
								      <th scope="col">Name</th>
								      <th scope="col">Lists</th>
								      <th scope="col">Likes</th>
								      <th scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								  <%PageBean pbf = (PageBean)request.getAttribute("pbf");
								  	System.out.println(pbf);
								  %>	
								   <c:set var = "pbf" value="${requestScope.pbf}"/>
								  
								  social following page 위한 for문
								   
								    <c:forEach var="pbf" items='${pbf.list}'>
								    <tr>
								    
								      <th scope="row">${pbf.no}</th>
								      <td class = "followerid">${pbf.userId}</td>
								      <td>${pbf.name}</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> ${pbf.best_count }</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i>${pbf.list_count }</td>
								      <td>
								      	<button type="button" class="btn btn-secondary btn-circle btn-xl"><i class="fa fa-plus"></i></button>
									  </td>
								    </tr>
								    
								    
								   </c:forEach>
								   
								   
								</table>
								
								<!-- 페이지 처리 -->
								<div class="row">
									<div class="col-lg-12 col-12-mobile" id = "followerpaging">
						  		
						<div style="float: left">
							<c:if test="${pbf.startPage > 1 }">
								<a href="/MovieHolic/mypage?page=social&followerpage=${pb.startPage - 1}"><button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button></a>
								
							</c:if>
						</div>
								
								
								
						<div style="float: right;">
							<c:if test="${pbf.totalPage > pbf.endPage }">
							<a href="/MovieHolic/mypage?page=social&followerpage=${pbf.endPage+1}"><button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button></a>
							</c:if>
						</div>
							  	<ul class="pagination justify-content-center">
								    <c:forEach begin="${pbf.startPage}" end="${pbf.endPage}" var="i">
									<c:choose>

										<c:when test="${pbf.currentPage == i}">
											<li class="page-item"><a class="page-link a a">${i}</a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item">
											<a class="page-link a a" href="/MovieHolic/mypage?page=social&followerpage=${i}">${i}</a></li>
										</c:otherwise>

									</c:choose>
								</c:forEach>
							 	 </ul>
								float clear용 빈 div
								<div style="clear: both;"></div>
						 		</div>
								</div>
								
  					   		</div> --%>
  					   		
					<!--   </div> -->
					<!-- 탭 메뉴 끝 -->
				
					</div>
				</div>
				<!-- **첫번째 행 끝 -->
				
			</div>

		</div>
		<!-- Main 끝-->
<%@ include file="/template/footer.jsp" %>