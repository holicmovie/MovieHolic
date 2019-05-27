<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Movie Holic</title>
<meta charset="utf-8" />
<%-- template --%>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<%-- jQuery library --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- 구글 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<style>
/* 폰트 */
/* 굵은 글씨 대 중 소 */
.font_bold_small {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 17px;
}

.font_bold_mid {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 25px;
}

.font_bold_lg {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 30px;
}

/* 얇은 글씨 대 중 소 */
.font_light_small {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	font-size: 17px;
}

.font_light_mid {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	font-size: 25px;
}

.font_light_lg {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	font-size: 30px;
}

/* 프로필 사진 */
.profile_icon {
	width: 45px;
	height: 45px;
	border-radius: 25px; /* 이미지 반크기만큼 반경을 잡기*/
	border: 2px solid white;
}
</style>