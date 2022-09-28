<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/myPage_recipe.css">
</head>
<body>

		<table class="table">
			<tbody>
			<c:forEach items="${rcList}" var="rcList" varStatus="i">
				<tr>
					<td>${rcList.recipeNo}</td>
					<td>${rcList.commentContents }</td>
					<td>${rcList.commentDate }</td>
				</tr>
			</c:forEach>
			</tbody>

			
		</table>

</body>
</html>