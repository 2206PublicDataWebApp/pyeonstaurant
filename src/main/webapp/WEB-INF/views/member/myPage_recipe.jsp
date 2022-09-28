<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/myPage_recipe.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<section class="main-content">
	<div class="container">
		<table class="table">
			<tbody>
				<c:forEach items="${rList}" var="recipe" varStatus="i">
					<tr>
						<td>
							<div class="recipe-info">
								<div class="recipe-info__img">
									<img src="/resources/recipeImg/${recipe.mainPicRename }">
								</div>
								<div class="recipe-info__basic">
									<h5 class="mb-0"><a href="/recipe/detail.do?recipeNo=${recipe.recipeNo }">${recipe.recipeName }</a></h5>
									<p class="text-muted mb-0">${recipe.recipeInfo }</p>
								</div>
							</div>
						</td>
						<td class="date">${recipe.updateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</section>
</body>
</html>