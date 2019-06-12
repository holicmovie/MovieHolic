<%@page import="com.kitri.dto.film.PageBean"%>
<%@page import="com.kitri.dto.FilmDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// [페이지에 맞는 장르별 영화목록 결과]
String category = (String) request.getAttribute("cate");
PageBean pb = (PageBean) request.getAttribute("filmlist");
List<FilmDto> favoritefilm = pb.getList();
int size = favoritefilm.size();						 //한 페이지 내에 보여줄 실제 행 개수

int currentPage = pb.getCurrentPage();				 // 현재 페이지 index
int startPage = pb.getStartPage();					 // 시작 페이지 index
int endPage = pb.getEndPage();						 // 끝 페이지 index

int cntPerPage = pb.getCntPerPage();				 // 한 페이지 내에 보여줄 최대 행 개수
int totalPage = pb.getTotalPage();					 // 모든 페이지 개수
int cntPerPageGroup = pb.getCntPerPageGroup();		 // 페이지 그룹 개수

// [Context root]
String root = request.getContextPath();
%>

<%
for(int i = 0; i < size; i++) {
%>
					<!-- 총 영화 5개 -->
					<!-- 영화 한 개 start -->
					<div class="col-lg-2 col-4-mobile"
						style="float: left; margin: 0.5em 0.5em 0.5em 0.5em; padding: 2px; border: 2px solid; border-color: white;">
						
						<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=favoritefilm.get(i).getMovieCdYoung()%>&movieCdNaver=<%=favoritefilm.get(i).getMovieCdNaver()%>" class="image featured" style="margin: 0;">
							<img src="<%=favoritefilm.get(i).getMovieImage()%>" alt="<%=favoritefilm.get(i).getMovieNm()%> 포스터 이미지">
						</a>
						
						<header style="text-align: center; background-color: white; margin-top: 5px;">
							<h6 style="background-color: black;">
								<a style="font-size : 13px;" class="font_light_small" href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=favoritefilm.get(i).getMovieCdYoung()%>&movieCdNaver=<%=favoritefilm.get(i).getMovieCdNaver()%>"><%=favoritefilm.get(i).getMovieNm()%></a>
							</h6>
						</header>
						
					</div>
					<!-- 영화 한 개 end -->
<%
	}
%>
	<%-- float clear용 빈 div --%>
	<div style="clear: both;"></div>
				
	<!-- 페이징 처리 -->
	<div id="pagegroup" class="col-lg-12" style="margin-top : 80px; margin-bottom:80px; padding: 0 0 0 0;">
				
<%
// 시작 페이지가 1이 아닌 경우만 '이전' 표시
if(startPage != 1) {
%>
				<div style="float: left; padding-left: 1em;">
					<button cate="<%=category%>" con-url="filmlist" data-page="<%=startPage-1%>" class="btn btn-success font_bold_small test">이&nbsp;&nbsp;&nbsp;전</button>
				</div>
<%		
}

if(endPage != totalPage){
%>
				<div style="float: right; padding-right: 11em;">
					<button cate="<%=category%>" con-url="filmlist" data-page="<%=endPage+1%>" class="btn btn-success font_bold_small test">다&nbsp;&nbsp;&nbsp;음</button>
				</div>
<%		
}
%>

				<ul class="pagination justify-content-center">
<%
 // 페이지 그룹 개수(5)만큼 반복
for(int i = 0; i < cntPerPageGroup; i++) {
    // 마지막 페이지에서, 
    if(startPage+i <= totalPage){
%>
					<li class="page-item">
						<a cate="<%=category%>" con-url="filmlist" class="page-link a test" href="#" data-page="<%=startPage+i%>"><%=startPage+i%></a>
					</li>
<%
    }
}
%>
					
				</ul>
				
				</div>
