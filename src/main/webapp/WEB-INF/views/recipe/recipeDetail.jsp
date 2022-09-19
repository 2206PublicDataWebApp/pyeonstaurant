<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${recipe.recipeName }</title>
</head>
<body>
	<h1>${recipe.recipeName }</h1>
	<img src="/resources/recipeImg/${recipe.mainPicRename }">
	<br>
	<c:if test="${rTag.jmt }">
#jmt 
</c:if>
	<c:if test="${rTag.healthy }">
#건강한 
</c:if>
	<c:if test="${rTag.goodSpicy }">
#맛있게 매운 
</c:if>
	<c:if test="${rTag.full }">
#든든한 
</c:if>
	<c:if test="${rTag.soSpicy }">
#아주 매운 
</c:if>
	<c:if test="${rTag.sweet }">
#달콤한 
</c:if>
	<c:if test="${rTag.easy }">
#간편한 
</c:if>
	<c:if test="${rTag.party }">
#파티용 
</c:if>
	<br> 작성자 : ${recipe.memberEmail } ${recipe.recipeInfo }
	<c:forEach items="${rmList}" var="rmList">
재료: ${rmList.material}, 수량 : ${rmList.amount}
조리 시간 ${recipe.recipeTime }
<br>
	</c:forEach>

	<c:forEach items="${rsList }" var="rsList">
		<c:if test="${rsList.recipePicRename ne null }">
			<img src="/resources/recipeImg/${rsList.recipePicRename }">
			<br>
		</c:if>
		
			${rsList.recipeDescription }
		
		<br>
	</c:forEach>


<!-- 비디오 주소를 입력했을때만 : 비디오 출력이 안되서 입력시에 유효성 검사 필요-->	
	<c:if test="${recipe.recipeVideo ne null }">
	<iframe width="560" height="315" src="${recipe.recipeVideo}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</c:if>

	

</body>
</html>