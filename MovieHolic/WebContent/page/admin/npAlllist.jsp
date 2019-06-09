<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="np" value="${requestScope.np}" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script>
	// 예시.
	/* $(function() {
	 $('.page_notify>a').click(function() {
	 var currentPage = $(this).attr("href");
	 $(".notify_search_result").empty();
	 $.ajax({
	 url : '/MovieHolic/admin?notify=notify&' + currentPage,
	 method : 'get',
	 /* data : 'alllist=' + alllist,  *//*
				success : function(result) {
					$(".notify_search_result").html(result.trim());
				}
			});
		return false;
		});
	}); */
</script>



<table class="table" style="border-bottom: 0.2em solid #fff;">
	<br>
	<thead>
		<tr>
			<th></th>
			<th>글번호</th>
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
				<td>
					<%-- <c:if test="${ap.joinDate == null}">이게 왜 안나올까</c:if> --%> <input
					type="checkbox" class="np_checkbox" name="np_checkbox"
					value="${np.userId}" />
				</td>
				<td>${np.seq }</td>
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


		<c:if test="${np.startPage > 1 }">
			<span class="page_notify"> <a href="${np.startPage - 1}"><button
						class="btn btn-success">이전</button></a>
			</span>

		</c:if>


	</div>

	<div class="col-lg-2"></div>

	<div class="col-lg-4">
		<ul class="pagination"
			style="width: 240px; margin-left: auto; margin-right: auto;">

			<c:forEach begin="${np.startPage}" end="${np.endPage}" var="i">
				<c:choose>

					<c:when test="${np.currentPage == i}">
						<li class="page-item"><span><a class="page-link">${i}</a></span></li>
					</c:when>

					<c:otherwise>
						<li class="page-item"><span class="page_notify"><a
								class="page-link" href="${i}">${i}</a></span></li>
					</c:otherwise>

				</c:choose>
			</c:forEach>

		</ul>
	</div>

	<div class="col-lg-2"></div>

	<div class="col-lg-2">
		<c:if test="${np.totalPage > np.endPage }">

			<span class="page_notify"> <a href="${np.endPage+1}"><button
						class="btn btn-success">다음</button></a>
			</span>

		</c:if>
	</div>
</div>