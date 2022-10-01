<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 레시피 관리</title>

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/myPage.css">
	<link rel="stylesheet" href="/resources/css/myPage_recipe.css">
	<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<body>

<header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="/resources/images/logo.png"></a></h1>
            <nav class="main-navigation">
                <a href="#"><i class="fa-solid fa-magnifying-glass icon"></i></a>
                <a href="/myRecipe/list"><i class="fa-solid fa-star icon"></i></a>
                <a href="/member/joinView.kh"><i class="fa-regular fa-user icon"></i></a>
            </nav>
        </div>
    </header>
	    <nav class="sidebar">
        <div class="menu-bar">
            <div class="menu">
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="/member/myPage.kh">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">회원정보 조회</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="/member/myPageModifyView.kh">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">회원정보 수정</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="/member/callMyRecipe.kh">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">작성 레시피 관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="/member/callMyComment.kh">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">작성 댓글 관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="/member/callPoint.kh">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">포인트 내역 조회</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#" onclick="removeMember();">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">탈퇴하기</span>
                        </a>
                    </li>
                <li>
                    <a href="/member/logout.kh">
                        <i class='bx bx-log-out icon'></i>
                        <span class="text nav-text">로그아웃</span>
                    </a>
                </li>
				</ul>
            </div>
        </div>
    </nav>
    
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