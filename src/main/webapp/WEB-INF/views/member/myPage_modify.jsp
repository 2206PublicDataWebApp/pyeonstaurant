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
	<link rel="stylesheet" href="/resources/css/myPage_modify.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <header>
        <div class="header-container">
            <h1><a href="#"><img src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu"></a></h1>
            <nav class="main-navigation">
                <a href="#" class="header-search"></a>
                <a href="#" class="header-cart"></a>
                <a href="#" class="header-mypage"></a>
            </nav>
        </div>
    </header>
    
	    <nav class="sidebar">
        <header>
            <div class="image-text">
                <span class="image">
                    <!--<img src="logo.png" alt="">-->
                </span>

                <div class="text logo-text">
                    <span class="name">Codinglab</span>
                    <span class="profession">Web developer</span>
                </div>
            </div>
        </header>

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
                        <a href="#">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">작성 레시피 관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">작성 댓글 관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
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

                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="/member/logout.kh">
                        <i class='bx bx-log-out icon'></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>
            </div>
        </div>

    </nav>
    
    <main>
		<form action="/member/modifyNickname.kh" method="post">
			<input type="text" name="memberEmail" value="${loginUser.memberEmail }">
			<table>
				<tr>
					<td>닉네임</td>
					<td>
						<input type="text" name="memberNickname" value="${loginUser.memberNickname }">
					</td>
				</tr>				

				<tr>
					<td colspan="1" align="center">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
		
				<form action="/member/modifyPwd.kh" method="post">
			<table>
				<tr>
					<td> 비밀번호</td>
					<td>
						<input type="password" name="memberPwd">
					</td>
				</tr>			

				<tr>
					<td colspan="1" align="center">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
    </main>


</body>
</html>