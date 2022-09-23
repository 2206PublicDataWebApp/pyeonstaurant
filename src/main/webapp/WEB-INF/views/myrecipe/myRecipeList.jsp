<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ar" dir="rtl">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.88.1">
<title>편스토랑 장바구니</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


</head>
<body>
	<main>
		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">장바구니</h1>
				</div>
			</div>
		</section>

		<div class="album py-5 bg-light">
			<div class="container" id="justify-content">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 justify-content-end">
					<c:if test="${!empty mList }">
						<c:forEach items="${mList }" var="myRecipe" varStatus="i">
							
							<div class="col">
								<div class="card shadow-sm">
									<div style="display:none;">${myRecipe.recipeNo }</div>
<!-- 									<svg class="bd-placeholder-img card-img-top" width="100%" -->
<!-- 										height="225" role="img" preserveAspectRatio="xMidYMid slice" -->
<!-- 										focusable="false"> -->
									<img alt="본문이미지" src="/resources/buploadFiles/${myRecipe.mainPicture }" class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" preserveAspectRatio="xMidYMid slice">				
<!--             						</svg> -->
									<div class="card-body">
										<p class="card-text"></p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary"><a href="/myRecipe/remove?recipeNo=${myRecipe.recipeNo }">삭제</a></button>
											</div>
											
											<a href="/recipe/detail.do">
											<small class="text-muted">${myRecipe.recipeName }</small>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${!empty mList }">
						<tr align="center" height="20">
							<td colspan="6"><c:if test="${currentPage != 1 }">
									<a href="/myRecipe/list?page=${currentPage - 1 }">[이전]</a>
								</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
									<c:if test="${currentPage eq p }">
										<b>${p }</b>
									</c:if>
									<c:if test="${currentPage ne p }">
										<a href="/myRecipe/list?page=${p }">${p }</a>
									</c:if>
								</c:forEach> <c:if test="${maxPage > currentPage }">
									<a href="/myRecipe/list?page=${currentPage + 1 }">[다음]</a>
								</c:if></td>
						</tr>
					</c:if>
				</div>


			</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>

</body>
</html>
