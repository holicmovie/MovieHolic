<%@page import="com.kitri.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kitri.dto.WishlistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 첫번째 탭 페이지 --%>
<%--1. mine page wishlist --%>
<%
List<WishlistDto> list = (List)request.getAttribute("minewishlist");
//System.out.println("resultpage: "+ list);
int len = list.size();

List<BoardDto> reviewList = (List)request.getAttribute("mineReview");
System.out.println("resultpage : "+ reviewList);
int len2 = reviewList.size();
%>
	
					
					
					
					<div id="mine"><br>
						<%-- 최근 '좋아요'한 영화 --%>
						 <div class="row" style="margin-top: 1em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">나의 WishList</div>
							</div>
							<section class="carousel">
								<div class="reel">
							<%
								for(WishlistDto dto : list){
							
							%>
									<article>
										<a href="/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCodeYoung() %>&movieCdNaver=<%=dto.getMovieCodeNaver() %>" 
										class="image featured"><img src="<%=dto.getMovieURL()%>" alt="<%=dto.getMovieNm() %> poster" /></a>
									</article>
									
									<%
								}
									%>
									
								</div>
							</section>
						</div>
						
						<%-- 나의 최근 리뷰 --%>
						<div class="row" style="margin-top: 10em; overflow-y: auto;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">나의 최근 리뷰</div>
							</div>
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
								<col style="width:10%;">
								<col style="width:20%;">
								
								
								
								<%
								for(BoardDto board : reviewList){ 
								%>
								
								<tr>
									<td style="vertical-align: middle;">
										<a href="/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=board.getMovieCodeYoung()%>&movieCdNaver=<%=board.getMovieCodeNaver()%>">
										<img width="100vh" src="<%=board.getUrl() %>" title="<%=board.getMovieName()%> (2019)" /></a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4 class="title font_bold_mid"><a href="#"><%=board.getMovieName() %></a></h4>
							        </td>
							        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
							       <%=board.getContent() %>
							        </td>
								</tr>
								<tr>
								
								<%
								}
								%>								
	
							</table>
							
				
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
				
						</div>
					</div>