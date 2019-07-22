<%@page import="java.util.List, com.kitri.dto.FilmDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ include file="/template/nav.jsp"%>
<style>
/* 인기 영화 랭킹 스타일 */
div.interated_network_movie_info_img{
width:100%;
float: none;
display: table-cell;
vertical-align: top;
position: relative;
}
span.movie_ranking_number {
position: absolute;
vertical-align: top;
    top: 0;
    left: 0;
    width: 38px;
    padding: 6px 0 6px 0;
    font-size: 20px;
    background-color : #ff4e00;
    font-weight: 700;
    color: #fff;
    text-align: center;
    z-index: 1000;
}

/* 위의 공간 띄울 때 */
.top_margin {
	margin-top: 20px;
}

.top_margin_lg {
	margin-top: 70px;
}
</style>

<script>

<%-- 페이지 로딩 후 바로 --%>
$(function(){

	
	<%-- 주간 인기 영화 목록 출력 --%>
	$.ajax({
		url: '/MovieHolic/film?act=viewbestfilmlist', 
		method:'get', 
		success:function(result){
			$("#weeklybest").html(result.trim());
			document.reload();
		}
	});
	
	<%-- 전체 영화 목록 출력 --%>
	$.ajax({
		url: '/MovieHolic/film?act=viewfilmlist', 
		method:'get', 
		success:function(result){
			$("#filmlist").html(result.trim());
		}
	});
	
	return false;
	
});

<%-- 페이지 선택한 경우 --%>
$(function(){
	$(document).on("click", ".test", function(){		
		var conurl = $(this).attr("con-url");
		if(conurl == "filmlist") {
			var currentPage=$(this).attr("data-page");
			var category = $(this).attr("cate");

			$.ajax({
				url:'/MovieHolic/film?act=viewfilmlist&category=' + category + '&currentPage1=' + currentPage,
				method:'get',
				success:function(result){
					$("#filmlist").html(result.trim());
				}
			});
			
		}else if(conurl == "searchedlist"){
			var currentPage=$(this).attr("data-page");
			var srchKey = $(this).attr("srchKey");
			
			$.ajax({
				url:'/MovieHolic/film?act=searchfilm&srchKey=' + srchKey + '&currentPage2=' + currentPage,
				method:'get',
				success:function(result){
					$("#filmlist").html(result.trim());
				}
			});
		}
		
		return false;
	});
});


<%-- 장르 선택한 경우 --%>
$(function(){
	var aArr = $('#category>ul>li>a');
	$(aArr).click(function() {
		var vurl = $(this).attr("href");
		$.ajax({
			url: vurl, 
			method:'get', 
			success:function(result){
				$("#filmlist").html(result);
			}
		});
		
		return false;
	});
});

<%-- 영화 검색어 입력후 엔터키 누른 경우 --%>
$(function(){
	var searchFilm = $('#searchFilm');
	$(searchFilm).keypress(function(event){
	    if (event.which == 13 ) {
			if(searchFilm.val() != "") {	<%-- 검색어가 공백이 아닌 경우 srchKey로 받아옴 --%>
				var srchKey = searchFilm.val();
				searchFilm.val(''); // 검색란 비우기
				$.ajax({
					url: "/MovieHolic/film?act=searchfilm&srchKey=" + srchKey,  
					method:'get', 
					success:function(result){
						$("#filmlist").html(result);
					}
				});
			}
	    return false;
	    }
	});
});
</script>

</head>
<body class="left-sidebar is-preload" style="background-color: black;">
	<div id="page-wrapper">
		<!-- ALL Movie -->

		<!-- Banner -->
		<div class="top_margin_lg" id="header" style="background-image: none; padding: 4em 0 0 0;">
			<section id="banner"
				style="padding: 0; margin: 0 auto; background-color: black;">
				<header>
					<h2 class="font_bold_lg" style="font-size:40px;">
						주간 인기 영화
					</h2>
				</header>

			</section>
		</div>
		
	<section class="carousel top_margin_lg" style="background-color: rgb(3, 39, 49); padding: 1.5em 0 0 0;">
					<div id="weeklybest" class="reel">
	
			<!-- ####################### 동적 공간 (bestfilmlistresult.jsp) ###################### -->
					</div>
	</section>
		
		<hr style="top:1em; border-top: 3px solid white;">
		
		<div>
		
			<div class="col-lg-9 col-2-mobile" style=" margin-top: 0px; float: right; margin-right: 2em; border-left: 1px solid; border-color: white;">

		<!---------------------------------------------- 검색 ----------------------------------------------------->
		

				<div class="row">
					<div class="col-lg-8"></div>
					<div class="col-lg-4 col-2-mobile"
						style="margin-top: 12px; margin-bottom:1em; padding-left:40px;">
						<input type="text" id="searchFilm" class="form-control"
							style="height: 40px; width: 13em; background-image: /MovieHolic/images/searchb.png"
							placeholder="제목으로 검색">
					</div>
				</div>
		<!---------------------------------------------- 검색 ----------------------------------------------------->
				
		
		<!--------------------------------------------- 영화 목록 ----------------------------------------------------->
		
				<div id="filmlist" class="row" style="margin-top: 0px; margin-left: 0px; margin-right: 0px;">
				
				<!-- ####################### 동적 공간 (filmlistresult.jsp) ###################### -->
				<!-- ####################### 동적 공간 (searchfilmresult.jsp) ###################### -->
	
				</div>
			
		<!--------------------------------------------- 영화 목록 ----------------------------------------------------->
				
				
		<!-------------------------------------------- 페이징 처리----------------------------------------------------->
	
				<!-- ####################### 동적 공간 (filmlistresult.jsp) ###################### -->
				<!-- ####################### 동적 공간 (searchfilmresult.jsp) ###################### -->

		<!-------------------------------------------- 페이징 처리----------------------------------------------------->
			</div>


	<!--------------------------------------------- 장르 분류----------------------------------------------------->

			<div id="category" class="col-lg-2 col-1-mobile" style="width: 20%; float: right; text-align: left; margin: 1em 20px 0 10px; margin-top:50px;">
				<ul class="font_light_small" style="list-style-type: none;">
					<li><h3 class="font_bold_lg">
							장르 분류
						</h3>
					</li>
					
					<li style="margin-top:20px;"><a id ="default" href="<%=root%>/film?act=viewfilmlist" style="color: white;">전체</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=액션" style="color: white;">액션</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=어드벤처" style="color: white;">어드벤처</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=멜로" style="color: white;">멜로</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=로맨스" style="color: white;">로맨스</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=코미디" style="color: white;">코미디</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=드라마" style="color: white;">드라마</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=가족" style="color: white;">가족</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=범죄" style="color: white;">범죄</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=미스터리" style="color: white;">미스터리</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=스릴러" style="color: white;">스릴러</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=공포" style="color: white;">공포(호러)</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=판타지" style="color: white;">판타지</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=SF" style="color: white;">SF</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=뮤지컬" style="color: white;">뮤지컬</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=사극" style="color: white;">사극</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=전쟁" style="color: white;">전쟁</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=애니메이션" style="color: white;">애니메이션</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=다큐멘터리" style="color: white;">다큐멘터리</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=공연" style="color: white;">공연</a></li>
					<li><a href="<%=root%>/film?act=viewfilmlist&category=기타" style="color: white;">기타</a></li>
				</ul>
			</div>
			
		<!--------------------------------------------- 장르 분류----------------------------------------------------->
	
	
	
		</div>
			
	</div> <!-- page-wrapper end -->



	<%@ include file="/template/footer.jsp"%>