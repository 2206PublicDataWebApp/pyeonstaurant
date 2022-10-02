<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<script src="/resources/js/myPage.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/myPage.css">
	<link rel="stylesheet" href="/resources/css/myPage_recipe.css">
	<link rel="stylesheet" href="/resources/css/myPage_comment.css">
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
		<div class="container">
		<table class="table">
			
				<thead>
				<tr>
					<th>레시피 넘버</th>
					<th>댓글 내용</th>
					<th>댓글 날짜</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${rcList}" var="rcList" varStatus="i">
				<tr>
					<td>${rcList.recipeNo}</td>
					<td><a href="/recipe/detail.do?recipeNo=${rcList.recipeNo}#reply-area">${rcList.commentContents }</a></td>
					<td>${rcList.commentDate }</td>
				</tr>
			</c:forEach>
			</tbody>

			
		</table>
</div>
</body>
</html>