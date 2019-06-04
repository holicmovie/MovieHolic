
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>


<!-- 그래프 -->
<link id="themecss" rel="stylesheet" type="text/css" href="/MovieHolic/css/all.min.css">
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>




<script type="text/javascript"
	src="https:/www.gstatic.com/charts/loader.js"></script>

<style>

/* tspan{

fill : #FFFFFF;
color : #FFFFFF;
background-color: #FFFFFF;

} */

/* text>tspan{
	display: none;
} */

div {
	color: black;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
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

<script type="text/javascript">
	$(window).resize(function() {

	});
</script>


<script type="text/javascript">
	$(function() {
		$("#bargraph").shieldChart(
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
								data : [ 265000, 130400, 243000, 310200,
										270200, 183000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "20대",
								data : [ 152000, 234000, 123000, 348000,
										267000, 383000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "30대",
								data : [ 152000, 334000, 113000, 348000,
										167000, 283000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "40대",
								data : [ 152000, 234000, 223000, 348000,
										267000, 183000 ]
							},
							{
								seriesType : "bar",
								collectionAlias : "50대 이상",
								data : [ 352000, 234000, 113000, 148000,
										367000, 283000 ]
							} ]
				});
	});
</script>



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
	$(document)
			.ready(
					function reviewChart() {
						$("#onebargraph")
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


</head>




<body class="left-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header" style="background-image: none;">
			<%@ include file="/template/nav.jsp"%>
		</div>

		<!-- Main -->
		<div class="wrapper style1">


			<!-- 연령대별 막대그래프 -->
			<div class="container" style="margin-bottom: 10em">
				<div class="row" style="padding-right: 0em">
					<div class="col-lg-4">
						<h2>연령대별 회원 변동</h2>
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
						<div id="bargraph" style="width: 58vw; height: 28vw;"
							align="center"></div>
					</div>
				</div>

			</div>





			<!-- 리뷰 수 순위 -->
			<div class="container" style="margin-bottom: 10em">
				<div class="row">
					<div class="col-lg-4">
						<h2>리뷰 수 순위</h2>
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




			<!-- 연령대별 막대그래프 -->
			<div class="container" style="margin-bottom: 10em">
				<div class="row">
					<div class="col-lg-4">
						<h2>리뷰 수 순위</h2>
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