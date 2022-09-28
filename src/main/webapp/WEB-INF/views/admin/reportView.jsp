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

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/dashboard/">

<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/swiper.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />



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

a{
	text-decoration:none;
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

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">편스토랑 관리자페이지</a>
		<!-- Sidebar Toggle-->
		<!-- 		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" -->
		<!-- 			id="sidebarToggle" href="#!"> -->
		<!-- 			<i class="fas fa-bars"></i> -->
		<!-- 		</button> -->

		<!-- Navbar-->
		<!-- 		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4"> -->
		<!-- 			<li class="nav-item dropdown"><a -->
		<!-- 				class="nav-link dropdown-toggle" id="navbarDropdown" href="#" -->
		<!-- 				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i -->
		<!-- 					class="fas fa-user fa-fw"></i></a> -->
		<!-- 				<ul class="dropdown-menu dropdown-menu-end" -->
		<!-- 					aria-labelledby="navbarDropdown"> -->
		<!-- 					<li><a class="dropdown-item" href="#!">Settings</a></li> -->
		<!-- 					<li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
		<!-- 					<li><hr class="dropdown-divider" /></li> -->
		<!-- 					<li><a class="dropdown-item" href="#!">Logout</a></li> -->
		<!-- 				</ul></li> -->
		<!-- 		</ul> -->
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">


						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>

							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">메뉴</div>
						<a class="nav-link" href="/report/reportAdmin">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 신고 관리
						</a> <a class="nav-link" href="/admin/memberAdminList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="/admin/boardList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 게시판 관리
						</a> <a class="nav-link" href="/admin/chattingList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 채팅 관리
						</a> 
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">편스토랑</div>
					관리자 페이지
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<h3 style="margin-top: 20px; margin-left: 20px; margin-bottom: 20px;">신고
				목록</h3>


			<div class="container-fluid px-5">


				<div class="card mb-5">


					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>레시피 번호</th>
									<th>신고내용</th>
									<th>신고자</th>
									<th>날짜</th>
									<th>처리 상태</th>
									<th>처리 확인</th>
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
											<td><button class="btn  btn-outline-primary output"  style="margin-left:15px;">
													<a
														href="/report/successRecipe?recipeNo=${report.recipeNo }">확인</a>
												</button></td>
										</tr>
									</c:forEach>
									<c:if test="${!empty rList }">
										<tr align="center">
										<td colspan="6"><nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center">
													<c:if test="${currentPage != 1 }">
														<a class="page-link"
															href="/report/reportAdmin?page=${currentPage - 1 }">이전</a>
													</c:if>
													
													<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
													<c:if test="${currentPage eq p }">
															<li class="page-item">${p }</a></li>
														</c:if>
														<c:if test="${currentPage ne p }">
															<li class="page-item"><a class="page-link"
																href="/report/reportAdmin?page=${p }">${p }</a></li>
														</c:if>
													</c:forEach>
													<c:if test="${maxPage > currentPage }">
														<a class="page-link"
															href="/report/reportAdmin?page=${currentPage + 1 }">다음</a>
													</c:if>
													</li>
												</ul>
											</nav>
											</td>
									</tr>
										
										
										
										
										
									</c:if>
								</c:if>
							</tbody>
						</table>

						<table class="table table-hover">
							<thead>
								<tr>
									<th ">댓글
										번호</th>
									<th>신고내용</th>
									<th>신고자</th>
									<th>날짜</th>
									<th>처리상태</th>
									<th>처리
										확인</th>
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
											<td><button class="btn  btn-outline-primary output"  style="margin-left:15px;">
													<a
														href="/report/successComment?commentNo=${comment.commentNo }">확인</a>
												</button></td>
									</c:forEach>
									<c:if test="${!empty cList }">
										<tr align="center">
										<td colspan="6"><nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center">
													<c:if test="${currentPage2 != 1 }">
														<a class="page-link"
															href="/report/reportAdmin?page=${currentPage2 - 1 }">이전</a>
													</c:if>
													
													<c:forEach var="p" begin="${startNavi2 }" end="${endNavi2 }">
													<c:if test="${currentPage2 eq p }">
															<li class="page-item">${p }</a></li>
														</c:if>
														<c:if test="${currentPage2 ne p }">
															<li class="page-item"><a class="page-link"
																href="/report/reportAdmin?page=${p }">${p }</a></li>
														</c:if>
													</c:forEach>
													<c:if test="${maxPage2 > currentPage2 }">
														<a class="page-link"
															href="/report/reportAdmin?page=${currentPage2 + 1 }">다음</a>
													</c:if>
													</li>
												</ul>
											</nav>
											</td>
									</tr>	
									</c:if>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="footer_inner">
					<div class="footer_content_first">
						<div class="footer_content left">
							<p class="title">고객센터</p>
							<p class="tel">02-123-4567</p>
							<p class="work_time">오전 10시 ~ 오후 5시 (주말, 공휴일 제외)</p>
							<div>
								<button>1:1 문의하기</button>
								<button><a href="/notice/list"></a>공지사항</button>
							</div>
						</div>

						<div class="footer_content right">
							<p class="title">(주)편스토랑</p>
							<div class="content_link">
								<ul>
									<li><a href="#">개인정보처리방침</a></li>
									<li class="hr">&nbsp;</li>
									<li><a href="#">이용약관</a></li>
									<li class="hr">&nbsp;</li>
									<li><a href="/notice/list">공지사항</a></li>
									<li class="hr">&nbsp;</li>
									<li><a href="#">Q &amp;A</a></li>
								</ul>
							</div>

							<p class="footer_content_sub_txt">
								법인명 : (주)편스토랑 | 사업자등록번호 : 000-00-00000 | 벤처기업 : 제 20220923103호 <br>특허
								제 00-000000호 | 통신판매업신고 : 2022-서울종로구-0000 | 개인정보보호책임자 : 송신애 <br>주소
								: 서울 종로구 어딘가 159, KH 정보교육원 3층 | 대표이사 : 공석 <br>제휴/협력 문의 :
								asdf@asdf.com |
							</p>
						</div>
					</div>
				</div>
			</footer>

		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script src="/resources/js/swiper.js"></script>
</body>
</html>