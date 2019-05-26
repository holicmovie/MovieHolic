<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>


<!-- 별점의 별 icon을 사용하기 위해 필요 -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<style>
.starrating > input {display: none;}  /* Remove radio buttons */
.starrating > label:before { 
  content: "\f005"; /* Star */
  margin: 2px;
  font-size: 2em;
  font-family: FontAwesome;
  display: inline-block; 
}
.starrating > label
{
  color: #222222; /* Start color when not clicked */
}
.starrating > input:checked ~ label
{ color: #ffca08 ; } /* Set yellow color when star checked */
.starrating > input:hover ~ label
{ color: #ffca08 ;  } /* Set yellow color when star hover */
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
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main 시작 -->
		
		<div class="wrapper style1">

			<div class="container">
			
				<!-- **첫번째 행 시작 -->
				<div class="row" style="margin-bottom: 5%">
				
					<div class="col-12 col-12-mobile">
						<!-- 글 제목 -->
						<span
							style="font-size: 30px; font-weight: bold; margin-right: 0.5em;">라라랜드</span><span>2016</span>
						<span style="display: block;">by <a href="#"><font
								color="skyblue">Jiyoung</font></a></span>
						<div
							style="width: 100%; border-bottom: 0px; border-top: thin solid gray; margin-top: 1%;"></div>
						<span>2019.05.06</span>
						<div
							style="width: 100%; border-bottom: 0px; border-top: thin solid gray;"></div>
					</div>
					
				</div>
				<!-- **첫번째 행 끝 -->

				<!-- **두번째 행 시작 -->
				<div class="row">				
				<!-- 글 내용-->
					<!-- 포스터 -->
					<div class="col-3 col-12-mobile">
						<a href="#" class="image featured"><img
							src="/MovieHolic/images/lalaland.jpg" alt="lalaland poster"
							data-toggle="tooltip" title="라라랜드 (2016)" /></a>
					</div>
					
					<!-- 글 -->
					<div class="col-6 col-12-mobile">
						<form style="height: 300px;">
							<textarea class="form-control" rows="1" style="height: 100%;" readonly>영화가 굉장히 재미있다.</textarea>
						</form>
					</div>
					
					<!-- 별점 등등 -->
					<div class="col-3 col-12-mobile" style="padding:30px;">
					
					<div align="center" style="height:15%; border-radius: 10px; background-color:#efefef; margin-bottom:10%;">
						<div class="starrating risingstar d-flex justify-content-center flex-row-reverse" style=" height: 60px; line-height: 60px;">
		          			<input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star">5</label>
		          			<input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star">4</label>
		          			<input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star">3</label>
		          			<input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star">2</label>
		          			<input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star">1</label>
						</div>
					</div>
					<div style="height:15%; border-radius: 10px; background-color:#efefef; margin-bottom:10%;" align="center" class="div-circle">
	          			<span style="font-weight:bold; font-size:40px; height: 60px; line-height: 60px;"><i class="fa fa-eye"></i> public</span>
					</div>
					
					<div style="height:15%; border-radius: 10px; background-color:#efefef; margin-bottom:10%;" align="center">
          				<span style="font-weight:bold; font-size:40px; height: 60px; line-height: 60px;"><i class="fa fa-check"></i> spoiler</span>
					</div>
					
					<div style="height:15%; border-radius: 10px; background-color:#efefef;" align="center">
					<div style="height: 60px; line-height: 60px;">
						<span>
							<button type="button" class="btn btn-danger btn-circle btn-lg"><i class="fa fa-heart"></i></button><span style="margin-left:10px; font-size:30px; font-weight:bold;">200</span>
						</span>
						<span style="border:thin solid lightgray; margin-left:10px;"></span>
						<span>
							<button type="button" class="btn btn-danger btn-circle btn-lg" style="background:navy; border-color:navy; margin-left:15px;"><i class="fa fa-thumbs-down"></i></button><span style="margin-left:10px; font-size:30px; font-weight:bold;">21</span>
						</span>
					</div>
					</div>
					 </div>
					 
				</div>
				<!-- **두번째 행 끝 -->
				
				<!-- **세번째 행 시작 -->
				<div class="row">
				
					<div class="col-12 col-12-mobile" align="center">
						<!-- 이전, 수정 버튼 시작 -->
						<button type="submit" class="btn btn-primary"
							style="margin-right: 5%">이전</button>
						<button type="submit" class="btn btn-primary">수정</button>
					</div>
					
				</div>
				<!-- **세번째 행 끝 -->
				
			</div>

		</div>
		<!-- Main 끝 -->

<%@ include file="/template/footer.jsp" %>