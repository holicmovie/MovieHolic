<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<style>
#chartdiv {
  width: 100%;
  height: 500px;
  color: white;
}
/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
}
<<<<<<< HEAD
/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
}
=======

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
}

>>>>>>> branch 'master' of https://github.com/holicmovie/MovieHolic.git
/* 구분선 얇은 것 (회색) */
hr.line_light_g {
	background-color: gray;
	position: static;
}
</style>

<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<%--아이콘 사용 링크 --%>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<%--pie chart 링크 --%>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>


    
    
 <%--장르 그래프  --%>
    <script>
am4core.ready(function() {
// Themes begin
am4core.useTheme(am4themes_material);
am4core.useTheme(am4themes_animated);
// Themes end
// Create chart
var chart = am4core.create("chartdiv", am4charts.PieChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
chart.data = [
  {
	  genre: "스릴러",
    value: 26
  },
  {
	  genre: "로맨스",
    value: 23
  },
  {
	  genre: "공포",
    value: 20
  },
  {
	  genre: "가족",
    value: 16
  },
  {
	  genre: "애니메이션",
    value: 13
  }
];
var series = chart.series.push(new am4charts.PieSeries());
series.dataFields.value = "value";
series.dataFields.radiusValue = "value";
series.dataFields.category = "genre";
series.slices.template.cornerRadius = 5;
series.colors.step = 5;
series.hiddenState.properties.endAngle = -90;
//chart.legend = new am4charts.Legend();
}); // end am4core.ready()
</script>
 <%--장르 그래프 끝 --%>
 
<%-- 별점그래프 --%>
<script>
window.onload = function () {

//Better to construct options first and then pass it as a parameter
var options = {
	title: {
		text: "영화 평균 별점"              
	},
	data: [              
	{
		// Change type to "doughnut", "line", "splineArea", etc.
		type: "column",
		dataPoints: [
			{ label: "0",  y: 10  },
			{ label: "0.5", y: 15  },
			{ label: "1", y: 25  },
			{ label: "1.5",  y: 30  },
			{ label: "2",  y: 28  },
			{ label: "2.5",  y: 35  },
			{ label: "3", y: 46  },
			{ label: "3.5", y: 30  },
			{ label: "4",  y: 30  },
			{ label: "4.5",  y: 28  },
			{ label: "5",  y: 5  }
		]
	}
	]
};

$("#chartContainer").CanvasJSChart(options);
}
</script>
<%-- 별점그래프 끝 --%>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

>>>>>>> branch 'master' of https://github.com/holicmovie/MovieHolic.git




<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<body class="left-sidebar is-preload">

<!-- Header -->
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main -->
	
<div class="wrapper style1" id = "main-container">
	<div class="container">
	<%--Header 제목 --%>
	<div align="center"><h1>[<font class = "bold_lg" style="color: rgb(240, 195, 15)">박광규</font>]님의 취향분석</h1></div><br><br>
		
		<div class="row">
			<%--리뷰수 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id = "review" style="border-bottom: thin solid gray;"><h3>리뷰수</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-1"><i class = "far fa-edit" style='font-size:40px'></i></div>	
			<div class = "col-lg-9"><h2>250편</h2></div>
			<div class = "col-lg-1"></div>
			
			
			<%--선호장르 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" style="border-bottom: thin solid gray;"><h3>선호 장르</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
				<span ><i class='fas fa-medal' style='font-size:40px; color: rgb(240, 195, 15);'>스릴러</i></span><br>
				<span><i class='fas fa-medal' style='font-size:30px;color: white;'>로맨스</i></span><span><i class='fas fa-medal' style='font-size:30px;color: white;'>공포</i></span>
				<span><i class='fas fa-medal' style='font-size:30px;color: white;'>가족</i></span><span><i class='fas fa-medal' style='font-size:30px;color: white;'>애니메이션</i></span>
			</div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id="chartdiv" style="color: white;"></div>
			<div class = "col-lg-1" style="clear: both;"></div>
			
				
		<%--선호 배우  --%>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" style="border-bottom: thin solid gray;"><h3>선호 배우</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
			<div class="list-group">
			<button type="button" class="btn btn-light">previous</button>
		  	<a href="#" class="list-group-item list-group-item-action list-group-item-dark" style="background-color: rgb(40,40,40)">
			  <img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			 <font class = "font_light_small"> 송강호</font></a>
			  <a href="#" class="list-group-item list-group-item-action list-group-item-dark" style="background-color: rgb(40,40,40)">
			 <img src="/MovieHolic/images/anne.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			<font class = "font_light_small">  앤 해서웨이</font></a>
			  <a href="#" class="list-group-item list-group-item-action list-group-item-dark" style="background-color: rgb(40,40,40)">
			 <img src="/MovieHolic/images/lee.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/>  
			 <font class = "font_light_small"> 이병헌</font></a>
			  <button type="button" class="btn btn-light">next</button>
			  </div>
				</div>	
				<div class = "col-lg-1"></div>
				
						
		<%--선호감독 --%>
		
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10"style="border-bottom: thin solid gray;"><h3>선호감독</h3></div>
			<div class = "col-lg-1"></div>
			
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
			<div class="list-group">
			<button type="button" class="btn btn-light">previous</button>
			 
			  <a href="#" class="list-group-item list-group-item-action " style="background-color: rgb(40,40,40)">
			  <img src="/MovieHolic/images/nhj.jpg" alt="감독사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"> 
			  <font class = "font_light_small">나홍진 :곡성	5편</font></a>
			  <a href="#" class="list-group-item list-group-item-action list-group-item-dark" style="background-color: rgb(40,40,40)">
			 <img src="/MovieHolic/images/christ.jpg" alt="감독사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			 <font class = "font_light_small"> 크리스토퍼 놀란</font></a>
			  <a href="#" class="list-group-item list-group-item-action list-group-item-dark" style="background-color: rgb(40,40,40)">
			 <img src="/MovieHolic/images/john.jpg" alt="감독 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			  <font class = "font_light_small">존 카니</font></a>
			  
			<button type="button" class="btn btn-light">next</button> 
			</div>
			</div>
			<div class = "col-lg-1"></div>
			
			
			<%--평균 별점 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" ><h3>평균 별점</h3></div>
			<div class = "col-lg-1"></div>
			
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id="chartContainer" style="height: 370px; width: 100%;"></div>
			<div class = "col-lg-1"></div>
			
			
			</div>
		</div>
	
	</div>

<%@ include file="/template/footer.jsp"%>