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
%>

<%
List<BoardDto> reviewList = (List)request.getAttribute("mineReview");
//System.out.println("resultpage : "+ reviewList); 
int len2 = reviewList.size();
%>
<%
List<BoardDto> mineList = (List)request.getAttribute("mineList");
//System.out.println("result page : " + mineList );
int len3 = mineList.size();//dto가 들어갈 전체 list 
//System.out.println("size : " + len3);
BoardDto board = mineList.get(0);//list에 들어간 dto 하나의 크기
//System.out.println(board);
List<String> naverList = board.getUrl();

int len4;
if(board.getMovieCodeNaver().size()<=4){
	len4 =board.getMovieCodeNaver().size();
} else {
	len4 = 4;
};//Url
//System.out.println(naverList);
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
								if(list.size() !=0){
									for(WishlistDto dto : list){
							
							%>
									<article>
										<a href="/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCodeYoung() %>&movieCdNaver=<%=dto.getMovieCodeNaver() %>" 
										class="image featured"><img src="<%=dto.getMovieURL()%>" alt="<%=dto.getMovieNm() %> poster" /></a>
									</article>
									
									<%
									}
								} else {
									%>
									<img src="/MovieHolic/images/error.png" height="200em">
										<H1>NO WISHLIST !!!!</H1>
								<% 
								
								
								
								}%>	
									
		
									
								</div>
							</section>
						</div>
						
						
						
						
						
						
						
						<%-- 나의 최근 리뷰 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">나의 최근 리뷰</div>
							</div>

						<div class = "col-lg-12" style="overflow-y: auto; height: 600px;clear:both;">
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
								<col style="width:10%;">
								<col style="width:20%;">
								
								
								
								<%
								for(int i = 0 ; i < reviewList.size(); i++){ 
								%>
								
								<tr>
									<td style="vertical-align: middle;">
										<a href="/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=reviewList.get(i).getMovieCodeYoung2()%>&movieCdNaver=<%=reviewList.get(i).getMovieCodeNaver2()%>">
										<img width="100vh" src="<%=reviewList.get(i).getUrl2() %>" title="<%=reviewList.get(i).getMovieName()%>" href="/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=reviewList.get(i).getMovieCodeYoung2()%>&movieCdNaver=<%=reviewList.get(i).getMovieCodeNaver2()%>"/></a>
									</td>
							        <td style="vertical-align: middle">
							        	<h4 class="title font_bold_mid"><a href="#"><%=reviewList.get(i).getMovieName2() %></a></h4>
							        </td>
							        <td style="vertical-align: middle; color: #fff;" class="font_light_small">
							       <%=reviewList.get(i).getContent() %>
							        </td>
								</tr>
								<tr>
								
								<%
								}
								%>								
	
							</table>
							</div>
				
						</div>
						</div>
						
						
						
						
						
						
						
						
						<%-- 나의 최근 리스트 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">나의 최근 리스트</div>
							</div>

						<div class = "col-lg-12" style="overflow-y: auto; height: 600px;clear:both;">
							<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">
								<col style="width:40%;">
												
						  <% 
							for(int i = 0; i<len3; i++){						
						%>  
									
							<tr>
									<td>
										<div>
								
											<%
											for(int j = 0; j<len4; j++){ 
											%> 
											<a href = "/MovieHolic/list?act=listDetail&seq=<%=mineList.get(i).getSeq()%>">
											<img width="100vh" src="<%=naverList.get(j)%>" style="position: relative; z-index: 0;left:<%=20 - (j*30)%>px"/>
											<!-- <img width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg" style="position: relative; left: 70px; z-index: 0;"/>
											<img class="hide3" width="100vh" src="/MovieHolic/images/tempimg/coco.jpg"  style="position: relative; left: 40px; z-index: 0;"/>
											<img class="hide2"  width="100vh" src="/MovieHolic/images/tempimg/endgame.jpg"  style="position: relative; left: 5px; z-index: 0;"/>
											<img class="hide1"  width="100vh" src="/MovieHolic/images/tempimg/frozen.jpg"  style="position: relative; left: -30px; z-index: 0;"/> -->
											</a>
											<% 
											}
											%>  
										
								
										</div>
									</td>
							        <td style="vertical-align: middle; padding-left: 2em;">
							        <a href = "/MovieHolic/list?act=listDetail&seq=<%=mineList.get(i).getSeq()%>">
							        	<h4 class="font_bold_small"> <%=mineList.get(i).getSubject() %></h4>
							       	</a>
							        </td>
						
								</tr>
							
						 		<%
							}
								%>  
							
							</table>
							</div>
						</div>
						
						
						
						
					</div>