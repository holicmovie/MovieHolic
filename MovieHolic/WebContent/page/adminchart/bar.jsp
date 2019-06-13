<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="acdte" value="${requestScope.acdte}" />
<c:set var="acdtw" value="${requestScope.acdtw}" />
<c:set var="acdth" value="${requestScope.acdth}" />
<c:set var="acdfo" value="${requestScope.acdfo}" />
<c:set var="acdfi" value="${requestScope.acdfi}" />



<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
var chkbox = $("input.a");
//checkArr = $("input.a").val();
alert(checkArr[0]);
console.log(checkArr[0]);
</script>


<%-- 값 빼오기 --%>
<c:forEach var="ac" items="${acdtw}">
	<input type="text" class="a" name="a" value="${ac.twenties}">
</c:forEach> 
<%-- 값 빼오기 --%>
<script type="text/javascript">
	
</script>




	<div class="container" style="margin-bottom: 10em">

		<div class="row" style="padding-right: 0em">
			<div class="col-lg-4">
				<h2 style="color: white;">연령대별 회원 변동</h2>
			</div>

			<div class="col-lg-2"></div>


			<!-- html에서 현재 날짜 앞부분 가져온뒤 - 2000 해서 for문 돌려줌. -->
			<div class="col-lg-2" style="margin-right: 0em;">
				<span class="barnewlyyear"> <select style="overflow: scroll;"
					class="form-control">
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
				<span class="baroldyear"> <select class="form-control">
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
						type : 'bar',
						data : {
							labels : [ '2019', '2018', '2017', '2016', '2015',
									'2014' ],
							datasets : [
									{
										label : '10대',
										data : [ 12, 19, 3, 5, 2, 3 ],

										backgroundColor : [
												'rgba(255, 99, 132, 0.2)',
												'rgba(255, 99, 132, 0.2)'
										/* 'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)' */
										],
										borderColor : [
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
										borderWidth : 2

									}, {
										label : '20대',
										data : [ 12, 19, 3, 5, 2, 3 ],

									}, {
										label : '30대',
										data : [ 12, 19, 3, 5, 2, 3 ],

									}, {
										label : '40대',
										data : [ 12, 19, 3, 5, 2, 3 ],

									}, {
										label : '50대',
										data : [ 12, 19, 3, 5, 2, 3 ],

									} ]
						},

						options : {
							maintainAspectRatio : false,
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});
				</script>

				<!-- <div id="bargraph" style="width: 58vw; height: 28vw;"
							align="center"></div> -->
			</div>
		</div>
	</div>



</body>
</html>