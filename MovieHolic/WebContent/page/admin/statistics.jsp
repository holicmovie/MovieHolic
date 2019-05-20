<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<script type="text/javascript"	src="https:/www.gstatic.com/charts/loader.js"></script>
<!-- 그래프 -->

<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		// 데이터
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '10대', '20대', '30대', '40대', '50대 이상', '평균' ],
				[ '1월', 165, 938, 522, 998, 450, 614.6 ],
				[ '2월', 135, 1120, 599, 1268, 288, 682 ],
				[ '3월', 157, 1167, 587, 807, 397, 623 ],
				[ '4월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '5월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '6월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '7월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '8월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '9월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '10월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '11월', 139, 1110, 615, 968, 215, 609.4 ],
				[ '12월', 136, 691, 629, 1026, 366, 569.6 ] ]);

		// 옵션
		var options = {
			title : '연령대별 회원 변동 추이', //X축, Y축 레이블 설정과 타이들등을 정의
			vAxis : {
				title : '인원'
			},
			hAxis : {
				title : '날짜'
			},
			seriesType : 'bars',
			series : {
				5 : {
					type : 'line'
				}
			}
		// 막대 개당 갯수
		};

		// 차트 그리기
		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);

		//색상 지정하기
		var options = {
			legend : {
				position : 'bottom'
			},
			series : {
				0 : {
					color : '#a561bd'
				},
				1 : {
					color : '#c784de'
				},
				2 : {
					color : '#f1ca3a'
				},
				3 : {
					color : '#2980b9'
				},
				4 : {
					color : '#e67e22'
				}
			}
		};
	}
</script>

<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ '남', 110 ], [ '여', 200 ], ]);

		var options = {
			title : '현재 남여 가입 비율'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
	}
</script>


<script type="text/javascript">
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ "Element", "Density", {
					role : "style"
				} ], [ "Copper", 8.94, "gold" ],
				[ "Silver", 10.49, "gold" ], [ "Gold", 19.30, "gold" ],
				[ "Platinum", 21.45, "color: gold" ] ]);

		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "Density of Precious Metals, in g/cm^3",
			width : 600,
			height : 400,
			bar : {
				groupWidth : "95%"
			},
			legend : {
				position : "none"
			},
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById("columnchart_values"));
		chart.draw(view, options);
	}
</script>

<%@ include file="/template/nav.jsp" %>





		<!-- Main -->
		<div class="wrapper style1">
		
			<!-- 관리테이블 메뉴 -->
		
			<section id="banner">
				<header>
					<nav id="nav2">
						<ul>
							<li><a href="/MovieHolic/admin/management.html">Management Table</a></li>
							<li><a href="#">Statistical Chart</a></li>
						</ul>		
					</nav>
				</header>
			</section><br><br>
			
			
			<!-- 그래프  -->
			
			<!-- 연령대별 막대그래프 -->
			<div class="container">
			<h2>연령대별 회원 변동</h2>
			<p>The .graph is Bar graph:</p><br>
				<div class="container">
					<div class="card">		
						<div align="center">
							<div id="chart_div" style="width: 70vw; height: 30vw;"></div>
						</div>
					</div>
				</div>
			</div><br><br><br><br><br>
			
			<!-- 리뷰수 막대그래프 -->
			<div class="container">
			<h2>리뷰 수 순위</h2>
			<p>The .graph is Bar graph:</p><br>
				<div class="container">
					<div class="card">		
						<div align="center">
							<div id="columnchart_values" style="width: 45vw; height: 30vw;"></div>
						</div>
					</div>
				</div>
			</div><br><br><br><br><br>
			
			
			
			
			<!-- 성비 원그래프 -->
			<div class="container">
			<h2>남녀 가입 비율 현황</h2>
			<p>The .graph is Pie graph:</p><br>
				<div class="col-lg-10">
					<div class="container">
						<div class="card">
							<div align="center">
								<div id="piechart" style="width: 45vw; height: 30vw;"></div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
<%@ include file="/template/footer.jsp" %>