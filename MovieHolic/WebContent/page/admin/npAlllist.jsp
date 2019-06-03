<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:set var="np" value="${requestScope.np}" />


<table class="table" style="border-bottom: 0.2em solid #fff;">
						<br>
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>분류</th>
								<th>작성자ID</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일</th>
								<th>신고수</th>
							</tr>
						</thead>
						<tbody>
						
						
							<c:forEach var="np" items='${np.list}'>
								<tr>
									<td><input type="checkbox" /></td>
									<td>${np.row }</td>
									<td>${np.boardName }</td>
									<td>${np.userId }</td>
									<td>${np.subject }</td>
									<td>${np.content }</td>
									<td>${np.postDate }</td>
									<td>${np.notify }</td>
								</tr>
							</c:forEach>	
							
							
						</tbody>
					</table>


					<div class="row">


						<div class="col-lg-2">
							<button type="submit" class="btn btn-success">이전</button>
						</div>

						<div class="col-lg-2"></div>

						<div class="col-lg-4">
							<ul class="pagination"
								style="width: 240px; margin-left: auto; margin-right: auto;">
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
							</ul>
						</div>

						<div class="col-lg-2"></div>

						<div class="col-lg-2">
							<button type="submit" class="btn btn-success">다음</button>
						</div>
					</div>



				</div>