<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/MovieHolic/assets/css/main.css" />
<style>
<%-- nav 배경색지정 및 고정 --%>
#nav {
	background-color: rgb(3, 39, 49);
	position: fixed;
	
}
<%-- 창 크기 줄였을 때 메뉴 공백 제거 --%>
@media screen and (max-width: 1500px) {
	#nav .none {
		display: none; 
	}
	#navPanel .link.depth-0:nth-child(2), #navPanel .link.depth-0:nth-child(3),
	#navPanel .link.depth-0:nth-child(4), #navPanel .link.depth-0:nth-child(5),
	#navPanel .link.depth-0:nth-child(6), #navPanel .link.depth-0:nth-last-child(3) {
		display: none; 
	}
} 
</style>