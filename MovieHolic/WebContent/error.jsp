<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<body class="left-sidebar is-preload">
<div id="page-wrapper">
<%-- Header --%>
	<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
<%@ include file="/template/nav.jsp"%>
	</div>


<%-- Main --%>
<div class="wrapper style1">

	<div class="container" style="text-align: center; margin-bottom: 10em;">
		<img src="images/error.png" height="200vh" style="margin-bottom: 5em;">
		<h3 style="margin-bottom: 1em;">죄송합니다. 요청하신 페이지를 잧을 수 없습니다.</h3>
		<h5>존재하지 않는 주소를 입력하셨거나,</h5>
		<h5>요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</h5>
	</div>
</div>

<%@ include file="/template/footer.jsp" %>