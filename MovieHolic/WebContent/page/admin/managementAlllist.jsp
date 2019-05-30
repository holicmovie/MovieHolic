<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="AdminDto" value="${requestScope.AdminDto}" />

<table class="table" style="border-bottom: 0.2em solid #fff;">
						<br>
						<thead>
							<tr>
								<th>
									<div>
										<button type="submit" class="btn btn-success"
											style="z-index: 0;">전체선택</button>
									</div>
								</th>
								<th>회원ID</th>
								<th>이름</th>
								<th>주민번호 앞자리</th>
								<th>연락처</th>
								<th>성별</th>
								<th>가입일</th>
								<th>탈퇴일</th>
								<th>휴면여부</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="Dto" items='${AdminDto}'>
							<tr>
								<td><input type="checkbox" /></td>
								<td>${Dto.userId }</td>
								<td>${Dto.name }</td>
								<td>${Dto.birth }</td>
								<td>${Dto.phoneFirst }-${Dto.phoneMid }-${Dto.phoneLast }</td>
								<td>${Dto.gender }</td>
								<td>${Dto.joinDate }</td>
								<td>${Dto.outdate }</td>
								<td>
									<div>
										<button type="button" class="btn btn-success dropdown-toggle"
											data-toggle="dropdown">활동</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">휴면</a>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>