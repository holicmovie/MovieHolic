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

/* 처음 로딩할 때 followingID출력 */



$(function(){
	$.ajax({
		url:'/MovieHolic/mypage?page=social',
		method:"GET",
		success:function(result){
			$("section").html(result.trim());
		}
	});
	return false;
});


/* followingID 페이지 */
$(document).on("click", ".1", function(){
		 var currentpage=$(this).attr("href");
		 $.ajax({
			url:'/MovieHolic/mypage',
			method:"GET",
			data:'page=social&followingpage=' + currentpage,
			success:function(result){
				$("section").html(result.trim());
			}
		});
		return false;
	});  
	
$(document).on("click", ".btnmove", function(){
	 var currentpage=$(this).attr("href");
	 $.ajax({
		url:'/MovieHolic/mypage',
		method:"GET",
		data:'page=social&followingpage=' + currentpage,
		success:function(result){
			$("section").html(result.trim());
		/* alert(currentpage+"페이지를 보여줍니다."); */
		}
	});
	return false;
});  

/* followerID page */
$(document).on("click", ".2", function(){
	 var currentpage=$(this).attr("href");
	 $.ajax({
		url:'/MovieHolic/mypage',
		method:"GET",
		data:'tab=followers&followerpage=' + currentpage,
		success:function(result){
			$("section").html(result.trim());
				/* alert(currentpage+"페이지를 보여줍니다."); */
		}
	});
	return false;
});  

$(document).on("click", ".btnmove2", function(){
		 var currentpage=$(this).attr("href");
		 $.ajax({
			url:'/MovieHolic/mypage',
			method:"GET",
			data:'tab=followers&followerpage=' + currentpage,
			success:function(result){
				$("section").html(result.trim());
			}
	});
	return false;
});

$(document).on("click", "#btnfollowers", function(){
	
		/* alert("follower"); */
		/* $("#followingsection").empty(); */
		  $.ajax({
			url:'/MovieHolic/mypage',
			method:"GET",
			data:'tab=followers',
			success:function(result){
				$("section").html(result.trim());
				/* alert("follwer ajax확인!"); */
			}
		});
		return false;
});

$(document).on("click", "#btnfollowings", function(){
	
	/* alert("following"); */
	/* $("#followingsection").empty(); */
	  $.ajax({
		url:'/MovieHolic/mypage',
		method:"GET",
		data:'page=social',
		success:function(result){
			$("section").html(result.trim());
			/* alert("follwing ajax확인!"); */
		}
	});
	return false;
});

$(document).on('click', '.deletef', function(){ 
	var str = "";
    var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
    var tr = checkBtn.parent().parent();
    var td = tr.children();

    
    /* var no = td.eq(0).text(); */
    var followingid = td.eq(1).text().trim();
    /* var name = td.eq(2).text();
    var lists = td.eq(3).text();
	var likes = td.eq(4).text(); */
	if (followingid != null){
		$.ajax({
			url:'/MovieHolic/mypage',
			method: 'GET',
			data:'page=social&deletefollowing=' + followingid,
			success: function(result){
				location.href ="/MovieHolic/page/mypage/social.jsp";
			 	/* location.href="/MovieHolic/mypage?page=social"  */
			 	}
			});
	return false;  
	}
}); 

$(document).on('click', '.plusfollower', function(){
		var str = "";
		    var tdArr = new Array();    // 배열 선언
		    var checkBtn = $(this);
		    var tr = checkBtn.parent().parent();
		    var td = tr.children();

		    /* var no = td.eq(0).text(); */
		    var followerid = td.eq(1).text().trim();		
		if(followerid !=null){

		$.ajax({
			url:"/MovieHolic/mypage",
			method: "GET",
			data:"page=check&follow=" + followerid,
			success: function(result){
				alert(result);
				
			}
	});
	return false; 
	}
}); 
</script>

<%
String id = (String)session.getAttribute("loginInfo");
%>
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
					  
					  <section id = "section"></section>
  					   		
					  </div>
					<!-- 탭 메뉴 끝 -->
					
					</div>
				</div>
				<!-- **첫번째 행 끝 -->
				
			</div>

		</div>
		<!-- Main 끝-->
<%@ include file="/template/footer.jsp" %>