<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/boot_431.jsp" %>
<script type="text/javascript"   src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   google.charts.load("current", {
      packages : [ 'corechart' ]
   });
   google.charts.setOnLoadCallback(drawChart);
   function drawChart() {
      var data = google.visualization.arrayToDataTable([
            [ "Element", "Density", {
               role : "style"
            } ], [ "1", 8.94, "gold" ],
            [ "2", 10.49, "gold" ], 
            [ "3", 21.45, "gold" ],
            [ "4", 17, "color: gold" ],
            [ "5", 10, "color: gold" ] 
            ]);
      var view = new google.visualization.DataView(data);
      view.setColumns([ 0, 1, {
         calc : "stringify",
         sourceColumn : 1,
         type : "string",
         role : "annotation"
      }, 2 ]);
      var options = {
         //title : "Density of Precious Metals, in g/cm^3",
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
	
	<div class="wrapper style1" id = "main-container">
			<div class="container">
				<div class="row">
					<div class = "col-lg-1"></div>
					<div class = "col-lg-10" id = "genre"><label>선호장르</label>
					<ul class="list-group list-group-horizontal">
					  <li class="list-group-item">스릴러</li>
					  <li class="list-group-item">공포</li>
					  <li class="list-group-item">다큐멘터리</li>
					  <li class="list-group-item">로맨스</li>
					  <li class="list-group-item">범죄</li>
					</ul>
					</div>
					<div class = "col-lg-1"></div>
					<div class = "col-lg-1"></div>
					<div class = "col-lg-10">
					선호 배우
					<div class="list-group">
					<button type="button" class="btn btn-light">previous</button>
				  <a href="#" class="list-group-item list-group-item-action">
				  <img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
				  송강호</a>
				  <a href="#" class="list-group-item list-group-item-action">
				 <img src="/MovieHolic/images/anne.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
				  앤 해서웨이</a>
				  <a href="#" class="list-group-item list-group-item-action">
				 <img src="/MovieHolic/images/lee.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/>  
				  이병헌</a>
				  <button type="button" class="btn btn-light">next</button>
				  </div>
					</div>	
					<div class = "col-lg-1"></div>
					<div class = "col-lg-1"></div>
					<div class = "col-lg-10">
					선호 감독
					<div class="list-group">
					<button type="button" class="btn btn-light">previous</button>
				  <a href="#" class="list-group-item list-group-item-action">
				  <img src="/MovieHolic/images/nhj.jpg" alt="감독사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"> 
				  나홍진</a>
				  <a href="#" class="list-group-item list-group-item-action">
				 <img src="/MovieHolic/images/christ.jpg" alt="감독사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
				  크리스토퍼 놀란</a>
				  <a href="#" class="list-group-item list-group-item-action">
				 <img src="/MovieHolic/images/john.jpg" alt="감독 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
				  존 카니</a>
				<button type="button" class="btn btn-light">next</button> 
				</div>
						
					</div>
					
					<div class = "col-lg-1"></div>
					<div class = "col-lg-1"></div>
					<div class = "col-lg-10">
					나의 평균 별점
					<div align = "center">
					<div id="columnchart_values" style="width: 50%; height: 20%;"></div>
					</div>
					</div>
				</div>
			
			</div>
		</div>

<%@ include file="/template/footer.jsp" %>