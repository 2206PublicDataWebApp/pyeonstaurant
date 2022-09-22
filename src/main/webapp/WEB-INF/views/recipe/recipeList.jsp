<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피 리스트</title>
</head>
<body>
		<table>
			<tr>
				<td>레시피번호</td>
				<td>레시피이름</td>
				<td>레시피사진</td>
				<td>레시피설명</td>
			</tr>
				
	<c:forEach items="${rList}" var="recipe" varStatus="i">
			<tr>
				<td>${recipe.recipeNo }</td>
				<td><a href="/recipe/detail.do?recipeNo=${recipe.recipeNo }">${recipe.recipeName }</a></td>
				<td><img src="/resources/recipeImg/${recipe.mainPicRename }"></td>
				<td>${recipe.recipeInfo }</td>
				
			</tr>
			
	</c:forEach>
			
		</table>



</body>
</html>