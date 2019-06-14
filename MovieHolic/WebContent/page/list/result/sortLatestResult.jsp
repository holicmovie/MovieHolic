<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="boardList" value="${requestScope.boardList}"/>
<c:set var="flList" value="${requestScope.flList}"/>
<c:set var="boardCnt" value="${fn:length(boardList)}"/>
<c:if test="${boardCnt > 0}">
<c:forEach begin="0" end="${boardCnt-1}" var="i">
	<c:set var="filmList" value="${flList[i]}"/>
	<c:set var="filmCnt" value="${fn:length(boardList[i].movieCodeNaver)}"/>
<tr style="border: 2px solid; border-color: white;">
	<td style="text-align: center;">
		<input type="hidden" value="list?act=listDetail&seq=${boardList[i].seq}">
		<div class="interated_network_movie_info_img">
			<span class="movie_ranking_number" id="rankNum">${filmCnt}</span>
			<img width="100vh" src="${filmList[0].movieImage}" style="position: absolute; z-index: 0;" >
			<img width="100vh" src="${filmList[1].movieImage}" style="position: relative; left: 70px; z-index: 0;" >
			<img class="hide2" width="100vh" src="${filmList[2].movieImage}" style="position: relative; left: 40px; z-index: 0;" >
			<img class="hide1" width="100vh" src="${filmList[3].movieImage}" style="position: relative; left: 5px; z-index: 0;" >
		</div>
	</td>
	<td style="vertical-align: middle; color: white;">
		<div>
			<h4>${boardList[i].subject}</h4>
			<p>by ${boardList[i].userId} | ${boardList[i].postDateY} | 💕${boardList[i].best} | 💔${boardList[i].worst}</p>
		</div>
	</td>
</tr>
</c:forEach>
</c:if>