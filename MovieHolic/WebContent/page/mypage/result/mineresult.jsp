<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<div id="mine" class="container tab-pane active"><br>
		
			<%-- 최근 '좋아요'한 영화 --%>
			<div class="row" style="margin-top: 1em;">
				<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
					<div style="float: left;">최근 '보고싶어요'한 영화</div>
				</div>
				<section class="carousel">
					<div class="reel">
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/brother.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg" alt="" /></a>
						</article>
						<article>
							<a href="#" class="image featured"><img	src="/MovieHolic/images/money.jpg" alt="" /></a>
						</article>
					</div>
				</section>
			</div>
			
			<%-- 나의 최근 리뷰 --%>
			<div class="row" style="margin-top: 10em;">
				<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
					<div style="float: left;">나의 최근 리뷰</div>
				</div>
				<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
					<col style="width:10%;">
					<col style="width:20%;">
					<tr>
						<td style="vertical-align: middle;">
							<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" /></a>
						</td>
				        <td style="vertical-align: middle">
				        	<h4 class="title font_bold_mid"><a href="#">엔드게임</a></h4>
				        </td>
				        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
				        어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
				        </td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">
							<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" /></a>
						</td>
				        <td style="vertical-align: middle;">
				        	<h4 class="title font_bold_mid"><a href="#">코코</a></h4>
				        </td>
				        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
				        	어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
				        </td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">
							<a href="#"><img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" /></a>
						</td>
				        <td style="vertical-align: middle;">
				        	<h4 class="title font_bold_mid"><a href="#">겨울왕국</a></h4>
				        </td>
				        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
				        	어벤져스 인피니티 워에서 타노스에게 패배하고 난 후 마블 영웅들의 좌절감과 헤어 나올 수 없는 죄책감의 시달리고 모든 것을 포기한 그들의 모습을 표현한 부분은 인상적이었고 그와 더불어 소소하지만 재미를 주면서 관객들에게 웃음을 주어 재미를 주기도 했습니다.
				        </td>
					</tr>
				</table>
				
	<%--pagination처리 --%>
	<div class = "col-lg-12">
	<div style="float: left">
		<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
	</div>
	
 		<div style="float: right">
		<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
	</div>
	
  	<ul class="pagination justify-content-center">
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">1</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">2</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">3</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">4</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">5</a></li>
 	 </ul>
	<%-- float clear용 빈 div --%>
	<div style="clear: both;"></div>
	</div>
			</div>
			
			<%-- 나의 최근 리스트 --%>
			<div class="row" style="margin-top: 10em;">
				<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
					<div style="float: left;">나의 최근 리스트</div>
				</div>
				<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
					<col style="width:40%;">
					<tr>
						<td>
							<div>
								<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
								<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
								<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
								<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
								<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
							</div>
						</td>
				        <td style="vertical-align: middle; padding-left: 2em;">
				        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
				        </td>
					</tr>
					<tr>
						<td>
							<div>
								<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
								<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
								<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
								<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
								<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
							</div>
						</td>
				        <td style="vertical-align: middle; padding-left: 2em;">
				        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
				        </td>
					</tr>
					<tr>
						<td>
							<div>
								<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
								<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
								<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
								<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
								<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
							</div>
						</td>
				        <td style="vertical-align: middle; padding-left: 2em;">
				        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
				        </td>
					</tr>
					<tr>
						<td>
							<div>
								<img width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)"  style="position: absolute; z-index: 0;"/>
								<img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: 70px; z-index: 0;"/>
								<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg" title="엔드게임 (2019)" style="position: relative; left: 40px; z-index: 0;"/>
								<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg" title="엔드게임 (2019)" style="position: relative; left: 5px; z-index: 0;"/>
								<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" title="엔드게임 (2019)" style="position: relative; left: -30px; z-index: 0;"/>
							</div>
						</td>
				        <td style="vertical-align: middle; padding-left: 2em;">
				        	<h4 class="font_bold_small">우울할 때 보는 영화 10선</h4>
				        </td>
					</tr>
				</table>
	<%--pagination 처리 --%>
		<div class = "col-lg-12">
	<div style="float: left">
		<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
	</div>
	
 		<div style="float: right">
		<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
	</div>
	
  	<ul class="pagination justify-content-center">
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">1</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">2</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">3</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">4</a></li>
	    <li class="page-item"><a class="page-link a" href="javascript:void(0);">5</a></li>
 	 </ul>
	<%-- float clear용 빈 div --%>
	<div style="clear: both;"></div>
	</div>
			</div>
		</div>