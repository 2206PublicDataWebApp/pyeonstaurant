<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th></th>
			<th>번호</th>
			<th>마이 레시피</th>
			<th>카테고리</th>
		</tr>
<%-- 		<c:forEach items="${ }" var="" varStatus="i"> --%>
<!-- 		<tr> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
<%-- 		</c:forEach>		 --%>
	</table>
		<button><a href="/myRecipe/remove?recipeNo=${myRecipe.recipeNo }"></a></button>
	
</body>
</html>