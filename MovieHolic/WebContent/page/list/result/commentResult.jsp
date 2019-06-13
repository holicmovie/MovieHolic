<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="comment" value="${requestScope.comment}"/>
<c:set var="cnt" value="${fn:length(comment)}"/>
<input type="hidden" id="commentCnt" data-cnt="${cnt}">
<c:if test="${fn:length(comment) > 0}">
	<c:forEach begin="0" end="${cnt-1}" var="i">
	<tr data-date="${comment[i].postDate}">
		<td style="text-align: center">
			<a href="#"><img class="profile_icon" src="/MovieHolic/images/profile/${user[i].profile}"></a>
		</td>
		<td style="vertical-align: middle;">
			<div>${comment[i].userId}</div>
			<div>${comment[i].postDate}</div>
		</td>
		<td class="font_bold_small" style="vertical-align: middle;">${comment[i].content}</td>
		<td style="vertical-align: middle;">
		<c:if test="${sessionScope.loginInfo != null }">
			<c:if test="${sessionScope.loginInfo == comment[i].userId}">
		<a href="#" id="modCommment" class="font-light-small" style="color: white;">수정&nbsp;&#124;</a>
		<a href="#" id="delCommment" class="font-light-small" style="color: white;">삭제</a>
			</c:if>
		</c:if>
		</td>
	</tr>
	</c:forEach>
</c:if>