<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>


 <link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#chart-rating").shieldChart({
            theme: "light",
            primaryHeader: {
                text: "영화 평균 평점"
            },
            exportOptions: {
                image: false,
                print: false
            },
            axisX: {
                categoricalValues: ["0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5"]
            },
            tooltipSettings: {
                chartBound: true,
                axisMarkers: {
                    enabled: true,
                    mode: 'x'
                }                    
            },
            dataSeries: [{
                seriesType: 'bar',
                collectionAlias: "나의 평점 분포",
                data: [10, 32, 45, 23, 55, 66, 34, 12, 43, 54, 65]
            }]
        });
    });
</script>

    <script type="text/javascript">
        $(function () {
            $("#chart-genre").shieldChart({
                theme: "light",
                seriesSettings: {
                    pie: {
                        enablePointSelection: true,
                        addToLegend: true,
                        dataPointText: {
                            enabled: true,
                            borderRadius: 4,
                            borderWidth: 2,
                            borderColor: "red"
                        }
                    }
                },
                chartLegend: {
                    align: "center",
                    borderRadius: 2,
                    borderWidth: 2,
                    verticalAlign: "top"
                },               
                tooltipSettings: {
                    customPointText: "{point.collectionAlias}: {point.y}"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                primaryHeader: {
                    text: "박광규님의 선호 장르"
                },
                dataSeries: [{
                    seriesType: "pie",
                    collectionAlias: "Usage",
                    data: [
                        ["스릴러", 9.0],
                        ["범죄", 26.8],
                        ["로맨스", 55.8],
                        ["느와르", 3.8],
                        ["가족", 1.9]
                    ]
                }]
            });
        });
    </script>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main -->
	
<div class="wrapper style1" id = "main-container">
	<div class="container">
	<%--Header 제목 --%>
	<div align="center"><h2><font style="color: orange;">박광규</font>님의 취향분석</h2></div><br><br>
		
		<div class="row">
			<%--리뷰수 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id = "review" style="border-bottom: thin solid gray;"><h3>리뷰수</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-1"><label><i class = "far fa-edit" style='font-size:24px'></i></label></div>	
			<div class = "col-lg-9">250편</div>
			<div class = "col-lg-1"></div>
			
			
			<%--선호장르 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" style="border-bottom: thin solid gray;"><h3>선호 장르</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id = "chart-genre"></div>
			<div class = "col-lg-1"></div>
			
			
				
		<%--선호 배우  --%>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" style="border-bottom: thin solid gray;"><h3>선호 배우</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
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
				
						
		<%--선호감독 --%>
		
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10"style="border-bottom: thin solid gray;"><h3>선호감독</h3></div>
			<div class = "col-lg-1"></div>
			
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
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
			<div class = "col-lg-10"style="border-bottom: thin solid gray;"><h3>평균 별점</h3></div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id="chart-rating">
			
			<div align = "center">
			<div id="columnchart_values" style="width: 50%; height: 20%;"></div>
			</div>
			</div>
		</div>
	
	</div>
</div>

<%@ include file="/template/footer.jsp" %>