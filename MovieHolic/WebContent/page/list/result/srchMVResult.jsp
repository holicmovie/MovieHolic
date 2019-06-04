<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
<%-- #### 영화 검색 모달(검색기능) #### --%>
	<%-- 영화 검색 모달의 행 선택시 --%>
	$(document).on("click", '#modalTable tr', function() {		<%-- 동적으로 생성된 요소에 이벤트 주는 방법 --%>
		<%-- 선택한 행의 img태그 객체 얻어오기 --%>
		var $mv = $(this).find('img');
		<%-- 포스터 및 영화정보전달용 hidden 추가 --%>
		/* var $poster = $('<img class="movieImg" src="' + movieImage + '" data-movieNm="' + movieNm + '" data-movieCdYoung="' + movieCdYoung + '" data-movieCdNaver="' + movieCdNaver + '"  data-prdtYear="' + prdtYear + '">'); */ 
		$('#addMovie').before(
				'<img class="movieImg" src="' + $mv.attr("src") + '">'
				+ '<input type="hidden" name="movieNm" value="' + $mv.attr("data-movieNm") + '">'
				+ '<input type="hidden" name="movieCdYoung" value="' + $mv.attr("data-movieCdYoung") + '">'
				+ '<input type="hidden" name="movieCdNaver" value="' + $mv.attr("data-movieCdNaver") + '">'
				+ '<input type="hidden" name="prdtYear" value="' + $mv.attr("data-prdtYear") + '">'
		);
		modalClear();		
	})
</script>
<c:forEach var="mv" items="${requestScope.list}">
<tr>
	<td><img src="${mv.movieImage}" alt="${mv.movieImage}" height="100vh" data-movieNm="${mv.movieNm}" data-movieCdYoung="${mv.movieCdYoung}" data-movieCdNaver="${mv.movieCdNaver}" data-prdtYear="${mv.prdtYear}"></td>
	<td style="vertical-align: middle;">${mv.movieNm}</td>
	<td style="vertical-align: middle; text-align: center;">${mv.prdtYear}</td>
</tr>
</c:forEach>
