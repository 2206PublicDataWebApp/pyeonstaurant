<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>Dashboard Template · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/dashboard/">





<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.2/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


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

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.reportAdmin {
	color: red;
	font-style: inherit;
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>
<body>

	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-1 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">편스토랑
			관리자페이지</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- <input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search"> -->
		<div class="navbar-nav">
			<div class="nav-item text-nowrap">
				<a class="nav-link px-3" href="#">Sign out</a>
			</div>
		</div>
	</header>

	 <div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3 sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item reportBlock"><a
							class="nav-link active reportAdmin" aria-current="page"
							href="/report/reportAdmin"> <span data-feather="home"
								class="align-text-bottom"></span> 신고 관리
						</a></li>
						<li class="nav-item"><a class="nav-link reportAdmin"
							href="/admin/memberAdminList"> <span data-feather="file"
								class="align-text-bottom"></span> 회원 관리
						</a></li>
						<li class="nav-item"><a class="nav-link reportAdmin"
							href="/admin/boardList"> <span data-feather="shopping-cart"
								class="align-text-bottom"></span> 게시글 관리
						</a></li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">신고 관리</h1>
					<div class="btn-toolbar mb-2 mb-md-0"></div>
				</div>
				<form action="" method="post">
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchCondition" class="form-control">
								<option>이메일</option>
								<option>닉네임</option>
							</select>
						</div>

						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" placeholder="검색어를 입력해주세요" name="memberInfo"
									class="form-control"> <span class="input-group-btn">
									<input type="submit" value="검색" class="btn btn-default">
								</span>
							</div>
						</div>
				</form>
				<h3 style="margin-top: 20px">신고 현황</h3>

				<div class="table-responsive">
					<table class="table"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">레시피 번호</th>
								<th style="background-color: #eeeeee; text-align: center;">신고내용</th>
								<th style="background-color: #eeeeee; text-align: center;">신고자</th>
								<th style="background-color: #eeeeee; text-align: center;">날짜</th>
								<th style="background-color: #eeeeee; text-align: center;">처리 상태</th>
								<th style="background-color: #eeeeee; text-align: center;">처리 확인</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty rList }">
								<c:forEach items="${rList }" var="report" varStatus="i">								
								<tr>
									<td>${report.recipeNo }</td>
									<td>레시피 관련 신고</td>
									<td>${report.memberEmail }</td>
									<td>${report.reportDate }</td>											
									<td>${report.reportResult }</td>
									<td><button><a href="/report/successRecipe?recipeNo=${report.recipeNo }">확인</a></button></td>
								</tr>
								</c:forEach>              		
                            <c:if test="${!empty rList }">
                                <tr align="center" height="20">
                                    <td colspan="6"><c:if test="${currentPage != 1 }">
                                            <a href="/report/reportRecipe?page=${currentPage - 1 }">[이전]</a>
                                        </c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
                                            <c:if test="${currentPage eq p }">
                                                <b>${p }</b>
                                            </c:if>
                                            <c:if test="${currentPage ne p }">
                                                <a href="/report/reportRecipe?page=${p }">${p }</a>
                                            </c:if>
                                        </c:forEach> <c:if test="${maxPage > currentPage }">
                                            <a href="/report/reportRecipe?page=${currentPage + 1 }">[다음]</a>
                                        </c:if></td>
                                </tr>
                            </c:if>
                        </c:if>
						</tbody>
					</table>
					
					<table class="table"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">댓글 번호</th>
								<th style="background-color: #eeeeee; text-align: center;">신고내용</th>
								<th style="background-color: #eeeeee; text-align: center;">신고자</th>
								<th style="background-color: #eeeeee; text-align: center;">날짜</th>
								<th style="background-color: #eeeeee; text-align: center;">처리상태</th>
								<th style="background-color: #eeeeee; text-align: center;">처리 확인</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty cList }">
								<c:forEach items="${cList }" var="comment" varStatus="i">								
								<tr>
									<td>${comment.commentNo }</td>
									<td>댓글 관련 신고</td>
									<td>${comment.memberEmail }</td>
									<td>${comment.reportDate }</td>											
									<td>${comment.reportResult }</td>
									<td><button><a href="/report/successComment?commentNo=${comment.commentNo }">확인</a></button></td>
								</c:forEach>              		
                            <c:if test="${!empty cList }">
                                <tr align="center" height="20">
                                    <td colspan="6"><c:if test="${currentPage2 != 1 }">
                                            <a href="/report/reportRecipe?page=${currentPage2 - 1 }">[이전]</a>
                                        </c:if> <c:forEach var="p" begin="${startNavi2 }" end="${endNavi2 }">
                                            <c:if test="${currentPage2 eq p }">
                                                <b>${p }</b>
                                            </c:if>
                                            <c:if test="${currentPage2 ne p }">
                                                <a href="/report/reportRecipe?page=${p }">${p }</a>
                                            </c:if>
                                        </c:forEach> <c:if test="${maxPage2 > currentPage2 }">
                                            <a href="/report/reportRecipe?page=${currentPage2 + 1 }">[다음]</a>
                                        </c:if></td>
                                </tr>
                            </c:if>
                        </c:if>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>

<script>
	
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script src="dashboard.js"></script>
</body>
</html>