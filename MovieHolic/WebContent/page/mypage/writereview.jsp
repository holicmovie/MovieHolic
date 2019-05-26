<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%-- 별점의 별 icon을 사용하기 위해 필요 --%>
<style type="text/css">
	.starrating > input {display: none;}  <%--  Remove radio buttons --%>
	.starrating > label:before { 
	  content: "\f005"; <%-- Star  --%>
	  margin: 3px;
	  font-size: 2em;
	  font-family: FontAwesome;
	  display: inline-block; 
	}
	.starrating > label
	{
	  color: #222222; <%-- Start color when not clicked --%>
	}
	.starrating > input:checked ~ label
	{ color: #ffca08 ; } <%-- Set yellow color when star checked  --%>
	.starrating > input:hover ~ label
	{ color: #ffca08 ;  } <%-- Set yellow color when star hover  --%>
	<%-- 체크박스  --%>
	.checks {
		position: relative;
	}
	.checks input[type="checkbox"] {
		<%--  실제 체크박스는 화면에서 숨김 --%>
		position: absolute;
		width: 1px; height: 1px; padding: 0; margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0
	}
	.checks input[type="checkbox"] + label {
		display: inline-block;
		position: relative;
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
	}
	.checks input[type="checkbox"] + label:before {
		<%-- 가짜 체크박스  --%>
		content: ' ';
		display: inline-block;
		width: 21px; <%-- 체크박스의 너비를 지정 --%>
		height: 21px; <%-- 체크박스의 높이를 지정 --%>
		line-height: 21px; <%-- 세로정렬을 위해 높이값과 일치 --%>
		margin: -2px 8px 0 0;
		text-align: center;
		vertical-align: middle;
		background: #fafafa;
		border: 1px solid #cacece;
		border-radius : 3px;
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
	} .checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before {
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
	} .checks input[type="checkbox"]:checked + label:before {
		<%-- 체크박스를 체크했을때 --%>
		content: '\2714';
		<%-- 체크표시 유니코드 사용 --%>
		color: #99a1a7;
		text-shadow: 1px 1px #fff;
		background: #e9ecee;
		border-color: #adb8c0;
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
	}
</style>
<script>
$(document).ready(function() {
	 
	$('#srchMovie').focusin(function() {
		$('#movieModal').modal();
	});
	
});
</script>
</head>
<%@ include file="/template/nav.jsp"%>



<!-- Main -->
		<div class="wrapper style1">
			<div class="container">
			
			<%--  페이지 제목 --%>
				<div class="row" style="margin-bottom: 5%">
					<div class="col-12 col-12-mobile">
						<h3><a >리뷰작성</a></h3>
					</div>
				</div>

			<%-- 작성일 설정--%>		
				<div class="row" style="margin-bottom: 5%">
					<div class="col-xl-9 col-lg-9 col-md-6 col-sm-6 col-2-mobile"></div>
					<div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3-mobile">
						<input type="text" class="form-control" placeholder="년">
					</div>
					<div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3-mobile">
						<select class="form-control">
							<option>1월</option>
							<option>2월</option>
							<option>3월</option>
							<option>4월</option>
							<option>5월</option>
							<option>6월</option>
							<option>7월</option>
							<option>8월</option>
							<option>9월</option>
							<option>10월</option>
							<option>11월</option>
							<option>12월</option>
						</select>
					</div>
					<div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3-mobile">
						<input type="text" class="form-control" placeholder="일">
					</div>
				</div>
				
				
			<%-- 영화 선택--%>
				<div id="srchMovie" class="row" style="margin-bottom: 5%" align="center">
					<div class="col-xl-2 col-lg-2 col-md-4 col-sm-12" style="float: left">
						<div >
							<a href="" ><img src="/MovieHolic/images/getposter.png" width="200vh" /></a>
						</div>
						
			<%-- 별점--%>
						<div class="starrating risingstar d-flex justify-content-center flex-row-reverse" >
		          			<input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star"></label>
		          			<input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star"></label>
		          			<input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star"></label>
		          			<input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star"></label>
		          			<input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star"></label>
						</div>
					</div>
					
			<%--  내용입력--%>	
					<div class="col-xl-10 col-lg-8 col-md-8 col-sm-12" align="right" style="float: left">
						<textarea class="form-control" rows="20" ></textarea>
					</div>
				</div>


				<div class="row" style="margin-bottom: 5%">
					<div class="col-xl-2 col-lg-2 col-md-4 col-sm-12"></div>

					<div class="col-xl-7 col-lg-4 col-md-4 col-sm-12">
						<div class="checks"> <input type="checkbox" id="ex_chk"> <label for="ex_chk">이 리뷰를 공개합니다</label> </div>
					</div>
			<%--  버튼--%>
					<div class="col-xl-3 col-lg-5 col-md-4 col-sm-12" align="right">
						<button type="button" class="btn btn-primary active" style="width:10vh; margin-right: 1em">저장</button>
						<button type="button" class="btn btn-primary" style="width:10vh">취소</button>
					</div>
				</div>



			</div>
		</div>
		
<%-- The Modal --%>
<div id="movieModal" class="modal fade" id="myModal" style="top: 100px; height: 700px;">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
    
			<!-- Modal Header -->
			<div class="modal-header  text-center">
				<h4 class="col-3 col-3-mobile" align="left">영화 검색</h4>
				<button type="button" class="close" data-dismiss="modal" style="width: 5vh;">&times;</button>
			</div>
      
			<!-- Modal body -->
			<div class="modal-body" align="center">
				<input type="text" class="form-control" placeholder="검색할 영화제목 입력" width="200px">
				<table class="table table-hover">
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
						<tr>
							<td><img src="/MovieHolic/images/tempimg/coco.jpg" height="80vh"></td>
							<td>코코</td>
							<td>2017</td>
						</tr>
					</table>
			</div>
      
			<!-- Modal footer -->
			<div class="modal-footer">
				<div class="input-group" align="left" style="padding-left: 5px;">
					
				</div>
			</div>
      
		</div>
	</div>
</div>
<%@ include file="/template/footer.jsp" %>