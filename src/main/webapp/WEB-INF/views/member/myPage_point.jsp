<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="/resources/css/myPage_recipe.css">
</head>
<body>
	
	
			<table class="table">
			<tbody>
			<c:forEach items="${pList}" var="pList" varStatus="i">
				<tr>
					<td>${rcList.pointDate }</td>
					<td>${pList.pointDetail}</td>
					<td>${rcList.usingPoint }</td>

				</tr>
			</c:forEach>
			</tbody>

			
		</table>
</body>
</html>