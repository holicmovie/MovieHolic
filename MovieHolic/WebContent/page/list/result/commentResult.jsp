<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="comment" value="${requestScope.comment}"/>
<c:set var="cnt" value="${fn:length(comment)}"/>
<input type="hidden" id="commenCnt" data-cnt=${cnt}>
<c:forEach begin="0" end="${cnt-1}" var="i">
<tr>
	<td style="text-align: center">
		<a href="#"><img class="profile_icon" src="/MovieHolic/images/profile/${user[i].profile}"></a>
	</td>
	<td style="vertical-align: middle;">
		<div>${comment[i].userId}</div>
		<div>${comment[i].postDate}</div>
	</td>
	<td class="font_bold_small" style="vertical-align: middle;">${comment[i].content}</td>
	<td style="vertical-align: middle;">
	<c:if test="${sessionScope.userID != null }">
		<c:if test="${sessionScope.userID == comment[i].userId}">
	<button type="button" id="replydelete" class="close" style="color: white">&times;</button>
		</c:if>
	</c:if>
	</td>
</tr>
</c:forEach>