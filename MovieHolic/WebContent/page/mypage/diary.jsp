<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
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
		<div class="wrapper style1">

			<div class="container">
			
				<div class="row" style="margin-bottom: 5%">
					<div class="col-12 col-12-mobile">
						<h3><a href="#">달력&nbsp;&nbsp;</a> | <a href="#">&nbsp;&nbsp;목록</a></h3>
					</div>
				</div>

				
				<!-- 리뷰 목록 -->
				<div class="row" style="margin-top: 3em;">
					<table class="table table-hover">
					    <thead>
					      <tr>
					        <th style="width: 10%">영화</th>
					        <th style="width: 10%">날짜</th>
					        <th >리뷰</th>
					      </tr>
					    </thead>
					    <tbody>
					      
					      <tr>
					        <td>
								<a href="#"><img width="70vh" src="/MovieHolic/images/tempimg/coco.jpg" alt="endgame poster" data-toggle="tooltip" data-placement="top" title="코코 (2017)" /></a>
							</td>
					        <td>
					        	<div>2019</div>
					        	<div><font size="10em">3/4</font></div>
					        </td>
					        <td>
					        	<span>
					        	개인적으로 음악을 소재로 하는 영화를 정말 좋아하는데 아름다운 OST도 인상적이고, 마음을 울리는 기타소리와 부드러운 음색의 노래는 영화를 보고 나서도 한동안 자리에서 일어나지 못하게 만들었던것 같네요. 연초에 가족들과 함께 보기에는 더없이 좋은 작품이지 않나라고 생각이 들어요. 
					        	</span>
					        </td>
					      </tr>
					      <tr>
					        <td>
								<a href="#"><img width="70vh" src="/MovieHolic/images/tempimg/endgame.jpg" alt="endgame poster" data-toggle="tooltip" data-placement="top" title="엔드게임 (2019)" /></a>
							</td>
					        <td>
					        	<div>2019</div>
					        	<div><font size="10em">5/6</font></div>
					        </td>
					        <td>
					        	<span>
					        	어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
					        	</span>
					        </td>
					      </tr>
					    </tbody>
					  </table>
				</div>
				

			</div>

		</div>
<%@ include file="/template/footer.jsp" %>