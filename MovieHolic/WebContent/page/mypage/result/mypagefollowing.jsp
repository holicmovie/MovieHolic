<%@page import="com.kitri.dto.LogDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="following" class="container"><br>
	<%
	List<LogDto> list = (List)request.getAttribute("followingLog");
	System.out.println(list);
	int len = list.size();
	%>
						<%-- 활동 목록 --%>
						<div class="row" style="margin-top: 10em;">
							<div class="font_bold_mid" style="width:100%; border-bottom: 2.5px solid #fff; margin-bottom: 0; padding-bottom: 0.8em;">
								<div style="float: left;">Activity Log</div>
							</div>
							<div class = "col-lg-12" style = "overflow-y: auto; height: 600px;">
							<table class="table table-hover col-lg-12 col-mobile-12" style="border-top: 0px thin;">
								<col style="width:10%;">
								<col style="width:80%;">
							
							<%
							for(int i = 0; i < len; i++){
								int category = list.get(i).getLogCate();
								if(category == 1){
								%>
								<!-- category1: 리스트 작성 -->
								<tr>
									<td>
										<img alt="<%=list.get(i).getLogId() %>" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small"><%=list.get(i).getLogId() %></a>님이 '<a class="font_bold_small">'<%=list.get(i).getSujbect() %></a>'리스트를 작성했습니다</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        </td>
								</tr>
								
								<% 	
								} else if (category ==2){
								%>
								
								<!-- category2: 리뷰작성 -->
								<tr>
									<td>
										<img alt="<%=list.get(i).getLogId() %>" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small"><%=list.get(i).getLogId() %></a>님이 '<a href = "/MovieHolic/film?act=viewfilmdetail&movieCdYoung=<%=list.get(i).getMovieCodeYoung() %>&movieCdNaver=<%=list.get(i).getMovieCodeNaver() %>"class="font_bold_small"><%=list.get(i).getSujbect()%></a>'작품에 리뷰를 남겼습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								
								<% 
								} else if (category ==3){
								%>

								<!--category3: 댓글 작성 -->
								<tr>
									<td>
										<img alt="<%=list.get(i).getLogId() %>" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small"><%=list.get(i).getLogId()%></a>님이 '<a class="font_bold_small" href = "/MovieHolic/list?act=listDetail&seq=<%=list.get(i).getSeq()%>"><%=list.get(i).getSujbect()%></a>'리스트에 댓글을 달았습니다</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>

								<% 	
								} else {
								%>

							<!-- category4: 리스트 좋아요 -->
								<tr>
									<td>
										<img alt="<%=list.get(i).getLogId() %>" src="/MovieHolic/images/user.png" width="70vh">
									</td>
							        <td style="vertical-align: middle;">
							        	<h5 class="font_light_small"><a class="font_bold_small"><%=list.get(i).getLogId() %>'</a>님이 <a class="font_bold_small" href = "/MovieHolic/list?act=listDetail&seq=<%=list.get(i).getSeq()%>"> <%=list.get(i).getSujbect()%></a>'에 좋아요&#x1f496; 했습니다.</h5>
							        </td>
							        <td style="vertical-align: middle;">
							        	<h5 class="time font_light_small" style="color: gray;">2시간 전</h5>
							        </td>
								</tr>
								
								<% 	
								}
							}
								%>
							
							</table>
							</div>
						</div>
					</div>