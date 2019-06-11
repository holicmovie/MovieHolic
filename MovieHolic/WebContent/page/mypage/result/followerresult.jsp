<%@page import="com.kitri.dto.mypage.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
<div id="followers" class="container tab-pane" role = "tabpanel">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
							<br>
								<table class="table table-hover table-dark">
								  <thead>
								    <tr>
								      <th scope="col">no.</th>
								      <th scope="col">ID</th>
								      <th scope="col">Name</th>
								      <th scope="col">Lists</th>
								      <th scope="col">Likes</th>
								      <th scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								<%--   <%PageBean pbf = (PageBean)request.getAttribute("pbf");
								  	System.out.println(pbf);
								  %>	 --%>
								 
								  
								  <%--social following page 위한 for문 --%>
								   
								    <c:forEach var="pbf" items='${pbf.list}'>
								    <tr>
								    
								      <th scope="row">${pbf.no}</th>
								      <td> <input type ="hidden" class="addfollow" value = "${pbf.userId}">${pbf.userId}</td>
								      <td>${pbf.name}</td>
								      <td><i class="fa fa-list" style="color:gold;"></i> ${pbf.best_count }</td>
								      <td><i class="fa fa-heart" style="color:tomato;"></i>${pbf.list_count }</td>
								      <td>
								      	<button type="button" class="btn btn-secondary btn-circle btn-xl plusfollower"><i class="fa fa-plus"></i></button>
									  </td>
								    </tr>
								    
								    
								   </c:forEach>
								   
								   
								</table>
								
								<!-- 페이지 처리 -->
								<div class="row">
									<div class="col-lg-12 col-12-mobile" id = "followerpaging">
						  		
						<div style="float: left">
							<c:if test="${pbf.startPage > 1 }">
								<a class= "btnmove2" href="${pbf.url}${pb.startPage - 1}"><button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button></a>
								
							</c:if>
						</div>
								
								
								
						<div style="float: right;">
							<c:if test="${pbf.totalPage > pbf.endPage }">
							<a class= "btnmove2" href="${pbf.url}${pbf.endPage+1}"><button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button></a>
							</c:if>
						</div>
							  	<ul class="pagination justify-content-center">
								    <c:forEach begin="${pbf.startPage}" end="${pbf.endPage}" var="i">
									<c:choose>

										<c:when test="${pbf.currentPage == i}">
											<li class="page-item"><a class="page-link a 2">${i}</a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item">
											<a class="page-link a 2" href="${i}">${i}</a></li>
										</c:otherwise>

									</c:choose>
								</c:forEach>
							 	 </ul>
								<%-- float clear용 빈 div --%>
								<div style="clear: both;"></div>
						 		</div>
								</div>
								
  					   		</div>
  					   		
  	</section>				   		