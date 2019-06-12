<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="mv" items="${requestScope.list}">
<tr>
	<td><img src="${mv.movieImage}" alt="${mv.movieImage}" width="115vh" data-movieNm="${mv.movieNm}" data-movieCdYoung="${mv.movieCdYoung}" data-movieCdNaver="${mv.movieCdNaver}" data-prdtYear="${mv.prdtYear}"></td>
	<td style="vertical-align: middle;">${mv.movieNm}</td>
	<td style="vertical-align: middle; text-align: center;">${mv.prdtYear}</td>
</tr>
</c:forEach>