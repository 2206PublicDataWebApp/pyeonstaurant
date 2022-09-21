<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>카테고리</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>작성일</td>			
		</tr>
		
	<c:forEach items="${qList }" var="qList">	
		<tr>

		<td>
		
		<c:if test="${qList.qaCategory eq 'Qsystem'}">시스템 문의</c:if>
		<c:if test="${qList.qaCategory eq 'Qrecipe'}">레시피 문의</c:if>
		<c:if test="${qList.qaCategory eq 'Qother'}">기타 문의</c:if>
			</td>
			
			
			
			<td>${qList.qaNo}
			<a href="/qna/detail.do?qaNo=${qList.qaNo}">
			<c:if test="${qList.qaSecret == true}">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
			  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
			</svg>
			</c:if>
			${qList.qaTitle }
			</a>
			</td>
			<td>${qList.memberEmail }</td>
			<td>${qList.qaInsertDate }</td>			
		</tr>
		</c:forEach>
		
	</table>

</body>
</html>