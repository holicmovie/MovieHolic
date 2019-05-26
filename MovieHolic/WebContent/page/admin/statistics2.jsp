<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<script type="text/javascript"
	src="https:/www.gstatic.com/charts/loader.js"></script>


<link id="themecss" rel="stylesheet" type="text/css"
	href="/MovieHolic/css/all.min.css">
<script src="/MovieHolic/js/jquery-1.11.1.min.js"></script>
<script src="/MovieHolic/js/shieldui-all.min.js"></script>




<!-- 그래프 -->

<script type="text/javascript">
	$(window).resize(function() {

		drawVisualization();
		drawChart1();
		reviewChart();

	});
</script>



<%-- 연령대별 회원 변동 --%>

<script type="text/javascript">
	$(function() {
		$("#barchart").shieldChart(
				{
					theme : "light",
					primaryHeader : {
						text : "Internet usage statistics"
					},
					exportOptions : {
						image : false,
						print : false
					},
					axisX : {
						categoricalValues : [ "2019", "2018", "2017", "2016",
								"2015", "2014" ]
					},
					axisY : {
						title : {
							text : "Visitor statistics"
						}
					},
					dataSeries : [
							{
								seriesType : "bar",
								collectionAlias : "10대",
								data : [ 565000, 630400, 743000, 910200,
										1170200, 1383000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "20대",
								data : [ 152000, 234000, 123000, 348000,
										167000, 283000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "30대",
								data : [ 152000, 234000, 123000, 348000,
										167000, 283000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "40대",
								data : [ 152000, 234000, 123000, 348000,
										167000, 283000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "50대 이상",
								data : [ 152000, 234000, 123000, 348000,
										167000, 283000 ]
							} ]
				});
	});
</script>



<%-- 남녀 가입 비율 현황 --%>

<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart1() {

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






<%-- 리뷰 수 순위 --%>

<script type="text/javascript">
	$(document)
			.ready(
					function reviewChart() {
						$("#chart")
								.shieldChart(
										{
											theme : "light",
											primaryHeader : {
												text : "Budget overview"
											},
											exportOptions : {
												image : false,
												print : false
											},
											axisX : {
												categoricalValues : [ "2000",
														"2001", "2002", "2003",
														"2004", "2005", "2006",
														"2007", "2008", "2009",
														"2010", "2011", "2012",
														"2013", "2014" ]
											},
											tooltipSettings : {
												chartBound : true,
												axisMarkers : {
													enabled : true,
													mode : 'xy'
												}
											},
											dataSeries : [ {
												seriesType : 'area',
												collectionAlias : "Budget in Thousands",
												data : [ 100, 320, 453, 234,
														553, 665, 345, 123,
														432, 545, 654, 345,
														332, 456, 234 ]
											} ]
										});
					});
</script>

<%@ include file="/template/nav.jsp"%>



<!-- Main -->
<div class="wrapper style1">



	<div class="container mt-3">
		<h2>Toggleable Tabs</h2>
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item">
			<a class="nav-link active" data-toggle="tab" href="#Bar_graph">Bar graph</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#One_Bar_graph">One Bar graph</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#Pie_graph">Pie graph</a>
			</li>
		</ul>






		<!-- Tab panes -->

		<div class="tab-content">

			<!-- 그래프  -->

			<!-- 연령대별 막대그래프 -->
			<br><br>
			<div id="Bar_graph" class="container tab-pane active">
				<h2>연령대별 회원 변동</h2>
				<p>The .graph is Bar graph:</p>
				<br>
				<div id="barchart"></div>
			</div>




			<!-- 리뷰수 막대그래프 -->
			<div id="One_Bar_graph" class="container tab-pane">
				<h2>리뷰 수 순위</h2>
				<p>The .graph is Bar graph:</p>
				<br>
				<div id="chart"></div>
			</div>



			<!-- 성비 원그래프 -->
			<div id="Pie_graph" class="container tab-pane">
				<div class="container">
					<h2>남녀 가입 비율 현황</h2>
					<p>The .graph is Pie graph:</p>
					<br>
					<div id="piechart"></div>
				</div>


			</div>
		</div>

<script>
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
});
</script>







	</div>


	<%@ include file="/template/footer.jsp"%>