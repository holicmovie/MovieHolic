<%@page import="com.kitri.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.kitri.dto.film.PageBeanReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// [페이지에 맞는 리뷰 목록]
PageBeanReview pb = (PageBeanReview) request.getAttribute("reviews");
List<BoardDto> reviews = pb.getList();
// 리뷰 총 수
int reviewTotalLen = pb.getTotalCnt();
// 현재 페이지의 리뷰 수
int reviewLen = reviews.size();

int currentPage = pb.getCurrentPage();				 // 현재 페이지 index
int startPage = pb.getStartPage();					 // 시작 페이지 index
int endPage = pb.getEndPage();						 // 끝 페이지 index

int cntPerPage = pb.getCntPerPage();				 // 한 페이지 내에 보여줄 최대 행 개수
int totalPage = pb.getTotalPage();					 // 모든 페이지 개수
int cntPerPageGroup = pb.getCntPerPageGroup();		 // 페이지 그룹 개수

// [페이지 눌릴 시, 사용할 영화코드]
String movieCdYoung = (String) request.getAttribute("movieCdYoung");
%>  

				<div class="row">
				<div class="col-lg-12 col-mobile-12 font_bold_lg top_margin_lg" style="margin-bottom: 1em;">
					<span>REVIEWS</span> (<span id="commentcount"><%=reviewTotalLen%></span>)
					<!-- 구분선 -->
					<hr class="line_bold">
				</div>
				</div>
					
				<div class="row">
					
					<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0; width:200px;">
<%
if(reviewLen>0){

	for(int i = 0; i < reviewLen; i ++){
		
		/* --------------------------------------------------------------------------------------------------- */
%>
						<tr>
							<td class="reviewitems" style="vertical-align: middle; border-top:0px; border-bottom:1px solid white;" seq="<%=reviews.get(i).getSeq()%>">
								<a href="/MovieHolic/mypage?page=viewuserinfo&userid=<%=reviews.get(i).getUserId()%>">
									<img id="replywriter" class="profile_icon" alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a> 
								<a href="/MovieHolic/mypage?page=viewuserinfo&userid=<%=reviews.get(i).getUserId()%>" id="replywriterId" class="font_bold_small" style="color: white; margin-right: 15px;"><%=reviews.get(i).getUserId()%></a>
								<span style="font-size: 1em;margin-right: 15px;">
<%
		for(int j =1;j<=reviews.get(i).getStarPoint(); j++){
%>
												<i class="fas fa-star" style="color: #ffca08;"></i>
<%
		} 
		for(int j = 1; j<=5-reviews.get(i).getStarPoint(); j++){ 
%>
												<i class="fas fa-star" style="color: #222222;"></i>
<%
		}
%>
							</span>
							 
							<span><%=reviews.get(i).getPostDate()%></span>
							<br> 
							
							<span style="display: block; width:1200px;">
							<%=reviews.get(i).getContent()%>
							</span>
							
							</td>
						</tr>
						
<%
	}

}
%>
						
						</table>

					<%--pagination처리 --%>
					<div class="col-lg-12">
					
<%
// 시작 페이지가 1이 아닌 경우만 '이전' 표시
if(startPage != 1) {
%>
						<div style="float: left">
							<button class="btn btn-success font_bold_small test" movieCdYoung="<%=movieCdYoung%>" data-page="<%=startPage-1%>">이&nbsp;&nbsp;&nbsp;전</button>
						</div>
<%		
}

if(endPage != totalPage){
%>
						<div style="float: right">
							<button class="btn btn-success font_bold_small test" movieCdYoung="<%=movieCdYoung%>" data-page="<%=endPage+1%>">다&nbsp;&nbsp;&nbsp;음</button>
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
								<a class="page-link a test" href="#" movieCdYoung="<%=movieCdYoung%>" data-page="<%=startPage+i%>"><%=startPage+i%></a>
							</li>
<%
    }
}
%>
						</ul>
						<%-- float clear용 빈 div --%>
						<div style="clear: both;"></div>
					</div>
				</div>