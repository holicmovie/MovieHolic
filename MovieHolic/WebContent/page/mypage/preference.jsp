<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<style>
/* 원형 차트 */
#chartdiv {
  width: 100%;
  height: 500px;
}
/* 차트 글씨  */
text{
fill:white;
font-family: 'Noto Sans KR', sans-serif;
font-weight: 500;
font-size: 17px;
}
/* 별점 차트 */
#chartdiv2{
  width: 100%;
  height: 500px;
}

/* xxx님의 취향분석 */
.preference_title{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
font-size: 50px;
}

/* xxx */
.preference_title_name{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
font-size: 45px;
color: rgb(240, 195, 15);
}

/* 굵은 폰트만 */
.preference_bold_font{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
}

/* 위의 공간 띄울 때 */
.top_margin {
	margin-top: 150px;
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
chart.legend = new am4charts.Legend();
}); // end am4core.ready()
</script>
 <%--장르 그래프 끝 --%>
 
<%-- 별점그래프 --%>
<script>
am4core.ready(function() {
// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end
var chart = am4core.create("chartdiv2", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
chart.data = [ {
  "country": "half",
  "value": 4
}, {
  "country": "one",
  "value": 12
}, {
  "country": "one-half",
  "value": 8
}, {
  "country": "two",
  "value": 11
}, {
  "country": "two-half",
  "value": 14
}, {
  "country": "three",
  "value": 28
}, {
  "country": "three-half",
  "value": 19
}, {
  "country": "four",
  "value": 18
}, {
  "country": "four-half",
  "value": 15
}, {
  "country": "five",
  "value": 10
} ];
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 40;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

var series = chart.series.push(new am4charts.CurvedColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "value";
series.tooltipText = "{valueY.value}"
series.columns.template.strokeOpacity = 0;

series.columns.template.fillOpacity = 0.75;

var hoverState = series.columns.template.states.create("hover");
hoverState.properties.fillOpacity = 1;
hoverState.properties.tension = 0.4;

chart.cursor = new am4charts.XYCursor();

// Add distinctive colors for each column using adapter
series.columns.template.adapter.add("fill", (fill, target) => {
  return chart.colors.getIndex(target.dataItem.index);
});

});

</script>
<%-- 별점그래프 끝 --%>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>


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
	<div class="preference_title" align="center"><h1>[ <span class="preference_title_name" id="username">박광규</span> ] 님의 취향분석</h1></div><br><br>
		
			<%--리뷰수 --%>
		<div class="row">
			<div class = "col-lg-12 preference_bold_font" id = "review" style="font-size : 30px; border-bottom: thin solid gray;"><span>리뷰 수</span></div>
		
			<div class = "col-lg-1"><i class = "far fa-edit" style='font-size:40px; margin-top:9px;'></i></div>	
			<div class = "col-lg-9 preference_bold_font" style="font-size:40px;"><span>250편</span></div>
			<div class = "col-lg-1"></div>
		</div>
			
			
			<%--선호장르 --%>
		<div class="row">
			<div class = "col-lg-12 top_margin preference_bold_font" style="font-size : 30px; border-bottom: thin solid gray;"><h3>선호 장르</h3></div>
			
			<div class = "col-lg-12">
				<span><i class='fas fa-crown preference_title_name' style='margin-bottom:10px;'> 스릴러</i></span><br><br>
				<span><i class='fas fa-medal preference_bold_font' style="font-size:28px;"> 로맨스&nbsp;&nbsp;&nbsp;</i></span>
				<span><i class='fas fa-medal preference_bold_font' style="font-size:28px;"> 공포&nbsp;&nbsp;&nbsp;</i></span>
				<span><i class='fas fa-medal preference_bold_font' style="font-size:28px;"> 가족&nbsp;&nbsp;&nbsp;</i></span>
				<span><i class='fas fa-medal preference_bold_font' style="font-size:28px;"> 애니메이션</i></span>
			</div>

			<div class = "col-lg-12" id="chartdiv"></div>
		</div>	
				
		<%--선호 배우  --%>
		<div class="row">
			<div class = "col-lg-12 top_margin preference_bold_font" style="font-size : 30px; border-bottom: thin solid gray;"><span>선호 배우</span></div>

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
		</div>
						
		<%--선호감독 --%>
		<div class="row">
			<div class = "col-lg-12 top_margin preference_bold_font"style="font-size : 30px; border-bottom: thin solid gray;"><span>선호 감독</span></div>
			
			
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
		</div>
			
			<%--평균 별점 --%>
		<div class="row">
			<div class = "col-lg-12 top_margin preference_bold_font" style="font-size : 30px; border-bottom: thin solid gray;"><span>평균 별점</span></div>
			
			<div class = "col-lg-12" id="chartdiv2"></div>
			
		</div>
		
		</div>
	
	</div>

<%@ include file="/template/footer.jsp"%>