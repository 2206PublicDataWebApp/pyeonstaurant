<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>편스토랑</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
<body>
    <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu" ></a></h1>
            <nav class="main-navigation">
                <a href="#" class="header-search"><img src="/resources/images/header_search.svg"></a>
                <a href="#" class="header-cart"><img src="/resources/images/header_cart.svg"></a>
                
                <c:if test="${sessionScope.loginUser eq null  }">
                <a href="/member/joinView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
                
                <c:if test="${not empty loginUser }">
                <a href="/member/myPageView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
        
                
            </nav>
        </div>
    </header>

    <nav class="board-navigation">
        <div class="board-container">
            <ul>
                <li><a href="#">식사</a></li>
                <li><a href="#">술안주</a></li>
                <li><a href="#">간식</a></li>
                <li><a href="#">음료/술</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>