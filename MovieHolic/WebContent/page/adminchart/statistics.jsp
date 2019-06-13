
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>    
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css"></script> 



<!-- 그래프 -->
<link id="themecss" rel="stylesheet" type="text/css" href="/MovieHolic/css/all.min.css">
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

<c:set var="acdte" value="${requestScope.acdte}" />
<c:set var="acdtw" value="${requestScope.acdtw}" />
<c:set var="acdth" value="${requestScope.acdth}" />
<c:set var="acdfo" value="${requestScope.acdfo}" />
<c:set var="acdfi" value="${requestScope.acdfi}" />


<script type="text/javascript"
	src="https:/www.gstatic.com/charts/loader.js"></script>

<style>

html, body, div, span, applet, object,
iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
pre, a, abbr, acronym, address, big, cite,
code, del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var, b,
u, i, center, dl, dt, dd, ol, ul, li, fieldset,
form, label, legend, table, caption, tbody,
tfoot, thead, tr, th, td, article, aside,
canvas, details, embed, figure, figcaption,
footer, header, hgroup, menu, nav, output, ruby,
section, summary, time, mark, audio, video, input{
	color: #000;
}




/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
	position: static;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
}
</style>



	
<%-- 남녀 가입 비율 현황 --%>
<script type="text/javascript">
	$(function() {
		$("#piechart").shieldChart({
			theme : "light",
			seriesSettings : {
				pie : {
					enablePointSelection : true,
					addToLegend : true,
					dataPointText : {
						enabled : true,
						borderRadius : 4,
						borderWidth : 2,
						borderColor : "red"
					}
				}
			},
			chartLegend : {
				align : "center",
				borderRadius : 2,
				borderWidth : 2,
				verticalAlign : "top"
			},
			tooltipSettings : {
				customPointText : "{point.collectionAlias}: {point.y}"
			},
			exportOptions : {
				image : false,
				print : false
			},
			primaryHeader : {
				text : "남여 성비율"
			},
			dataSeries : [ {
				seriesType : "pie",
				collectionAlias : "Usage",
				data : [ [ "남", 55.2 ], [ "여", 44.8 ] ]
			} ]
		});
	});
</script>






<%-- 리뷰 수 순위 --%>

<script type="text/javascript">
	$(document).ready(function reviewChart() {
		$("#onebargraph").shieldChart({
			theme : "light",
			primaryHeader : {
				text : "Budget overview"
			},
			exportOptions : {
				image : false,
				print : false
			},
			axisX : {
				categoricalValues :  
			  [ "2000", "2001", "2002", 
				"2003", "2004", "2005",
				"2006", "2007", "2008", 
				"2009", "2010", "2011", 
				"2012", "2013", "2014" ]
			},
			tooltipSettings : {
				chartBound : true,
				axisMarkers : {
				enabled : true,
				mode : 'xy'
				}
			},
			dataSeries : [{
				seriesType : 'area',
				collectionAlias : "Budget in Thousands",
				data : [ 100, 320, 453, 234,
				553, 665, 345, 123,
				432, 545, 654, 345,
				332, 456, 234 ]
				}]
		});
	});
</script>




<%-- ajax --%>
<script type="text/javascript">




// 막대 그래프 (년도)
$(document).on("click", ".barsearch>button", function(){
	var barnewlyyear = $(".barnewlyyear>select").val();
	var baroldyear = $(".baroldyear>select").val();
	
	if (baroldyear >= barnewlyyear) {
		alert("날짜를 확인해 주세요");
		return false;
	}
	
	$("div.uservariance").empty();
	
	// 리절트 페이지 만들어서 거기다가 차트 넣어주기.
	// 처음 들어왔을때 차트 어떻게 뿌려줄건지 생각해보기. 년도부터 고르라고 하던지
	// 년도별 보내서 디비딴에서 처리.
	//var currentPage = $(this).attr("href");
	//$("div.uservariance").empty();
	$.ajax({
		url : '/MovieHolic/chart?act=chart&barnewlyyear='+barnewlyyear+'&baroldyear='+baroldyear,
		method : 'get',
		success : function(result) {
			//$("div.uservariance").html(result.trim());
			//var checkArr = checkArr.push($("input.a").val());
			//checkArr = $("input.a").val();
			//alert(checkArr[0]);
			//console.log(checkArr[0]);
			
		}
	});
	return false; 
});


</script>



</head>



<body class="left-sidebar is-preload">







<%-- 값 빼오기 --%>
<c:forEach var="ac" items="${acdtw}">
	<input type="hidden" class="a" name="a" value="${ac.twenties}">
</c:forEach> 
<%-- 값 빼오기 --%>
<script type="text/javascript">
	
</script>




	<div id="page-wrapper">

		<!-- Header -->
		<div id="header" style="background-image: none;">
			<%@ include file="/template/nav.jsp"%>
		</div>

		<!-- Main -->
		<div class="wrapper style1">

		
		
		
		
		<div class="uservariance">
		<!-- 연령대별 막대그래프 -->
		
		
			<div class="container" style="margin-bottom: 10em">
				
				<div class="row" style="padding-right: 0em">
					<div class="col-lg-4">
						<h2 style="color: white;">연령대별 회원 변동</h2>
					</div>

					<div class="col-lg-2"></div>


					<!-- html에서 현재 날짜 앞부분 가져온뒤 - 2000 해서 for문 돌려줌. -->
					<div class="col-lg-2" style="margin-right: 0em; ">
						<span class="barnewlyyear">
							<select style="overflow:scroll;" class="form-control">
								<option>2019</option>
								<option>2018</option>
								<option>2017</option>
								<option>2016</option>
								<option>2015</option>
								<option>2014</option>
								<option>2013</option>
								<option>2012</option>
								<option>2011</option>
								<option>2010</option>
								<!-- <option>2009</option>
								<option>2008</option>
								<option>2007</option>
								<option>2006</option>
								<option>2005</option>
								<option>2004</option>
								<option>2003</option>
								<option>2002</option>
								<option>2001</option>
								<option>2000</option> -->
							</select>
						</span>
					</div>
					
					
					
					<h3 style="padding-left: 0em; color: white;">~</h3>

							

					<div class="col-lg-2" style="margin-right: 0em;">
						<span class="baroldyear">	
							<select class="form-control">
								<option>2019</option>
								<option>2018</option>
								<option>2017</option>
								<option>2016</option>
								<option>2015</option>
								<option>2014</option>
								<option>2013</option>
								<option>2012</option>
								<option>2011</option>
								<option>2010</option>
								<!-- <option>2009</option>
								<option>2008</option>
								<option>2007</option>
								<option>2006</option>
								<option>2005</option>
								<option>2004</option>
								<option>2003</option>
								<option>2002</option>
								<option>2001</option>
								<option>2000</option> -->
							</select>
						</span>
					</div>

					<div class="col-lg-1">
						<div class="barsearch">
							<button type="button" class="btn btn-success"
								style="z-index: 0; margin-right: 0em;">검색</button>
						</div>
					</div>


				</div>

				<hr class="line_light_w">
				

				<div class="card">
					<div align="center">
						
						<canvas id="myChart" width="300" height="500"></canvas>
						
						<script>
						var ctx = document.getElementById('myChart');
						
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ['2019', '2018', '2017', '2016', '2015', '2014'],
						        datasets: [{
						            label: '10대',
						            data: [12, 19, 3, 5, 2, 3],
						            
						            backgroundColor: [
						                'rgba(255, 99, 132, 0.2)',
						                'rgba(255, 99, 132, 0.2)'
						                /* 'rgba(54, 162, 235, 0.2)',
						                'rgba(255, 206, 86, 0.2)',
						                'rgba(75, 192, 192, 0.2)',
						                'rgba(153, 102, 255, 0.2)',
						                'rgba(255, 159, 64, 0.2)' */
						            ],
						            borderColor: [
						                'rgba(255, 99, 132, 1)',
						                'rgba(255, 99, 132, 1)',
						                'rgba(255, 99, 132, 1)',
						                'rgba(255, 99, 132, 1)',
						                'rgba(255, 99, 132, 1)'
						                /* 'rgba(54, 162, 235, 1)',
						                'rgba(255, 206, 86, 1)',
						                'rgba(75, 192, 192, 1)',
						                'rgba(153, 102, 255, 1)',
						                'rgba(255, 159, 64, 1)' */
						            ],
						            borderWidth: 2
						            
						        },
						        {
						            label: '20대',
						            data: [12, 19, 3, 5, 2, 3],
						        	
						        },
						        {
						            label: '30대',
						            data: [12, 19, 3, 5, 2, 3],
						        	
						        },
						        {
						            label: '40대',
						            data: [12, 19, 3, 5, 2, 3],
						        	
						        },
						        {
						            label: '50대',
						            data: [12, 19, 3, 5, 2, 3],
						        	
						        }]
						    },
						    
						    options: { 
						    	maintainAspectRatio: false,
						        scales: {
						            yAxes: [{
						                ticks: {
						                    beginAtZero: true
						                }
						            }]
						        }
						    }
						});
						</script>
						
						<!-- <div id="bargraph" style="width: 58vw; height: 28vw;"
							align="center"></div> -->
					</div>
				</div>
			</div>
			

		</div><!-- Ajax - uservariance  -->






			<!-- 리뷰 수 순위 -->
			<div class="container" style="margin-bottom: 10em">
				<div class="row">
					<div class="col-lg-4">
						<h2 style="color: white;">리뷰 수 순위</h2>
					</div>

					<div class="col-lg-2"></div>


					<div class="col-lg-2" style="margin-right: 0em;">
						<select class="form-control">
							<option>2019</option>
							<option>2018</option>
							<option>2017</option>
							<option>2016</option>
							<option>2015</option>
						</select>
					</div>

					<h3 style="padding-left: 0em">~</h3>

					<div class="col-lg-2">
						<div class="input-group mb-3" style="margin-right: 0em;">
							<select class="form-control">
								<option>2019</option>
								<option>2018</option>
								<option>2017</option>
								<option>2016</option>
								<option>2015</option>
							</select>
						</div>
					</div>

					<div class="col-lg-1">
						<div>
							<button type="submit" class="btn btn-success"
								style="z-index: 0; margin-right: 0em;">검색</button>
						</div>
					</div>


				</div>

				<hr class="line_light_w">


				<div class="card">
					<div align="center">
						<div id="onebargraph" style="width: 58vw; height: 28vw;"></div>
					</div>
				</div>


			</div>





			<!-- 남녀 성별 비율 그래프 -->
			<div class="container" style="margin-bottom: 10em">
				<div class="row">
					<div class="col-lg-4">
						<h2 style="color: white;">남녀 성별 비율</h2>
					</div>

					<div class="col-lg-8"></div>

				</div>

				<hr class="line_light_w">


				<div class="card">
					<div align="center">
						<div id="piechart" style="width: 58vw; height: 28vw;"></div>
					</div>
				</div>


			</div>






		</div>
	</div>
</body>
<%@ include file="/template/footer.jsp"%>