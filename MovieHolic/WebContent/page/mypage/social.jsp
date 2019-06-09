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
  
/* $(function(){
	
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
		}); */
	
 /* 	
	$("followingpaging").click(function(){
	
		var currentpage=$(this).attr("href");
		alert(currentPage+"페이지를 보여줍니다.");
		 $.ajax({
			url:,
			method:"GET",
			success:function(result){
				$("section").html(result.trim());
			}
		});
		return false;
	});  
});	*/

$(function(){
	 
	$.ajax({
		url:'/MovieHolic/mypage?page=social',
		method:"GET",
		success:function(result){
			$("#followingsection").html(result.trim());
		}
	});
	return false;
});

$(function(){
	$(".a").click(function(){
		alert("눌렸다!");
		 var currentpage=$(this).attr("href");
		alert(currentpage+"페이지를 보여줍니다.");
		 $.ajax({
			url:'/MovieHolic/mypage?page=social',
			method:"GET",
			data:'followingpage=' + currentpage,
			success:function(result){
				$("section").html(result.trim());
			}
		});
		return false;
	});  
});   

 
/* $(function(){
	$("#btnfollowers").click(function() {
		$("#followersection").empty();
		 $.ajax({
			url:'/MovieHolic/mypage?page=social',
			method:"GET",
			success:function(result){
				alert("follower"),
				$("#followersection").html(result.trim());
			}
		});
		return false;
	});
}); */

/* $(function(){
	$("#btnfollowers").click(function() {
		$("#followingsection").empty();
		 $.ajax({
			url:'/MovieHolic/mypage?page=social',
			method:"GET",
			success:function(result){
				alert("follower"),
				$("#followersection").html(result.trim());
			}
		});
		return false;
	});
}); */

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
					<div class="col-lg-12 col-12-mobile">
					
					<button class="btn btn-success font_bold_small" id= "btnfollowings">Followings</button>
					<button class="btn btn-success font_bold_small" id = "btnfollowers">Followers</button>
					  <div class="tab-content">
					  <section id = "followingsection"></section>
					  <section id = "followersection"></section>
  					   		
					  </div>
					<!-- 탭 메뉴 끝 -->
					
					</div>
				</div>
				<!-- **첫번째 행 끝 -->
				
			</div>

		</div>
		<!-- Main 끝-->
<%@ include file="/template/footer.jsp" %>