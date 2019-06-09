<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ap" value="${requestScope.ap}" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script>
	$(function() {
		
		$(".page>a").click(function() {
			var currentPage = $(this).attr("href");
			$.ajax({
				url : '/MovieHolic/admin?act=unsubscribelist&' + 'currentPage=' + currentPage ,
				method : 'get',
				/* data : 'alllist=' + alllist,  */
				success : function(result) {
					$("div.wrapper>div.container>div.member_search_result").html(result.trim());
				}
			});
			return false;
		});
		
	});
	
	
	//$(document).on("click", "#check-all", function() {
$("#check-all").click(function() { // 전체 선택 버튼 클릭시

	$(":input[name=chk]").prop("checked", true)

		/* if ($(":input[name=chk]").prop("checked", true)) {
			$(":input[name=chk]").prop("checked", false);
		} else if ($(":input[name=chk]").prop("checked", false)) {
			$(":input[name=chk]").prop("checked", true);
		} */

	return false;

});

	
	
</script>


<table class="table" style="border-bottom: 0.2em solid #fff;">
	<br>
	<thead>
		<tr>
			<th></th>
			<th>회원ID</th>
			<th>이름</th>
			<th>주민번호 앞자리</th>
			<th>연락처</th>
			<th>성별</th>
			<th>가입일</th>
			<th>탈퇴일</th>
			<th></th>
		</tr>
	</thead>
	<tbody>

		<c:forEach var="ap" items='${ap.list}'>
			<tr>
				<td></td>
				<td>${ap.userId}</td>
				<td>${ap.name }</td>
				<td>${ap.birth }</td>
				<td>${ap.phoneFirst }- ${ap.phoneMid } - ${ap.phoneLast }</td>
				<td>${ap.gender }</td>
				<td>${ap.joinDate }</td>
				<td>${ap.outdate }</td>
				<td></td>
			</tr>
		</c:forEach>
	</tbody>
</table>




<div class="row">

	<div class="col-lg-2">


		<c:if test="${ap.startPage > 1 }">
			
				<span class="page">
					<a href="${ap.startPage - 1}"><button class="btn btn-success">이전</button></a>
				</span>
			
		</c:if>


	</div>


	<div class="col-lg-2"></div>

	<div class="col-lg-4">
		<ul class="pagination"
			style="width: 240px; margin-left: auto; margin-right: auto;">

			<c:forEach begin="${ap.startPage}" end="${ap.endPage}" var="i">
				<c:choose>

					<c:when test="${ap.currentPage == i}">
						<li class="page-item"><span><a class="page-link">${i}</a></span></li>
					</c:when>

					<c:otherwise>
						<li class="page-item"><span class="page"><a class="page-link"
								href="${i}">${i}</a></span></li>
					</c:otherwise>

				</c:choose>
			</c:forEach>

		</ul>
	</div>



	<div class="col-lg-2"></div>





	<div class="col-lg-2">

		<c:if test="${ap.totalPage > ap.endPage }">
			
				<span class="page">
					<a href="${ap.endPage+1}"><button class="btn btn-success">다음</button></a>
				</span>
			
		</c:if>

	</div>


</div>

