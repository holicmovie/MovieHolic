
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

<%-- <c:set var="acdte" value="${requestScope.acdte}" />
<c:set var="acdtw" value="${requestScope.acdtw}" />
<c:set var="acdth" value="${requestScope.acdth}" />
<c:set var="acdfo" value="${requestScope.acdfo}" />
<c:set var="acdfi" value="${requestScope.acdfi}" /> --%>


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
	
	location.href='/MovieHolic/chart?act=chart&barnewlyyear='+barnewlyyear+'&baroldyear='+baroldyear;
	
});


</script>



</head>



<body class="left-sidebar is-preload">




<c:set var="acdte" value="${requestScope.acdte}" />
<c:set var="acdtw" value="${requestScope.acdtw}" />
<c:set var="acdth" value="${requestScope.acdth}" />
<c:set var="acdfo" value="${requestScope.acdfo}" />
<c:set var="acdfi" value="${requestScope.acdfi}" />





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
								
								<c:forEach begin="0" end="7" varStatus="status">
									<option>${sysdate - status.count + 1}</option>
								</c:forEach>
								
							</select>
						</span>
					</div>
					
					
					
					<h3 style="padding-left: 0em; color: white;">~</h3>

							

					<div class="col-lg-2" style="margin-right: 0em;">
						<span class="baroldyear">	
							<select class="form-control">
								
							<c:forEach begin="0" end="7" varStatus="status">
								<option>${sysdate - status.count + 1}</option>
							</c:forEach>

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
						
						// 10~50대 데이터 넣기
						var acdte = [];
						var acdtebcolor = [];
						var acdtecolor = [];
						<c:forEach var="ac" items="${acdte}">
							acdte.push("${ac.teens }");
							acdtebcolor.push('rgba(255, 99, 132, 0.2)');
							acdtecolor.push('rgba(255, 99, 132, 1)');
						</c:forEach>
						
						var acdtw = [];
						var acdtwbcolor = [];
						var acdtwcolor = [];
						<c:forEach var="ac" items="${acdtw}">
							acdtw.push("${ac.twenties }");
							acdtwbcolor.push('rgba(54, 162, 235, 0.2)');
							acdtwcolor.push('rgba(54, 162, 235, 1)');
						</c:forEach>
						
						var acdth = [];
						var acdthbcolor = [];
						var acdthcolor = [];
						<c:forEach var="ac" items="${acdth}">
							acdth.push("${ac.thirties }");
							acdthbcolor.push('rgba(255, 206, 86, 0.2)');
							acdthcolor.push('rgba(255, 206, 86, 1)');
						</c:forEach>
						
						var acdfo = [];
						var acdfobcolor = [];
						var acdfocolor = [];
						<c:forEach var="ac" items="${acdfo}">
							acdfo.push("${ac.fourties }");
							acdfobcolor.push('rgba(75, 192, 192, 0.2)');
							acdfocolor.push('rgba(75, 192, 192, 1)');
						</c:forEach>
						
						var acdfi = [];
						var acdfibcolor = [];
						var acdficolor = [];
						<c:forEach var="ac" items="${acdfi}">
							acdfi.push("${ac.fifties }");
							acdfibcolor.push('rgba(153, 102, 255, 0.2)');
							acdficolor.push('rgba(153, 102, 255, 1)');
						</c:forEach>
						
						// 날짜 가져오기 acdte를 이용해 몇번 돌려주는지 적용
						var date = [];
						if (${barnewlyyear != null}) {
							
							<c:forEach var="ac" varStatus="status" items="${acdte}">
							date.push("${barnewlyyear - status.count + 1}"); 
							</c:forEach>
							
						}else{
							
							<c:forEach var="ac" varStatus="status" items="${acdte}">
							date.push("${sysdate - status.count + 1}");
							</c:forEach>
						
						}
						
						
						
						var ctx = document.getElementById('myChart');
						
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        
						    	labels: date,
						        
						    	datasets: [{
						            label: '10대',
						            data: acdte,
						            
						            backgroundColor: acdtebcolor,
						            borderColor: acdtecolor,
						            borderWidth: 2
						            
						        },
						        {
						        	label: '20대',
						            data: acdtw,
						            backgroundColor: acdtwbcolor ,
						            borderColor: acdtwcolor ,
						            borderWidth: 2
						        	
						        },
						        {
						            label: '30대',
						            data: acdth,
						            backgroundColor: acdthbcolor ,
						            borderColor: acdthcolor ,
						            borderWidth: 2
						        	
						        },
						        {
						            label: '40대',
						            data: acdfo,
						            backgroundColor: acdfobcolor ,
						            borderColor: acdfocolor ,
						            borderWidth: 2
						        	
						        },
						        {
						            label: '50대',
						            data: acdfi,
						            backgroundColor: acdfibcolor ,
						            borderColor: acdficolor ,
						            borderWidth: 2
						        	
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
						
					</div>
				</div>
			</div>
			

		</div><!-- uservariance -->





		
		
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